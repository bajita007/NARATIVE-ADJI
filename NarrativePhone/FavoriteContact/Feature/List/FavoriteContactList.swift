import SwiftUI

struct FavoriteContactList: View {
    private let service = FavoriteContactService()
    
    @State private var contacts: [AddressEntry] = []
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack {
                    ForEach(contacts) { item in
                        FavoriteContactListItem(contact: item)
                    }
                    .navigationTitle("お気に入り")
                }
            }
        }
        .task {
            self.contacts = service.getAll()
        }
    }
}

struct FavoriteContactList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteContactList()
    }
}
