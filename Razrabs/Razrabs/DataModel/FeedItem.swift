import Foundation

struct FeedItem: Codable {
    var uid = ""
    var name = ""
    var createdAt = Date()
    var updatedAt = Date()
    var tags = [TagItem]()
    var status: String?
}

extension FeedItem: TagProtocol {}
