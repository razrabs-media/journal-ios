import SwiftUI

struct ContentView: View {
    let razrabsApi: RazrabsApi
    
    @State var feedItems = [FeedItem]()
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(feedItems.indices, id: \.self) { index in
                            Button {
                                print("feed item \(feedItems[index].name) selected")
                            } label: {
                                Text(feedItems[index].name)
                                    .background(Color(.lightGray))
                                    .foregroundColor(Color(.black))
                                    .padding(2)
                            }
                        }
                    }
                }
                    .padding()
                    .navigationTitle("Разрабы")
                    .onAppear {
                        razrabsApi.requestFeed(callback: { result in
                            print("feed result = \(result)")
                            switch result {
                            case .success(let feedResponse):
                                feedItems = feedResponse.data.feeds// + feedResponse.data.feeds
                                razrabsApi.requestCurrentFrontPage { result in
                                    print("current front page result = \(result)")
                                }
                            case .failure(let error):
                                print("error = \(error)")
                            }
                        })
                    }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(razrabsApi: .init(scheme: "https", host: "api.razrabs.ru"))
    }
}
