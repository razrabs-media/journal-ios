import Foundation
import SQLiteORM

struct SimplePost: Initializable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var title = ""
    var previewUrl = ""
    var content = ""
    var description = ""
    var status = ""
}

extension SimplePost: Codable {
    private enum CodingKeys: String, CodingKey {
        case uid
        case createdAt
        case updatedAt
        case title
        case previewUrl
        case content
        case description
        case status
    }
}

extension SimplePost {
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
