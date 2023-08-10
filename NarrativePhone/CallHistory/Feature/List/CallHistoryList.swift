import SwiftUI

struct CallHistoryList: View {
    @State private var choices = ["すべて", "不在着信"]
    @State private var choice = 0
    @State private var callHistory = [
        Call(id: 1,contact: "山田太郎", time: "9:40 AM", status: 2),
        Call(id: 2, contact: "山田太郎", time: "9:35 AM", status: 1),
        Call(id: 3, contact: "山田太郎", time: "9:35 AM", status: 3),
        Call(id: 4, contact: "山田太郎", time: "9:35 AM",status: 3)
    ]
    
    var filterRes: [Call] {
        choice == 0 ? callHistory : callHistory.filter{
            $0.status == 3
        }
    }
    
    func deleteItems(at offsets: IndexSet) {
        callHistory.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(filterRes) { call in
                        CallHistoryListItem(call:call)
                    }
                    .onDelete(perform: self.deleteItems)
                }
                .listStyle(GroupedListStyle())
            }
            .navigationTitle("履歴")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Picker(selection: self.$choice,label: Text("Pilih Salah Satu")) {
                            ForEach(0..<choices.count, id: \.self, content: { index in
                                Text(choices[index])
                            })
                        }
                        .frame(width: 200)
                        .pickerStyle(SegmentedPickerStyle())
                    }
                }
            }
        }
    }
}

struct CallHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        CallHistoryList()
    }
}
