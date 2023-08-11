import SwiftUI

struct ContactListItem: View {
    let contact : AddressEntry
    
    var body: some View {
        NavigationLink(destination: ContactDetail(contact: contact)) {
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
                            .colorMultiply(Color.black)
                        
                    
                        Text(contact.description ?? "")
                            .font(.system(size: 12))
                            .colorMultiply(.secondary)
                    }
                    
                    Spacer()
                }
                
                Divider().frame(height: 1).padding(0)
            }
            .padding(EdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 20))
        }
    }
}
