import Foundation

@MainActor class SinglePostViewModel: ObservableObject {
    enum PostData {
        case simplePost(simplePost: SimplePost)
        case post(post: Post)
        
        var content: String {
            switch self {
            case .post(let post):
                return post.content
            case .simplePost(let simplePost):
                return simplePost.content
            }
        }
        
        var commentsCount: Int {
            switch self {
            case .post(let post):
                return post.comments.count
            case .simplePost(_):
                return 0
            }
        }
        
        var tags: [TagItem] {
            switch self {
            case .simplePost(_):
                return []
            case .post(let post):
                return post.tags ?? []
            }
        }
        
        var uid: String {
            switch self {
            case .post(let post):
                return post.uid
            case .simplePost(let simplePost):
                return simplePost.uid
            }
        }
        
        var previewUrl: String {
            switch self {
            case .post(let post):
                return post.previewUrl ?? ""
            case .simplePost(let simplePost):
                return simplePost.previewUrl
            }
        }
        
        var createdAt: Date {
            switch self {
            case .post(let post):
                return post.createdAt
            case .simplePost(let simplePost):
                return simplePost.createdAt
            }
        }
        
        var title: String {
            switch self {
            case .post(let post):
                return post.title
            case .simplePost(let simplePost):
                return simplePost.title
            }
        }
        
        var description: String {
            switch self {
            case .post(let post):
                return post.description
            case .simplePost(let simplePost):
                return simplePost.description
            }
        }
        
        var authorName: String? {
            switch self {
            case .post(let post):
                return post.githubAuthor?.name
            case .simplePost(_):
                return nil
            }
        }
        
        var authorUrl: String? {
            switch self {
            case .post(let post):
                return post.githubAuthor?.usernameUrl
            case .simplePost(_):
                return nil
            }
        }
    }
    
    @Published var postData: PostData
    
    lazy var createdAtString: String = {
        DateFormatter.themeFormatter().string(from: postData.createdAt)
    }()
    
    init(postData: PostData) {
        self.postData = postData
    }
}
