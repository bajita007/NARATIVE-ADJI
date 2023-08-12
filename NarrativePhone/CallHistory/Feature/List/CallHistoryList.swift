import SwiftUI

struct CallHistoryList: View {
    private let tabs = ["すべて", "不在着信"]
    
    private let service = CallHistoryService()
    
    @State private var filter = 0
    
    @State private var callHistory: [PhoneCall] = []
    
    func deleteItems(at offsets: IndexSet) {
        callHistory.remove(atOffsets: offsets)
    }
    
    var body: some View {
        NavigationView {
            ScrollView{
                VStack(spacing: 0) {
                    ForEach(callHistory) { call in
                        CallHistoryListItem(call: call)
                    }
                }
            }
            .navigationTitle("履歴")
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HStack {
                        Picker(selection: self.$filter, label: Text("Choose One")) {
                            ForEach(0..<tabs.count, id: \.self, content: { index in
                                Text(tabs[index])
                            })
                        }
                        .frame(width: 200)
                        .pickerStyle(SegmentedPickerStyle())
                        .onChange(of: filter) { newValue in
                            self.callHistory = service.getCallHistoryList(
                                filter: newValue == 0
                                    ? CallHistoryListFilter.all
                                    : CallHistoryListFilter.missed)
                        }
                    }
                }
            }
        }
        .task {
            self.callHistory = service.getCallHistoryList(filter: .all)
        }
    }
}

struct CallHistoryList_Previews: PreviewProvider {
    static var previews: some View {
        CallHistoryList()
    }
}
