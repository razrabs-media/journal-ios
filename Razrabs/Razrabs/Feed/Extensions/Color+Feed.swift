import SwiftUI

extension Color {
    
    enum Feed {
        
        static func background(colorScheme: ColorScheme) -> Color {
            return colorScheme == .dark ? Color(r: 31, g: 32, b: 37) : Color(r: 247, g: 248, b: 252)
        }
        
        static func separator(colorScheme: ColorScheme) -> Color {
            return colorScheme == .dark ? .white : .black
        }
        
    }
    
}
