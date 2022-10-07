import Foundation
import SQLiteORM

struct PostOnFrontPage: Initializable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var postUid = ""
    var frontPageUid = ""
    var componentUid = ""
    var position = Position()
    var post = SimplePost()
    var component = ComponentItem()
    var order = 0
}

extension PostOnFrontPage: Codable {
    enum CodingKeys: String, CodingKey {
        case uid
        case createdAt
        case updatedAt
        case postUid
        case frontPageUid
        case componentUid
        case position
        case post
        case component
    }
}

extension PostOnFrontPage {
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
    
    var positionX: Int {
        set {
            position.x = newValue
        }
        get {
            position.x
        }
    }
    
    var positionY: Int {
        set {
            position.y = newValue
        }
        get {
            position.y
        }
    }
}
