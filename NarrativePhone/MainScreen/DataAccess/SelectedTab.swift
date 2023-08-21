import SwiftUI
import Combine

final class SelectedTab: ObservableObject {
    let customActionteminidex = 1

    let objectWillChange = PassthroughSubject<SelectedTab, Never>()
    
    var isCustomItemSelected: Bool = false

    var itemSelected: Int {
        didSet {
            if itemSelected == 1 {
                objectWillChange.send(self)
                isCustomItemSelected = true
                itemSelected = oldValue
            } else {
                isCustomItemSelected = false
            }
        }
    }

    init(initialIndex: Int = 3) {
        self.itemSelected = initialIndex
    }
}
