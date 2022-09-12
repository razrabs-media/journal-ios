import Foundation

struct CommentItem: Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var content = ""
    var author = ProfileItem()
    var authorUid: String?
    var postUid: String?
    var replyingToCommentUid: String?
    var status: String?
}
