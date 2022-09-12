import Foundation
@testable import Razrabs

extension GithubAuthor: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
        && lhs.usernameUrl == rhs.usernameUrl
        && lhs.avatarUrl == rhs.avatarUrl
        && lhs.name == rhs.name
        && lhs.postsCount == rhs.postsCount
    }
}
