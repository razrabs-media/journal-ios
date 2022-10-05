import Foundation

class FeedItemViewModel {
    var feedItem: FeedItem
    var isSelected: Bool
    
    init(feedItem: FeedItem, isSelected: Bool) {
        self.feedItem = feedItem
        self.isSelected = isSelected
    }
}

extension FeedItemViewModel: TagProtocol {
    
    var uid: String {
        feedItem.uid
    }
    
    var name: String {
        feedItem.name
    }
}
