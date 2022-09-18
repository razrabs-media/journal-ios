import Foundation

struct Post: Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var title = ""
    var readingTime: Int?
    var previewUrl: String?
    var content = ""
    var description = ""
    var status = ""
    var tags = [TagItem]()
    var githubAuthor: GithubAuthor?
    var interactions = PostInteractions()
    var comments = [CommentItem]()
}
