import Foundation

struct PostViewModel {
    enum AppearanceType {
        case small  //  picture to the left, text to the right
        case medium //  picture to the top, text is below
        case large  //  no picture, large text
    }
    var post = SimplePost()
    var appearanceType = AppearanceType.small
}
