import SwiftUI

struct MainScreenView: View {
    @ObservedObject private var selectedTab = SelectedTab()
    
    var body: some View {
        TabView (selection: $selectedTab.itemSelected) {
            Spacer().tabItem {
                Image(systemName: "person.circle")
                Text("ユーザー")
            }
            .tag(1)
            .alert("ユーザ切り替え", isPresented: $selectedTab.isCustomItemSelected, actions: {
                  Button("山田太郎", action: {})
                  Button("山田二郎", action: {})
                Button("キャンセル", role: .cancel, action: {})
           
            }, message: {
                Text("ユーザ切り替え")
            }
                
            )

            
            FavoriteContactList().tabItem {
                Image(systemName: "star")
                Text("お気に入り")
            }
            .tag(2)
            
            ContactList().tabItem {
                Image(systemName: "person.2")
                Text("連絡先")
            }
            .tag(3)
            
            CallHistoryList().tabItem {
                Image(systemName: "clock")
                Text("履歴")
            }
            .tag(4)
            
            AccountSettings().tabItem {
                Image(systemName: "gear")
                Text("設定")
            }
            .tag(5)
        }
    }
}

struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}
