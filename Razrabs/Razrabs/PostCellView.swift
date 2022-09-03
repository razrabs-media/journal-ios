import SwiftUI

struct PostCellView: View {
    let post: PostViewModel
    
    var body: some View {
        switch post.appearanceType {
        case .large:
            ZStack {
                Rectangle()
                    .strokeBorder(Color(.black))
                    .frame(height: 300)
                Text(post.post.title.uppercased())
                    .font(Font.themeRegular(with: 24))
                    .frame(maxWidth: .infinity, maxHeight: 300, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        case .medium:
            VStack {
                AsyncImage(url: .init(string: post.post.previewUrl),
                           content: { image in
                    image.resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 200)
                }, placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(maxHeight: 200)
                        .aspectRatio(CGFloat(651) / CGFloat(369), contentMode: .fill)
                })
                Text(post.post.title.uppercased())
                    .font(Font.themeRegular(with: 16))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        case .small:
            HStack {
                VStack {
                    AsyncImage(url: .init(string: post.post.previewUrl)) { image in
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
                Text(post.post.title.uppercased())
                    .font(Font.themeRegular(with: 14))
                    .frame(alignment: .top)
            }
        }
    }
}
