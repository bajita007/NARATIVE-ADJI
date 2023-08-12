import SwiftUI

struct AccountListItem: View {
    let account : User
    
    @State private var width: CGFloat? = 150
    
    var body: some View {
        Divider()
        
        VStack(alignment: .leading) {
            HStack{
                Text(account.accountName)
                    .font(.system(size: 20).weight(.bold))
                
                Spacer()
                
                NavigationLink(destination: EditAccount(account: account)) {
                    Image(systemName: "highlighter")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                        .padding(5)
                }
            }
            
            // Account Info
            Group {
                // NarrativePhone ID
                HStack {
                    Text("ナラティブフォンID").font(.subheadline)
                        .frame(width: width, alignment: .trailing)
                        .lineLimit(1)
                    Text(":").font(.subheadline)
                    Text(account.narrativePhoneId ?? "").font(.subheadline)
                }
                
                // Fullname
                HStack {
                    Text("表示").font(.subheadline)
                        .frame(width: width, alignment: .trailing)
                        .lineLimit(1)
                    Text(":").font(.subheadline)
                    Text(account.name).font(.subheadline)
                }
                
                // Description
                HStack {
                    Text("説明").font(.subheadline)
                        .frame(width: width, alignment: .trailing)
                        .lineLimit(1)
                    Text(":").font(.subheadline)
                    Text(account.description ?? "").font(.subheadline)
                }
                
                // Email Address
                HStack {
                    Text("メールアドレス").font(.subheadline)
                        .frame(width: width, alignment: .trailing)
                        .lineLimit(1)
                    Text(":").font(.subheadline)
                    Text(account.email).font(.subheadline)
                    
                }
                
                Divider()
            }
            
            // NarrativeBook Account Info
            Group {
                Text("ナラティブブック")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // NarrativeBook ID
                HStack {
                    Text("NBID").font(.subheadline)
                        .frame(width: width, alignment: .trailing)
                        .lineLimit(1)
                    Text(":").font(.subheadline)
                    Text(account.nbId ?? "").font(.subheadline)
                }
                
                // Author ID
                HStack {
                    Text("AuthorID").font(.subheadline)
                        .frame(width: width, alignment: .trailing)
                        .lineLimit(1)
                    Text(":").font(.subheadline)
                    Text(account.nbAuthorId ?? "").font(.subheadline)
                }
                
                // Open NarrativeBook
                HStack {
                    Text("ナラティブブック開く")
                        .font(.system(size: 11))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    
                    Image(systemName: "square.and.pencil")
                }
                .onTapGesture { print("author") }
                .foregroundColor(Color.blue)
                
                Divider()
            }
            
            // Zoom Account Info
            Group {
                Text("Zoom")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Zoom ID
                HStack{
                    Text("ID").font(.subheadline)
                        .frame(width: width, alignment: .trailing)
                        .lineLimit(1)
                    Text(":").font(.subheadline)
                    Text(account.zoomUserId).font(.body)
                    
                }
                
                // Reconnect to Zoom
                HStack{
                    Text("Zoomに再接続")
                        .font(.system(size: 11))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture { print("zoom") }
                        .foregroundColor(Color.blue)
                    Image(systemName: "square.and.pencil")
                }
                .onTapGesture { print("author") }
                .foregroundColor(Color.blue)
            }
        }
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
        
        Divider()
    }
}

struct AccountListItem_Previews: PreviewProvider {
    static var previews: some View {
        AccountListItem(
            account: User(
                id: 1,
                name: "山田太郎",
                accountName: "個人ようアカウント",
                email: "yamada@example.co.jp",
                nbId: "narrative-book-user",
                nbAuthorId:nil,
                nbOrganizationId: nil,
                narrativePhoneId: "yamada",
                zoomUserId: "yamadataro",
                zoomUserLastName: "山田",
                zoomUserFirstName: "太郎",
                zoomUserEmail: "yamada@example.co.jp",
                description: "クロースフィールド株式会社　代表",
                iconImg:nil,
                state: 1
            )
        )
    }
}
