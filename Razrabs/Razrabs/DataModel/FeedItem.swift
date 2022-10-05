import Foundation
import SQLiteORM

struct FeedItem: Initializable {
    var uid = ""
    var name = ""
    var createdAt = Date()
    var updatedAt = Date()
    var tags = [TagItem]()
    var status: String?
    var order = 0
}

extension FeedItem: Codable {
    enum CodingKeys: String, CodingKey {
        case uid
        case name
        case createdAt
        case updatedAt
        case tags
        case status
    }
}

extension FeedItem {
    var createdAtUnix: TimeInterval {
        set {
            createdAt = .init(timeIntervalSince1970: newValue)
        }
        get {
            createdAt.timeIntervalSince1970
        }
    }
    
    var updatedAtUnix: TimeInterval {
        set {
            updatedAt = .init(timeIntervalSince1970: newValue)
        }
        get {
            updatedAt.timeIntervalSince1970
        }
    }
}
