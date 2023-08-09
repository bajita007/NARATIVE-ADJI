import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView{
            ContactList().tabItem(){
                Image(systemName: "person.2")
                Text("連絡先")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
