import SwiftUI

struct ContactDetail: View {
    @State private var desk: String = ""
    @State private var fav: Int = 0
  
    
    var body: some View {
        NavigationView {
                List{
                    Section{
                        Group{
                            VStack{
                                Image(systemName: "person.fill")
                                    .resizable()
                                    .frame(width: 120, height: 120)
                                    .foregroundColor(.white)
                                    .padding(30)
                                    .background(Color.green)
                                    .clipShape(Circle())
                                // Name in kanji
                                Text("山田太郎").font(.title2)
                                // Name in hiragana
                                Text("やまだたろう").font(.system(size: 14))
                                // Description
                                TextField("メモ", text: $desk)
                                    .textFieldStyle(.roundedBorder)
                            }
                        }
                    }
                    
                    Section{
                        Group{
                            VStack{
                                Text("ナラティブブック")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                HStack{
                                    Text("NBID").font(.body)
                                    Spacer()
                                    Text("yamada").font(.body)
                                }
                                
                                HStack{
                                    // Open NarrativeBook
                                    Text("ナラティブブック開く")
                                        .font(.system(size: 11))
                                        .frame(maxWidth: .infinity, alignment: .trailing)
                                    Image(systemName: "square.and.pencil")
                                        .frame(width: 9, height: 9)
                                }
                                .onTapGesture { print("author") }
                                .foregroundColor(Color.blue)
                                
                                Divider()
                                
                                HStack{
                                    // Favorite
                                    Text("お気に入り")
                                    Image(systemName: fav == 0 ? "star": "star.fill")
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .onTapGesture {  fav = fav == 0 ? 1 : 0}
                                .foregroundColor(fav == 0 ? Color.black:Color.yellow)
                                
                                HStack{
                                    // Group Name
                                    Text("グループ：仕事")
                                    Spacer()
                                    // Change Group
                                    Button(action: {
                                        print("ganti group")
                                    }) {
                                        Text("グループを変更")
                                    }
                                    .padding(5)
                                    .background(Color.secondary)
                                    .foregroundColor(.white)
                                    .cornerRadius(5)
                                }
                            }
                        }
                    }
                    Image(systemName: "phone.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.white)
                        .padding(20)
                        .background( Color.green)
                        .clipShape(Circle())
                        .frame(width: UIScreen.main.bounds.width, alignment: .center)
                        .listRowBackground(Color.clear)
                }
            }
        .navigationTitle("連絡先詳細")
    }
}

struct ContactDetail_Previews: PreviewProvider {
    static var previews: some View {
        ContactDetail()
    }
}
