import Foundation

struct ProfileItem: Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var fullName: String?
    var publicName: String?
    var email: String?
    var avatarUrl: String?
    var commentsCount: Float?
}
