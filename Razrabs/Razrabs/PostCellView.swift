import SwiftUI
import CachedAsyncImage

extension URLCache {
    
    static let imageCache = URLCache(memoryCapacity: 512*1000*1000, diskCapacity: 10*1000*1000*1000)
}

struct PostCellView: View {
    let post: PostViewModel
    
    var body: some View {
        switch post.appearanceType {
        case .large:
            ZStack {
                Rectangle()
                    .strokeBorder(Color("LargePostBorder"))
                    .frame(height: 300)
                VStack {
                    Spacer()
                    Text(post.post.title.uppercased())
                        .font(Font.themeRegular(with: 24))
                        .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
                        .multilineTextAlignment(.center)
                        .padding([.leading, .trailing])
                    Text(post.createdAtString)
                        .font(Font.themeRegular(with: 14))
                        .foregroundColor(Color("FeedItemFore"))
                    Spacer()
                }
            }
        case .medium:
            VStack {
                CachedAsyncImage(url: .init(string: post.post.previewUrl),
                                 urlCache: .imageCache,
                           content: { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                        .clipped()
                }, placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(maxHeight: 200)
                        .aspectRatio(CGFloat(651) / CGFloat(369), contentMode: .fill)
                })
                Text(post.post.title.uppercased())
                    .font(Font.themeRegular(with: 16))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
                HStack {
                    Text(post.createdAtString)
                        .font(Font.themeRegular(with: 14))
                        .foregroundColor(Color("FeedItemFore"))
                    Spacer()
                }
            }
        case .small:
            HStack {
                VStack {
                    CachedAsyncImage(url: .init(string: post.post.previewUrl), urlCache: .imageCache) { image in
                        image.resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 50)
                            .clipped()
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(height: 50)
                    }
                    Spacer()
                }
                .frame(width: 80)
                VStack {
                    HStack {
                        Text(post.post.title.uppercased())
                            .font(Font.themeRegular(with: 14))
                            .frame(alignment: .top)
                        Spacer()
                    }
                    HStack {
                        Text(post.createdAtString)
                            .font(Font.themeRegular(with: 14))
                            .foregroundColor(Color("FeedItemFore"))
                        Spacer()
                    }
                }
            }
        }
    }
}
