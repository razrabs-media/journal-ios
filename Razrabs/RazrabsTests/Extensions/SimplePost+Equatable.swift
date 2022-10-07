import Foundation
@testable import Razrabs

extension SimplePost: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt.timeIntervalSince1970 == rhs.createdAt.timeIntervalSince1970
        && lhs.updatedAt.timeIntervalSince1970 == rhs.updatedAt.timeIntervalSince1970
        && lhs.title == rhs.title
        && lhs.previewUrl == rhs.previewUrl
        && lhs.content == rhs.content
        && lhs.description == rhs.description
        && lhs.status == rhs.status
    }
}
