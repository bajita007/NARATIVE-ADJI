import SwiftUI

struct FavoriteContactList: View {
    // TODO: move to data access file
    @State private var contacts = [
        Contact(
            id: 1,
            contact: "山田太郎",
            group: "仕事",
            desk: "クロースフィールド株式会社　代表",
            fav:false
        ),
        Contact(
            id: 2,
            contact: "山田太郎",
            group: "仕事",
            desk: "クロースフィールド株式会社　代表",
            fav:true
        )
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(contacts){ (item) in
                    ContactListItem(contact:item)
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("お気に入り")
        }
    }
}

struct FavoriteContactList_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteContactList()
    }
}
