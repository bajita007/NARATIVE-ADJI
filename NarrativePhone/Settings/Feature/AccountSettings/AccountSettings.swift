import SwiftUI

struct AccountSettings: View {
    @ObservedObject var vm = AccountViewModel()
    
    var body: some View {
        NavigationView {
            GeometryReader { _ in
                switch vm.state {
                case .idle:
                    Color.clear.onAppear {
                        vm.getAll()
                    }
                case .loading:
                    LoadingView()
                case .success(let items):
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(items) { account in
                                Section {
                                    AccountListItem(account: account)
                                }
                            }
                        }
                    }
                case .failure(let error):
                    ErrorView(error: error)
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
