import Foundation
@testable import Razrabs

extension FrontPage: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
        && lhs.title == rhs.title
        && lhs.publicationDate == rhs.publicationDate
        && lhs.endDate == rhs.endDate
        && lhs.content == rhs.content
    }
}
