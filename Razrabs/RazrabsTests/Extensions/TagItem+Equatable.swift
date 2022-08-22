import Foundation
@testable import Razrabs

extension TagItem: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
        && lhs.name == rhs.name
        && lhs.description == rhs.description
    }
}
