import SwiftUI

extension Font {
    static let themeRegularName = "StyreneBLCWeb-Regular"
    
    static func themeRegular(with size: CGFloat) -> Font {
        return Font.custom(themeRegularName, size: size)
    }
    
    static func themeMedium(with size: CGFloat) -> Font {
        return Font.custom("StyreneBLCWeb-Medium", size: size)
    }
    
    static func themeBold(with size: CGFloat) -> Font {
        return Font.custom("StyreneBLCWeb-Bold", size: size)
    }
}
