import Foundation

struct SimplePost: Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var title = ""
    var previewUrl = ""
    var content = ""
    var description = ""
    var status = ""
}
