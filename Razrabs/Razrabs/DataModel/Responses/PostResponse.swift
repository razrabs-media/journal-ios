import Foundation

struct PostResponse: Codable {
    struct Data: Codable {
        var post = Post()
    }
    var data = Data()
}
