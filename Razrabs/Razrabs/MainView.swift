import SwiftUI

struct MainView: View {
    let razrabsApi: RazrabsApi
    let storage: Storage
    
    @StateObject var viewModel = MainViewModel()
    
    func update(with frontPage: FrontPage) {
        var posts = [PostViewModel]()
        posts = frontPage.content.sorted { lhs, rhs in
            if lhs.position.y == rhs.position.y {
                return lhs.position.x < rhs.position.x
            } else {
                return lhs.position.y < rhs.position.y
            }
        }.map{
            let appearanceType: PostViewModel.AppearanceType
            switch $0.component.configuration.w {
            case 4:
                appearanceType = .large
            case 2:
                appearanceType = .medium
            default:
                appearanceType = .small
            }
            return PostViewModel(post: $0.post, appearanceType: appearanceType)
        }
        viewModel.frontPage = frontPage
        viewModel.posts = posts
    }
    
    func requestFeed() {
        viewModel.isLoading = true
        razrabsApi.requestFeed(callback: { result in
            switch result {
            case .success(var feedResponse):
                storage.cache(feedItems: &feedResponse.data.feeds)
                
                razrabsApi.requestCurrentFrontPage { result in
                    viewModel.isLoading = false
                    switch result {
                    case .success(var currentFrontPageResponse):
                        let selectedFeedItemUid = viewModel.feedItems.first{ $0.isSelected }?.uid
                        viewModel.feedItems = feedResponse.data.feeds.map{ .init(feedItem: $0, isSelected: $0.uid == selectedFeedItemUid) }
                        
                        storage.cache(frontPage: &currentFrontPageResponse.data.currentFrontPage)
                        update(with: currentFrontPageResponse.data.currentFrontPage)
                    case .failure(let error):
                        print("error = \(error)")
                        viewModel.isLoading = false
                        viewModel.errorText = error.localizedDescription
                        viewModel.isErrorPresented = true
                    }
                }
            case .failure(let error):
                print("error = \(error)")
                viewModel.isLoading = false
                viewModel.errorText = error.localizedDescription
                viewModel.isErrorPresented = true
            }
        })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading && viewModel.posts.isEmpty {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.feedItems, id: \FeedItemViewModel.uid) { feedItemViewModel in
                                TagCellView(feedItem: feedItemViewModel) {
                                    if feedItemViewModel.uid != viewModel.selectedFeedItemUid {
                                        viewModel.selectedFeedItemUid = feedItemViewModel.uid
                                        for item in viewModel.feedItems {
                                            item.isSelected = item === feedItemViewModel
                                        }
                                    } else {
                                        viewModel.selectedFeedItemUid = ""
                                        for item in viewModel.feedItems {
                                            item.isSelected = false
                                        }
                                    }
                                }
                            }
                        }
                    }
                        .padding()
                        .navigationTitle("Разрабы")
                    List {
                        ForEach(viewModel.posts, id: \PostViewModel.post.uid) { post in
                            PostCellView(post: post)
                                .listRowSeparator(.hidden)
                                .background(NavigationLink {
                                    SinglePostView(razrabsApi: razrabsApi, viewModel: .init(postData: .simplePost(simplePost: post.post)))
                                } label: {
                                    EmptyView()
                                })
                        }
                    }
                        .listStyle(.plain)
                }
            }
            .onAppear {
                viewModel.feedItems = storage.extractFeedItems().map{ .init(feedItem: $0, isSelected: false) }
                if let frontPage = storage.extractFrontPage() {
                    update(with: frontPage)
                }
                requestFeed()
            }.alert(viewModel.errorText, isPresented: $viewModel.isErrorPresented) {
                Button("Retry", role: .cancel) {
                    viewModel.isErrorPresented = false
                    viewModel.errorText = ""
                    requestFeed()
                }
            }
        }
    }
}

/*struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(razrabsApi: .init(scheme: "https", host: "api.razrabs.ru"))
    }
}*/
