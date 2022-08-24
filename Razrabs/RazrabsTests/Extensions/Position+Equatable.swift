import Foundation
@testable import Razrabs

extension Position: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y 
    }
}
