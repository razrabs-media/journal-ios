import Foundation

struct CurrentFrontPageResponse: Codable {
    struct Data: Codable {
        var currentFrontPage = FrontPage()
    }
    
    var data = Data()
}
