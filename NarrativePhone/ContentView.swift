import SwiftUI

struct ContentView: View {
    @State var isAuthenticated: Bool = false
    
    var body: some View {
        if(isAuthenticated) {
            MainScreenView()
        } else {
            Start()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
