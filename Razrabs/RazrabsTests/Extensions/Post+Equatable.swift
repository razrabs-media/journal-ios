import Foundation
@testable import Razrabs

extension Post: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
        && lhs.title == rhs.title
        && lhs.readingTime == rhs.readingTime
        && lhs.previewUrl == rhs.previewUrl
        && lhs.content == rhs.content
        && lhs.description == rhs.description
        && lhs.status == rhs.status
        && lhs.tags == rhs.tags
        && lhs.githubAuthor == rhs.githubAuthor
        && lhs.interactions == rhs.interactions
        && lhs.comments == rhs.comments
    }
}
