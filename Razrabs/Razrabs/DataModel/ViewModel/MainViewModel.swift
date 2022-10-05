import Foundation

@MainActor class MainViewModel: ObservableObject {
    @Published var isLoading = false
    @Published var posts = [PostViewModel]()
    @Published var feedItems = [FeedItemViewModel]()
    @Published var frontPage: FrontPage?
    @Published var errorText = ""
    @Published var isErrorPresented = false
    @Published var selectedFeedItemUid = ""
}
