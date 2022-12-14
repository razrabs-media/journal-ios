import SwiftUI
import MarkdownUI
import CachedAsyncImage

struct SinglePostView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let razrabsApi: RazrabsApi

    @StateObject var viewModel: SinglePostViewModel
    
    var body: some View {
        ScrollView {
            VStack {
                CachedAsyncImage(url: .init(string: viewModel.postData.previewUrl),
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
                HStack {
                    Text("Автор статьи: ".uppercased())
                        .font(Font.themeRegular(with: 14))
                    if let name = viewModel.postData.authorName,
                       let urlString = viewModel.postData.authorUrl,
                       let url = URL(string: urlString) {
                        Link(name.uppercased(), destination: url)
                            .font(Font.themeRegular(with: 14))
                            .foregroundColor(Color("AuthorFore"))
                    } else {
                        Rectangle()
                            .foregroundColor(Color.gray)
                            .frame(width: 80, height: 10, alignment: .leading)
                    }
                    Spacer()
                }
                    .padding([.leading, .trailing], 1)
                Text(viewModel.createdAtString.uppercased())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.themeRegular(with: 12))
                    .foregroundColor(Color("PostDateFore"))
                    .padding([.leading, .trailing], 1)
                Text(viewModel.postData.title.uppercased())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.themeRegular(with: 20))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding([.leading, .trailing, .top], 1)
                    .foregroundColor(.label)
                Text(viewModel.postData.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.themeRegular(with: 20))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding([.leading, .trailing, .top], 1)
                    .foregroundColor(Color("PostDateFore"))
                Rectangle()
                    .strokeBorder(Color.label)
                    .frame(height: 1)
                ScrollView(.horizontal) {
                    HStack {
                        ForEach(viewModel.postData.tags, id: \TagItem.uid) { tagItem in
                            TagCellView(feedItem: tagItem) {
                                //..
                            }
                                .allowsHitTesting(false)
                        }
                    }
                }
                HStack(spacing: 0) {
                    CommentsButton(title: "Комменты: \(viewModel.postData.commentsCount)".uppercased()) {
                        print("comments touched")
                    }
                    CommentsButton(title: "Поделиться".uppercased()) {
                        print("share touched")
                    }
                }
                    .frame(height: 50)
                    .padding([.top], 4)
                Markdown(viewModel.postData.content)
                    .markdownStyle(.init(font: .custom(Font.themeRegularName, size: 20),
                                         foregroundColor: .init("PostTextFore"),
                                         measurements: .init(
                                            codeFontScale: 0.8,
                                            headingSpacing: 0.3
                                          )))
                    .accentColor(Color("AuthorFore"))
            }
        }
        .padding()
        .navigationTitle("Разрабы")
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
        .onAppear {
            razrabsApi.requestPost(with: viewModel.postData.uid) { result in
                switch result {
                case .success(let postResponse):
                    print("post received")
                    viewModel.postData = .post(post: postResponse.data.post)
                case .failure(let error):
                    print("error = \(error)")
                }
            }
        }
    }
    
    var backButton : some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "chevron.left")
            }
        }
    }
}
