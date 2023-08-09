import SwiftUI

struct ContactListItem: View {
    var contact : Contact
    
    var body: some View {
        NavigationLink(destination: ContactDetail()) {
            
        HStack {
            Image(systemName: "person.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(10)
                .background(Color.green)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(self.contact.contact)
                    .font(.headline)
                Text(self.contact.desk)
                    .font(.subheadline).colorMultiply(Color.secondary)
            }
            
            Spacer()
            

            Image(systemName: "info.circle")
                .foregroundColor(.blue)
            }
        }
    }
}
