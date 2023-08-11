import SwiftUI

struct CallHistoryListItem: View {
    let call : Call
    
    var statusColor: Color {
        get {
            if (call.status == 1) {
                return Color.green
            }
            
            if (call.status == 2) {
                return Color.blue
            }
            
            return Color.red
        }
    }
    
    var statusLabel: String {
        get {
            if (call.status == 1) {
                return "着信"
            }
            
            if (call.status == 2) {
                return "発信"
            }
            
            return "不在着信"
        }
    }
    
    var body: some View {
        HStack {
            Image(systemName: "phone.fill")
                .resizable()
                .frame(width: 20, height: 20)
                .foregroundColor(.white)
                .padding(10)
                .background(statusColor)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(call.contact)
                    .font(.headline)
                    .foregroundColor(statusColor)
                
                Text(statusLabel)
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
