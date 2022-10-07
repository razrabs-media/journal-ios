import Foundation
@testable import Razrabs

extension FrontPage: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt.timeIntervalSince1970 == rhs.createdAt.timeIntervalSince1970
        && lhs.updatedAt.timeIntervalSince1970 == rhs.updatedAt.timeIntervalSince1970
        && lhs.title == rhs.title
        && lhs.publicationDate == rhs.publicationDate
        && lhs.endDate == rhs.endDate
        && lhs.content == rhs.content
    }
}
