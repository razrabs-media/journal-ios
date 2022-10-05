import Foundation
import SQLiteORM

class Storage {
    let storage: SafeStorage
    
    init(filepath: String) {
        let result = SafeStorage.create(filename: filepath,
                                        tables: Table<FeedItem>(name: "feed_items",
                                                                columns: Column(name: "uid", keyPath: \FeedItem.uid, constraints: primaryKey()),
                                                                Column(name: "name", keyPath: \FeedItem.name),
                                                                Column(name: "created_at", keyPath: \FeedItem.createdAtUnix),
                                                                Column(name: "updated_at", keyPath: \FeedItem.updatedAtUnix),
                                                                Column(name: "status", keyPath: \FeedItem.status),
                                                                Column(name: "order", keyPath: \FeedItem.order)),
        Table<TagItem>(name: "tags",
                       columns: Column(name: "uid", keyPath: \TagItem.uid, constraints: primaryKey()),
                       Column(name: "created_at", keyPath: \TagItem.createdAtUnix),
                       Column(name: "updated_at", keyPath: \TagItem.updatedAtUnix),
                       Column(name: "name", keyPath: \TagItem.name),
                       Column(name: "description", keyPath: \TagItem.description),
                       Column(name: "order", keyPath: \TagItem.order)),
        Table<TagItemToFeedItem>(name: "tags_to_feed",
                                 columns: Column(name: "tag", keyPath: \TagItemToFeedItem.tagItemUid),
                                 Column(name: "feed", keyPath: \TagItemToFeedItem.feedItemUid)))
        switch result {
        case .success(let safeStorage):
            self.storage = safeStorage
        case .failure(let error):
            fatalError(error.localizedDescription)
        }
    }
    
    func sync() {
        _ = storage.syncSchema(preserve: true)
    }
    
    func cache(feedItems: inout [FeedItem]) {
        _ = storage.beginTransaction()
        _ = storage.delete(all: FeedItem.self)
        for feedItemIndex in feedItems.indices {
            feedItems[feedItemIndex].order = feedItemIndex
            _ = storage.replace(feedItems[feedItemIndex])
            _ = storage.delete(all: TagItemToFeedItem.self, where_(\TagItemToFeedItem.feedItemUid == feedItems[feedItemIndex].uid))
            for tagItemIndex in feedItems[feedItemIndex].tags.indices {
                feedItems[feedItemIndex].tags[tagItemIndex].order = tagItemIndex
                _ = storage.replace(feedItems[feedItemIndex].tags[tagItemIndex])
                switch storage.count(all: TagItemToFeedItem.self) {
                case .success(let value):
                    print("TagItemToFeedItem count = \(value)")
                case .failure(let error):
                    print("error = \(error)")
                }
                let tagItemToFeedItem = TagItemToFeedItem(feedItemUid: feedItems[feedItemIndex].uid, tagItemUid: feedItems[feedItemIndex].tags[tagItemIndex].uid)
                print("tagItemToFeedItem = \(tagItemToFeedItem)")
                _ = storage.insert(tagItemToFeedItem)
                switch storage.count(all: TagItemToFeedItem.self) {
                case .success(let value):
                    print("TagItemToFeedItem count = \(value)")
                case .failure(let error):
                    print("error = \(error)")
                }
            }
        }
        _ = storage.commit()
        
        let allTagsResult = storage.getAll(all: TagItem.self)
        switch allTagsResult {
        case .success(let tagItems):
            print("tagItems = \(tagItems)")
        case .failure(let error):
            print("error = \(error)")
        }
        
        let allFeedResult = storage.getAll(all: FeedItem.self)
        switch allFeedResult {
        case .success(let feedItems):
            print("feedItems = \(feedItems)")
        case .failure(let error):
            print("error = \(error)")
        }
        
        let allTagToFeedResult = storage.getAll(all: TagItemToFeedItem.self)
        switch allTagToFeedResult {
        case .success(let tagItemToFeedItems):
            print("tagItemToFeedItems = \(tagItemToFeedItems)")
        case .failure(let error):
            print("error = \(error)")
        }
    }
    
    func extractFeedItems() -> [FeedItem] {
        let getAllResult = storage.getAll(all: FeedItem.self, orderBy(\FeedItem.order).asc())
        switch getAllResult {
        case .success(var feedItems):
            for feedItemIndex in feedItems.indices {
                switch storage.getAll(all: TagItem.self,
                                      where_((\TagItem.uid).in(select(\TagItemToFeedItem.tagItemUid,
                                                                       from(TagItemToFeedItem.self),
                                                                       where_(\TagItemToFeedItem.feedItemUid == feedItems[feedItemIndex].uid)))),
                                      orderBy(\TagItem.order).asc()) {
                case .success(let tagItems):
                    feedItems[feedItemIndex].tags = tagItems
                case .failure(let error):
                    fatalError(error.localizedDescription)
                }
            }
            return feedItems
        case .failure(let error):
            fatalError(error.localizedDescription)
        }
    }
}
