import Foundation
@testable import Razrabs

extension ProfileItem: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
        && lhs.fullName == rhs.fullName
        && lhs.publicName == rhs.publicName
        && lhs.email == rhs.email
        && lhs.avatarUrl == rhs.avatarUrl
        && lhs.commentsCount == rhs.commentsCount
    }
}
