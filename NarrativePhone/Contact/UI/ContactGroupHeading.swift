import SwiftUI

struct ContactGroupHeading: View{
    var title:String
    
    var body: some View{
        HStack{
            Text(title).font(.headline)
            
            Spacer()
            
            HStack{
                Button{
                    print("Edit")
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
    }
}
