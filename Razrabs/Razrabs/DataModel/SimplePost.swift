import Foundation

struct SimplePost {
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
