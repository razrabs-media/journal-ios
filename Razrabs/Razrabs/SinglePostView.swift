import SwiftUI

struct SinglePostView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

    let post: SimplePost
    
    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: .init(string: post.previewUrl),
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
                Text("Автор статьи".uppercased())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.themeRegular(with: 14))
                    .padding([.leading, .trailing], 1)
                Text({ post -> String in
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "dd MMMM"
                    return dateFormatter.string(from: post.createdAt)
                }(post).uppercased())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.themeRegular(with: 12))
                    .foregroundColor(Color("PostDateFore"))
                    .padding([.leading, .trailing], 1)
                Text(post.title.uppercased())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.themeRegular(with: 20))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding([.leading, .trailing, .top], 1)
                    .foregroundColor(.label)
                Text(post.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(Font.themeRegular(with: 20))
                    .fixedSize(horizontal: false, vertical: true)
                    .padding([.leading, .trailing, .top], 1)
                    .foregroundColor(Color("PostDateFore"))
                Rectangle()
                    .strokeBorder(Color.label)
                    .frame(height: 1)
                /*ScrollView(.horizontal) {
                    HStack {
                        
                    }
                }*/
                Spacer()
            }
        }
        .padding()
        .navigationTitle("Разрабы")
        .background(Color(.white))
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: backButton)
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
