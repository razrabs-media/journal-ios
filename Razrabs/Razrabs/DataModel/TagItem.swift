import Foundation
import SQLiteORM

struct TagItem: Initializable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var name = ""
    var description = ""
    var order = 0
}

extension TagItem: Codable {
    enum CodingKeys: String, CodingKey {
        case uid
        case createdAt
        case updatedAt
        case name
        case description
    }
}

extension TagItem: TagProtocol {
    var isSelected: Bool {
        false
    }
}

extension TagItem {
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
