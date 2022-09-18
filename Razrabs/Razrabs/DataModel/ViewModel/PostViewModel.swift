import Foundation

struct PostViewModel {
    enum AppearanceType {
        case small  //  picture to the left, text to the right
        case medium //  picture to the top, text is below
        case large  //  no picture, large text
    }
    
    let post: SimplePost
    let appearanceType: AppearanceType
    let createdAtString: String
    
    init(post: SimplePost, appearanceType: AppearanceType) {
        
        //  TODO: make conditional relative date like it is done on the website
        let relativeDateTimeFormatter = RelativeDateTimeFormatter()
        relativeDateTimeFormatter.locale = .init(identifier: "ru_RU")
        self.createdAtString = DateFormatter.themeFormatter().string(from: post.createdAt).uppercased()
        
        self.post = post
        self.appearanceType = appearanceType
    }
}
