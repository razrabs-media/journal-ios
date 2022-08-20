import Foundation
@testable import Razrabs_ru

extension FeedItem: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.name == rhs.name
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
        && lhs.tags == rhs.tags
        && lhs.status == rhs.status
    }
}
