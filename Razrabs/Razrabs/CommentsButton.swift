import SwiftUI

struct CommentsButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Rectangle()
                    .foregroundColor(Color("FeedItemBack"))
                Text(title)
                    .foregroundColor(Color("PostDateFore"))
                    .font(Font.themeRegular(with: 14))
            }
        }
    }
}
