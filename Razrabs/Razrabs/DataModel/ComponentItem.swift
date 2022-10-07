import Foundation
import SQLiteORM

struct ComponentItem: Initializable, Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var name = ""
    var configuration = Configuration()
}

extension ComponentItem {
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
    
    var configurationH: Int {
        set {
            configuration.h = newValue
        }
        get {
            configuration.h
        }
    }
    
    var configurationW: Int {
        set {
            configuration.w = newValue
        }
        get {
            configuration.w
        }
    }
    
    var configurationType: String {
        set {
            configuration.type = newValue
        }
        get {
            configuration.type
        }
    }
}
