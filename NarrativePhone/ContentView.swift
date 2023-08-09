import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            AccountList().tabItem(){
                Image(systemName: "person.circle")
                Text("ユーザー切り替え")
            }
            FavoriteContactList().tabItem(){
                Image(systemName: "star")
                Text("お気に入り")
            }
            ContactList().tabItem(){
                Image(systemName: "person.2")
                Text("連絡先")
            }
            CallHistoryList().tabItem(){
                Image(systemName: "clock")
                Text("履歴")
            }
            AccountSettings().tabItem(){
                Image(systemName: "gear")
                Text("設定")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
