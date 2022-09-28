import Foundation

struct TagItem: Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var name = ""
    var description = ""
}

extension TagItem: TagProtocol {}
