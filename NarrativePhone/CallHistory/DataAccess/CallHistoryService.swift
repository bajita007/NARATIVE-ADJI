enum CallHistoryListFilter: CaseIterable {
    case all
    case missed
}

class CallHistoryService {
    func getCallHistoryList(filter: CallHistoryListFilter) -> [Call] {
        if (filter == .missed) {
            return [
                Call(id: 3, contact: "山田太郎", time: "9:35 AM", status: 3),
                Call(id: 4, contact: "山田太郎", time: "9:35 AM",status: 3)
            ]
        }
        
        return [
            Call(id: 1,contact: "山田太郎", time: "9:40 AM", status: 2),
            Call(id: 2, contact: "山田太郎", time: "9:35 AM", status: 1),
            Call(id: 3, contact: "山田太郎", time: "9:35 AM", status: 3),
            Call(id: 4, contact: "山田太郎", time: "9:35 AM",status: 3)
        ]
    }
}
