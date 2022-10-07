import Foundation
@testable import Razrabs

extension ComponentItem: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt.timeIntervalSince1970 == rhs.createdAt.timeIntervalSince1970
        && lhs.updatedAt.timeIntervalSince1970 == rhs.updatedAt.timeIntervalSince1970
        && lhs.name == rhs.name
        && lhs.configuration == rhs.configuration
    }
}
