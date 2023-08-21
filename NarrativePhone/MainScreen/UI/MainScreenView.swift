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
            .actionSheet(isPresented: $selectedTab.isCustomItemSelected) {
                let account1 = ActionSheet.Button.default(Text("山田太郎")) {  }
                let account2 = ActionSheet.Button.default(Text("山田二郎")) {  }
                let cancelButton = ActionSheet.Button.cancel(Text("キャンセル")) {  }
                
                return ActionSheet(
                    title: Text("ユーザ切り替え"),
                    buttons: [account1, account2, cancelButton]
                )
            }
            
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
