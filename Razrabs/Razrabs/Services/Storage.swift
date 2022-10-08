import Foundation
import SQLiteORM

class Storage {
    let storage: SafeStorage
    
    init(filepath: String) {
        let result = SafeStorage.create(filename: filepath,
                                        tables: [
                                            Table<FeedItem>(name: "feed_items",
                                                            columns: [
                                                                Column(name: "uid", keyPath: \FeedItem.uid, constraints: primaryKey()),
                                                                Column(name: "name", keyPath: \FeedItem.name),
                                                                Column(name: "created_at", keyPath: \FeedItem.createdAtUnix),
                                                                Column(name: "updated_at", keyPath: \FeedItem.updatedAtUnix),
                                                                Column(name: "status", keyPath: \FeedItem.status),
                                                                Column(name: "order", keyPath: \FeedItem.order)
                                                            ]),
                                            Table<TagItem>(name: "tags",
                                                           columns: [
                                                            Column(name: "uid", keyPath: \TagItem.uid, constraints: primaryKey()),
                                                            Column(name: "created_at", keyPath: \TagItem.createdAtUnix),
                                                            Column(name: "updated_at", keyPath: \TagItem.updatedAtUnix),
                                                            Column(name: "name", keyPath: \TagItem.name),
                                                            Column(name: "description", keyPath: \TagItem.description),
                                                            Column(name: "order", keyPath: \TagItem.order)
                                                           ]),
                                            Table<TagItemToFeedItem>(name: "tags_to_feed",
                                                                     columns: [
                                                                        Column(name: "tag", keyPath: \TagItemToFeedItem.tagItemUid),
                                                                        Column(name: "feed", keyPath: \TagItemToFeedItem.feedItemUid)
                                                                     ]),
                                            Table<FrontPage>(name: "front_pages",
                                                             columns: [
                                                                Column(name: "uid", keyPath: \FrontPage.uid, constraints: primaryKey()),
                                                                Column(name: "created_at", keyPath: \FrontPage.createdAtUnix),
                                                                Column(name: "updated_at", keyPath: \FrontPage.updatedAtUnix),
                                                                Column(name: "title", keyPath: \FrontPage.title),
                                                                Column(name: "publication_date", keyPath: \FrontPage.publicationDateUnix),
                                                                Column(name: "end_date", keyPath: \FrontPage.endDateUnix)
                                                             ]),
                                            Table<PostOnFrontPage>(name: "post_on_front_page",
                                                                   columns: [
                                                                    Column(name: "uid", keyPath: \PostOnFrontPage.uid, constraints: primaryKey()),
                                                                    Column(name: "created_at", keyPath: \PostOnFrontPage.createdAtUnix),
                                                                    Column(name: "updated_at", keyPath: \PostOnFrontPage.updatedAtUnix),
                                                                    Column(name: "post_uid", keyPath: \PostOnFrontPage.postUid),
                                                                    Column(name: "front_page_uid", keyPath: \PostOnFrontPage.frontPageUid),
                                                                    Column(name: "component_uid", keyPath: \PostOnFrontPage.componentUid),
                                                                    Column(name: "position_x", keyPath: \PostOnFrontPage.positionX),
                                                                    Column(name: "position_y", keyPath: \PostOnFrontPage.positionY),
                                                                    Column(name: "order", keyPath: \PostOnFrontPage.order)
                                                                   ]),
                                            Table<SimplePost>(name: "simple_post",
                                                              columns: [
                                                                Column(name: "uid", keyPath: \SimplePost.uid, constraints: primaryKey()),
                                                                Column(name: "created_at", keyPath: \SimplePost.createdAtUnix),
                                                                Column(name: "updated_at", keyPath: \SimplePost.updatedAtUnix),
                                                                Column(name: "title", keyPath: \SimplePost.title),
                                                                Column(name: "preview_url", keyPath: \SimplePost.previewUrl),
                                                                Column(name: "content", keyPath: \SimplePost.content),
                                                                Column(name: "description", keyPath: \SimplePost.description),
                                                                Column(name: "status", keyPath: \SimplePost.status)
                                                              ]),
                                            Table<ComponentItem>(name: "component_items",
                                                                 columns: [
                                                                    Column(name: "uid", keyPath: \ComponentItem.uid, constraints: primaryKey()),
                                                                    Column(name: "created_at", keyPath: \ComponentItem.createdAtUnix),
                                                                    Column(name: "updated_at", keyPath: \ComponentItem.updatedAtUnix),
                                                                    Column(name: "name", keyPath: \ComponentItem.name),
                                                                    Column(name: "configuration_h", keyPath: \ComponentItem.configurationH),
                                                                    Column(name: "configuration_w", keyPath: \ComponentItem.configurationW),
                                                                    Column(name: "configuration_type", keyPath: \ComponentItem.configurationType)
                                                                 ])
                                        ])
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
    
    func cache(frontPage: inout FrontPage) {
        _ = storage.beginTransaction()
        _ = storage.delete(all: FrontPage.self)
        _ = storage.replace(frontPage)
        _ = storage.delete(all: PostOnFrontPage.self, where_(\PostOnFrontPage.frontPageUid == frontPage.uid))
        for postOnFrontPageIndex in frontPage.content.indices {
            frontPage.content[postOnFrontPageIndex].order = postOnFrontPageIndex
            _ = storage.replace(frontPage.content[postOnFrontPageIndex])
            _ = storage.replace(frontPage.content[postOnFrontPageIndex].post)
            _ = storage.replace(frontPage.content[postOnFrontPageIndex].component)
        }
        _ = storage.commit()
    }
    
    func extractFrontPage() -> FrontPage? {
        switch storage.getAll(all: FrontPage.self, limit(1)) {
        case .success(let frontPages):
            guard var frontPage = frontPages.first else {
                return nil
            }
            switch storage.getAll(all: PostOnFrontPage.self, where_(\PostOnFrontPage.frontPageUid == frontPage.uid)) {
            case .success(var postsOnFrontPage):
                for postIndex in postsOnFrontPage.indices {
                    switch storage.get(of: ComponentItem.self, id: postsOnFrontPage[postIndex].componentUid) {
                    case .success(let componentItem):
                        if let componentItem = componentItem {
                            postsOnFrontPage[postIndex].component = componentItem
                        }
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    }
                    switch storage.get(of: SimplePost.self, id: postsOnFrontPage[postIndex].postUid) {
                    case .success(let simplePost):
                        if let simplePost = simplePost {
                            postsOnFrontPage[postIndex].post = simplePost
                        }
                    case .failure(let error):
                        fatalError(error.localizedDescription)
                    }
                }
                frontPage.content = postsOnFrontPage
                return frontPage
            case .failure(let error):
                fatalError(error.localizedDescription)
            }
        case .failure(let error):
            fatalError(error.localizedDescription)
        }
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
                _ = storage.insert(TagItemToFeedItem(feedItemUid: feedItems[feedItemIndex].uid, tagItemUid: feedItems[feedItemIndex].tags[tagItemIndex].uid))
            }
        }
        _ = storage.commit()
    }
    
    func extractFeedItems() -> [FeedItem] {
        switch storage.getAll(all: FeedItem.self, orderBy(\FeedItem.order).asc()) {
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
