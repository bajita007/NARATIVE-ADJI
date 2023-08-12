import SwiftUI

struct ContactList: View {
    private let service = ContactService()
    
    @State private var contactCategories: [AddressCategory] = []
    
    @State var showModal: Bool = false
    
    @State var selectedContactCategory: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 0) {
                        ForEach(contactCategories) { category in
                            Section(
                                header: ContactGroupHeading(
                                    category: category,
                                    onEditClicked: { category in
                                        showModal = true
                                        selectedContactCategory = category.name
                                    }
                                )
                                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                                .foregroundColor(.blue)
                            ) {
                                ForEach(service.getByCategory(categoryId: category.id)) { contact in
                                    ContactListItem(contact: contact)
                                }
                            }
                        }
                    }
                }
                .navigationTitle("連絡先")
                .navigationBarItems(
                    trailing: Button {
                        selectedContactCategory = ""
                        showModal = true
                    } label: {
                        // Add Contact Category
                        Text("グループ追加")
                    }
                )
                
                if showModal {
                    ContactCategoryModal(
                        title: selectedContactCategory == ""
                            ? "連絡先グループ追加" // Add group
                            : "連絡先グループ名変更", // Edit group
                        action: {
                            showModal = false
                            selectedContactCategory = ""
                        },
                        isActive: $showModal,
                        categoryName: $selectedContactCategory
                    )
                }
            }
        }
        .task {
            self.contactCategories = service.getContactCategories()
        }
    }
}

struct ContactList_Previews: PreviewProvider {
    static var previews: some View {
        ContactList()
    }
}

