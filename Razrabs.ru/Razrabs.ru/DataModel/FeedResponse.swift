import Foundation

struct FeedResponse: Codable {
    struct Data: Codable {
        var feeds = [FeedItem]()
    }
    
    var data = FeedResponse.Data()
}
