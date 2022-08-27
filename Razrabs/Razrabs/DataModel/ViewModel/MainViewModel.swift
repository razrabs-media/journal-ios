import Foundation

@MainActor class MainViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var posts = [PostViewModel]()
    @Published var feedItems = [FeedItem]()
    @Published var frontPage: FrontPage?
}
