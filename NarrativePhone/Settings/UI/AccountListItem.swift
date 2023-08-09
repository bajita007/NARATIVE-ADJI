import SwiftUI

struct AccountListItem: View {
    var account : Account
    
    var body: some View {
        VStack {
            HStack{
                Text(account.nama).font(.headline)
                
                Spacer()
                
                Button{
                    print("Edit")
                }
                label:{
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
                HStack{
                    Text("ナラティブフォンID").font(.body)
                    Spacer()
                    Text(account.ddID).font(.body)
                }
                
                // Fullname
                HStack{
                    Text("表示名").font(.body)
                    Spacer()
                    Text(account.dd1).font(.body)
                }
                
                // Description
                HStack{
                    Text("説明").font(.body)
                    Spacer()
                    Text(account.dd2).font(.body)
                }
                
                // Email Address
                HStack{
                    Text("メールアドレス").font(.body)
                    Spacer()
                    Text(account.email).font(.body)
                    
                }
                
                Divider()
            }
            
            // NarrativeBook Account Info
            Group{
                Text("ナラティブブック")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // NarrativeBook ID
                HStack{
                    Text("NBID").font(.body)
                    Spacer()
                    Text(account.NBID).font(.body)
                }
                
                // Author ID
                HStack{
                    Text("AuthorID").font(.body)
                    Spacer()
                    Text(account.authorId).font(.body)
                    
                }
                
                // Open NarrativeBook
                HStack{
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
            Group{
                Text("Zoom")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                // Zoom ID
                HStack{
                    Text("ID").font(.body)
                    Spacer()
                    Text(account.zoomId).font(.body)
                    
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
    }
}
