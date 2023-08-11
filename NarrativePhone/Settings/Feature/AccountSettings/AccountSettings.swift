import SwiftUI

struct AccountSettings: View {
    @State private var accounts = [
        Account(id: 1, ddID: "0000-0002-0001", nama: "Agus", dd1: "deskripsi 1", dd2: "deskripsi 2", email: "Agus@gm.com", NBID: "Agus", authorId: "User102", valueAuthorLink: "User102", zoomId: "Agus@gm.com", valueZoomLink: "Agus"),
        Account(id: 2, ddID: "0000-0002-0006", nama: "Abe", dd1: "deskripsi 1", dd2: "deskripsi 2", email: "Abe@gm.com", NBID: "Abe", authorId: "mem241", valueAuthorLink: "mem241", zoomId: "Abe@gm.com", valueZoomLink: "Abe"),
        Account(id: 3, ddID: "0000-0002-0009", nama: "Adji", dd1: "deskripsi 1", dd2: "deskripsi 2", email: "Adji@gm.com", NBID: "Adji", authorId: "Lol132", valueAuthorLink: "Lol132", zoomId: "Adji@gm.com", valueZoomLink: "Adji"),
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(accounts) { _account in
                    Section {
                        AccountListItem(account: _account)
                    }
                    .background(Color.clear)
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
    }
}

struct AccountSettings_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettings()
    }
}
