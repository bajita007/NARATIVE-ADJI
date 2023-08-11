import SwiftUI

struct FavoriteContactListItem: View {
    let contact: AddressEntry
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.fill")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                    .padding(10)
                    .background(Color.green)
                    .clipShape(Circle())
                
                
                VStack(alignment: .leading) {
                    Text(contact.name)
                        .font(.headline)
                    
                    Text(contact.description ?? "")
                        .font(.system(size: 12))
                        .colorMultiply(.secondary)
                }
                
                Spacer()
                
                NavigationLink(destination: ContactDetail(contact: contact)) {
                    Image(systemName: "info.circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundColor(.blue)
                }
            }
            
            Divider()
        }
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
    }
}
