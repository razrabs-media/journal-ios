import Foundation

struct ComponentItem: Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var name = ""
    var configuration = Configuration()
}
