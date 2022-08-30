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
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                    .multilineTextAlignment(.center)
                    .padding()
            }
        case .medium:
            VStack {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(height: 200)
                Text(post.post.title.uppercased())
                    .font(Font.themeRegular(with: 16))
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
            }
        case .small:
            HStack {
                VStack {
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 50)
                    Spacer()
                }
                .frame(width: 80)
                Text(post.post.title.uppercased())
                    .font(Font.themeRegular(with: 16))
                    .frame(alignment: .top)
            }
//                                .frame(height: 140)
        }
    }
}
