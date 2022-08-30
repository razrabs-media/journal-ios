import SwiftUI

extension Font {
    static func themeRegular(with size: CGFloat) -> Font {
        return Font.custom("StyreneBLCWeb-Regular", size: size)
    }
    
    static func themeMedium(with size: CGFloat) -> Font {
        return Font.custom("StyreneBLCWeb-Medium", size: size)
    }
    
    static func themeBold(with size: CGFloat) -> Font {
        return Font.custom("StyreneBLCWeb-Bold", size: size)
    }
}
