import SwiftUI

struct ContactGroupHeading: View {
    let title:String
    
    @Binding var showModal: Bool
    
    @Binding var categoryName: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .colorMultiply(Color.black)
            
            Spacer()
            
            HStack {
                Button {
                    showModal = true
                    categoryName = title
                }
                label: {
                    Image(systemName: "highlighter")
                        .resizable()
                        .frame(width: 20, height: 20)
                        .foregroundColor(.blue)
                        .padding(5)
                }
                
                Button{
                    print("Switch")
                }
                label: {
                    Image(systemName: "person.line.dotted.person")
                        .resizable()
                        .frame(width: 35, height: 20)
                        .foregroundColor(.blue)
                        .padding(5)
                }
            }
            
        }
        .padding(EdgeInsets(top: 8, leading: 20, bottom: 8, trailing: 20))
        .background(Color.gray.opacity(0.2))
    }
}
