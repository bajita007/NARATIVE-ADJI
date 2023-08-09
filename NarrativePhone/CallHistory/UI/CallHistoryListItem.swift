import SwiftUI

struct CallHistoryListItem: View {
    var call : Call
    
    var body: some View {
        HStack {
            Image(systemName: "phone.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(10)
                .background(call.status == 3 ?Color.red : call.status == 2 ? Color.blue:Color.green)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(call.contact)
                    .font(.headline)
                    .foregroundColor(call.status == 3 ?Color.red : call.status == 2 ? Color.blue:Color.green)
                Text(call.status == 3 ? "不在着信" : call.status == 2 ? "発信": "着信")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            HStack {
                Text(call.time)
                    .foregroundColor(.secondary)
                Image(systemName: "info.circle")
                    .foregroundColor(.blue)
            }
        }
    }
}
