import Foundation
import SQLiteORM

struct FrontPage: Codable, Initializable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var title = ""
    var publicationDate: Date?
    var endDate: Date?
    var content = [PostOnFrontPage]()
}

extension FrontPage {
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
    
    var publicationDateUnix: TimeInterval? {
        set {
            if let newValue = newValue {
                publicationDate = .init(timeIntervalSince1970: newValue)
            } else {
                publicationDate = nil
            }
        }
        get {
            publicationDate?.timeIntervalSince1970
        }
    }
    
    var endDateUnix: TimeInterval? {
        set {
            if let newValue = newValue {
                endDate = .init(timeIntervalSince1970: newValue)
            } else {
                endDate = nil
            }
        }
        get {
            endDate?.timeIntervalSince1970
        }
    }
}
