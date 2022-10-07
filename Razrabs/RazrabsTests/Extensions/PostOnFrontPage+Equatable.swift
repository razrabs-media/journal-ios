import Foundation
@testable import Razrabs

extension PostOnFrontPage: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt.timeIntervalSince1970 == rhs.createdAt.timeIntervalSince1970
        && lhs.updatedAt.timeIntervalSince1970 == rhs.updatedAt.timeIntervalSince1970
        && lhs.postUid == rhs.postUid
        && lhs.frontPageUid == rhs.frontPageUid
        && lhs.componentUid == rhs.componentUid
        && lhs.position == rhs.position
        && lhs.post == rhs.post
        && lhs.component == rhs.component
    }
}
