import SwiftUI

struct CreateCall: View {
    @State var startMeeting: Bool = false
    @State var meetingNumber: String = "9385999268"
    @State var meetingPassword: String = "bMar6n"
    
    var body: some View {
           VStack {
               VStack {
                   VStack {
                       HStack(alignment: .center) {
                           Image(systemName: "person.fill")
                               .resizable()
                               .frame(width: 20, height: 20)
                               .foregroundColor(.white)
                               .padding(10)
                               .background(Color.green)
                               .clipShape(Circle())
                           
                           VStack(alignment: .leading) {
                               // Caller account name
                               Text("個人用アカウント")
                                   .font(.headline)
                                   .colorMultiply(Color.black)
                           }
                       }
                       .padding(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 20))
                       
                       Divider()
                           .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                   }
                   
                   VStack {
                       HStack {
                           Image(systemName: "person.fill")
                               .resizable()
                               .frame(width: 15, height: 15)
                               .foregroundColor(.white)
                               .padding(8)
                               .background(Color.blue)
                               .clipShape(Circle())
                           
                           
                           VStack(alignment: .leading) {
                               // Attendee name
                               Text("山田太郎")
                                   .font(.headline)
                                   .colorMultiply(Color.black)
                           
                               // Attendee description
                               Text("クロースケアフィールド代表")
                                   .font(.system(size: 12))
                                   .colorMultiply(.secondary)
                           }
                                                   
                           Spacer()
                       }
                    
                   }
                   .padding(EdgeInsets(top: 0, leading: 20, bottom: 10, trailing: 20))

               }
               .background(.gray.opacity(0.2))
               .cornerRadius(15)
               .padding(EdgeInsets(top: 8, leading: 20, bottom: 0, trailing: 20))

               Image(systemName: "arrow.down")
                   .resizable()
                   .frame(width: 20, height: 15)
                   .foregroundColor(.black)
                   .padding(8)
                   .clipShape(Circle())
               
               
               Button(action: {
                   print("Add participant")
               }) {
                   HStack {
                       Image(systemName: "plus")
                       Text("通話先追加")
                   }
                   .foregroundColor(.green)
                   .padding(EdgeInsets(top: 4, leading: 20, bottom: 4, trailing: 20))

               }
               .background(.gray.opacity(0.35))
               .cornerRadius(15)
               
               Spacer()
               
               VStack {
                   HStack {
                       Spacer()
                       
                       Image(systemName: "xmark")
                           .resizable()
                           .padding(12)
                           .frame(width: 50, height: 50)
                           .foregroundColor(.white)
                           .padding(8)
                           .background(.red)
                           .clipShape(Circle())

                       Spacer()
                       
                       Button(action: {
                           self.startMeeting.toggle()
                       }) {
                           Image(systemName: "phone.fill")
                               .resizable()
                               .padding(12)
                               .frame(width: 50, height: 50)
                               .foregroundColor(.white)
                               .padding(8)
                               .background(.green)
                               .clipShape(Circle())
                       }
                       
                       Spacer()
                   }
                   .padding(.top)

                       
                   HStack {
                       Spacer()
                       
                       Image(systemName: "mic.fill")
                           .resizable()
                           .frame(width: 30, height: 35)
                           .foregroundColor(.black)
                           .padding(12)
                   
                       Spacer()
                       
                       Image(systemName: "camera.fill")
                           .resizable()
                           .frame(width: 40, height: 35)
                           .foregroundColor(.black)
                           .padding(12)
                  
                       Spacer()
                   }
               }
               .background(.gray.opacity(0.1))
           }
        
            if self.startMeeting{
                StartCallService(
                    delegate: StartCallService.Delegate(),
                    zoomMeetingNumber: $meetingNumber,
                    zoomPasscode: $meetingPassword
                )
            }
       }
}

struct CreateCall_Previews: PreviewProvider {
    static var previews: some View {
        CreateCall()
    }
}
