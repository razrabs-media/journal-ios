import SwiftUI

struct MainView: View {
    let razrabsApi: RazrabsApi
    
    @StateObject var viewModel = MainViewModel()
    
    func requestFeed() {
        viewModel.isLoading = true
        razrabsApi.requestFeed(callback: { result in
            print("feed result received")
            switch result {
            case .success(let feedResponse):
                razrabsApi.requestCurrentFrontPage { result in
                    viewModel.isLoading = false
                    switch result {
                    case .success(var currentFrontPageResponse):
                        print("current front page received")
                        viewModel.feedItems = feedResponse.data.feeds
                        var posts = [PostViewModel]()
                        posts.reserveCapacity(currentFrontPageResponse.data.currentFrontPage.content.count)
                        currentFrontPageResponse.data.currentFrontPage.content.sort { lhs, rhs in
                            if lhs.position.y == rhs.position.y {
                                return lhs.position.x < rhs.position.x
                            } else {
                                return lhs.position.y < rhs.position.y
                            }
                        }
                        for postOnFrontPage in currentFrontPageResponse.data.currentFrontPage.content {
                            let appearanceType: PostViewModel.AppearanceType
                            switch postOnFrontPage.component.configuration.w {
                            case 4:
                                appearanceType = .large
                            case 2:
                                appearanceType = .medium
                            default:
                                appearanceType = .small
                            }
                            posts.append(.init(post: postOnFrontPage.post, appearanceType: appearanceType))
                        }
                        viewModel.frontPage = currentFrontPageResponse.data.currentFrontPage
                        viewModel.posts = posts
                    case .failure(let error):
                        print("error = \(error)")
                    }
                }
            case .failure(let error):
                print("error = \(error)")
                viewModel.isLoading = false
                viewModel.errorText = error.localizedDescription
            }
        })
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if viewModel.isLoading {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                } else {
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(viewModel.feedItems, id: \FeedItem.uid) { feedItem in
                                Button {
                                    print("feed item \(feedItem.name) selected")
                                } label: {
                                    Text(feedItem.name)
                                        .background(Color("FeedItemBack"))
                                        .foregroundColor(Color("FeedItemFore"))
                                        .padding(2)
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
                        }
                    }
                        .listStyle(.plain)
                }
            }
            .onAppear {
                requestFeed()
            }.alert(viewModel.errorText, isPresented: $viewModel.errorIsPresented) {
                Button("Retry", role: .cancel) {
                    viewModel.errorIsPresented = false
                    viewModel.errorText = ""
                    requestFeed()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(razrabsApi: .init(scheme: "https", host: "api.razrabs.ru"))
    }
}
