import SwiftUI

struct ContactList: View {
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
        ),
        Contact(
            id: 3,
            contact: "山田太郎",
            group: "個人",
            desk: "クロースフィールド株式会社　代表",
            fav:false
        ),
    ]
    
    func groupBy(_ items: [Contact]) -> [(String, [Contact])] {
        let grouped = Dictionary(grouping: items, by: { $0.group})
        return grouped.sorted(by: { $0.key < $1.key })
    }
    
    func deleteItems(at offsets: IndexSet) {
        contacts.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(groupBy(contacts), id:\.0) { cont in
                    Section(header: ContactGroupHeading(title: cont.0)
                        .foregroundColor(.blue)) {
                            ForEach(cont.1) { item in
                                ContactListItem(contact:item)
                            }
                        .onDelete(perform: self.deleteItems)
                    }
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("連絡先")
            .navigationBarItems(
                trailing: Button{
                    print("ADD")
                }
                label: {
                    // Add Group
                    Text("グループ追加")
                }
            )
               
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList()
    }
}

