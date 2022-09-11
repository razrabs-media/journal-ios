import Foundation

struct GithubAuthor: Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var usernameUrl = ""
    var avatarUrl: String?
    var name: String?
    var postsCount = Float(0)
    
}
