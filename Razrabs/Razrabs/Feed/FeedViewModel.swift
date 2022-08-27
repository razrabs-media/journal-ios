import Foundation

protocol FeedViewModel: ObservableObject {
    
    var feedItems: [FeedItem] { get }
    
    func requestFeed()
    
}

final class FeedViewModelImpl: FeedViewModel {
        
    @Published var feedItems = [FeedItem]()
    private let razrabsApi: RazrabsApi
    
    init(razrabsApi: RazrabsApi) {
        self.razrabsApi = razrabsApi
    }
        
    func requestFeed() {
        razrabsApi.requestFeed(callback: { [weak self] result in
            guard let this = self else {
                return
            }
            
            print("feed result = \(result)")
            switch result {
            case .success(let feedResponse):
                this.feedItems = feedResponse.data.feeds// + feedResponse.data.feeds
                this.razrabsApi.requestCurrentFrontPage { result in
                    print("current front page result = \(result)")
                }
                
            case .failure(let error):
                print("error = \(error)")
            }
        })
    }
    
}
