import SwiftUI

protocol TagProtocol {
    var name: String { get }
}

struct TagCellView: View {
    let feedItem: TagProtocol
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
//                let isCurrentItemSelected = feedItem.uid == viewModel.selectedFeedItemUid
            let isCurrentItemSelected = false   //  TODO
            Text(feedItem.name.uppercased())
                .padding(6)
                .font(Font.themeRegular(with: 14))
                .background(isCurrentItemSelected ? Color("FeedItemBackSelected") : Color("FeedItemBack"))
                .foregroundColor(isCurrentItemSelected ? Color("FeedItemForeSelected") : Color("FeedItemFore"))
        }
    }
}
