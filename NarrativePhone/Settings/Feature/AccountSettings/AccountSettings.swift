import SwiftUI

struct AccountSettings: View {
    private let service = AccountService()
    
    @State private var accounts: [User] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 0) {
                    ForEach(accounts) { account in
                        Section {
                            AccountListItem(account: account)
                        }
                    }
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("設定")
            .navigationBarItems(
                trailing: Button {
                    print("ADD")
                } label: {
                    // Add Account
                    Text("アカウント追加")
                }
            )
        }
        .task {
            self.accounts = service.getAll()
        }
    }
}

struct AccountSettings_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettings()
    }
}
