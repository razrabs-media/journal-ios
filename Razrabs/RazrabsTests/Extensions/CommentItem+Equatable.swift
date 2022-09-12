import Foundation
@testable import Razrabs

extension CommentItem: Equatable {
    public static func ==(lhs: Self, rhs: Self) -> Bool {
        return lhs.uid == rhs.uid
        && lhs.createdAt == rhs.createdAt
        && lhs.updatedAt == rhs.updatedAt
        && lhs.content == rhs.content
        && lhs.author == rhs.author
        && lhs.authorUid == rhs.authorUid
        && lhs.postUid == rhs.postUid
        && lhs.replyingToCommentUid == rhs.replyingToCommentUid
        && lhs.status == rhs.status
    }
}
