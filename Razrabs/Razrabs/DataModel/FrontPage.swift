import Foundation

struct FrontPage: Codable {
    var uid = ""
    var createdAt = Date()
    var updatedAt = Date()
    var title = ""
    var publicationDate: Date?
    var endDate: Date?
    var content = [PostOnFrontPage]()
}
