import SwiftUI

struct FeedView<VM: FeedViewModel>: View {
        
    @StateObject var viewModel: VM
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.Feed.background(colorScheme: colorScheme)
                    .ignoresSafeArea()
                
                ScrollView(.vertical) {
                    VStack {
                        feedNavigation
                            .padding()
                            .onAppear {
                                viewModel.requestFeed()
                            }
                        
                        Rectangle()
                            .fill(Color.Feed.separator(colorScheme: colorScheme))
                            .frame(maxWidth: .infinity, maxHeight: 1)
                    }
                }
            }
            .navigationTitle("РАЗРАБЫ")
        }
    }
        
    @Environment(\.colorScheme) private var colorScheme
    
    private var feedNavigation: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(viewModel.feedItems.indices, id: \.self) { index in
                    Button {
                        print("feed item \(viewModel.feedItems[index].name) selected")
                    } label: {
                        Text(viewModel.feedItems[index].name)
                            .background(Color(.lightGray))
                            .foregroundColor(Color(.black))
                            .padding(2)
                    }
                }
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(viewModel: FeedViewModelImpl(razrabsApi: .init(scheme: "https", host: "api.razrabs.ru")))
    }
}
