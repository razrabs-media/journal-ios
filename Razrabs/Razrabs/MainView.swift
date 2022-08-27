import SwiftUI

struct MainView: View {
    let razrabsApi: RazrabsApi
    
    @StateObject var viewModel = MainViewModel()
    
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
//                    Spacer()
                    List {
                        ForEach(0..<viewModel.posts.count) { postIndex in
//                            viewModel.posts[postIndex].
                            Text(postIndex.description)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.isLoading = true
                razrabsApi.requestFeed(callback: { result in
                    print("feed result received")
                    switch result {
                    case .success(let feedResponse):
                        razrabsApi.requestCurrentFrontPage { result in
                            viewModel.isLoading = false
                            switch result {
                            case .success(let currentFrontPageResponse):
                                print("current front page received")
                                viewModel.feedItems = feedResponse.data.feeds
                                var posts = [PostViewModel]()
                                posts.reserveCapacity(currentFrontPageResponse.data.currentFrontPage.content.count)
                                for postOnFrontPage in currentFrontPageResponse.data.currentFrontPage.content {
                                    posts.append(.init(post: postOnFrontPage.post, isLarge: false))
                                }
                                viewModel.frontPage = currentFrontPageResponse.data.currentFrontPage
                                viewModel.posts = posts
                                for post in viewModel.frontPage!.content {
                                    print("post \(post.post.title.prefix(15)) at \(post.position), \(post.component.configuration)")
                                }
                            case .failure(let error):
                                print("error = \(error)")
                            }
                        }
                    case .failure(let error):
                        print("error = \(error)")
                        viewModel.isLoading = false
                    }
                })
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(razrabsApi: .init(scheme: "https", host: "api.razrabs.ru"))
    }
}
