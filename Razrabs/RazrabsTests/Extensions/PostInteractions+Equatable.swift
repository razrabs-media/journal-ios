import Foundation
@testable import Razrabs

extension PostInteractions: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.sharesCount == rhs.sharesCount && lhs.viewsCount == rhs.viewsCount
    }
}
