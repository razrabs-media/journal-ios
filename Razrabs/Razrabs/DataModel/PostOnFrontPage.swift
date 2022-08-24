import Foundation

struct PostOnFrontPage: Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var postUid = ""
    var frontPageUid = ""
    var componentUid = ""
    var position = Position()
    var post = SimplePost()
    var component = ComponentItem()
}
