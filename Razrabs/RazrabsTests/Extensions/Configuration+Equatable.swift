import Foundation
@testable import Razrabs

extension Configuration: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.h == rhs.h && lhs.w == rhs.w && lhs.type == rhs.type
    }
}
