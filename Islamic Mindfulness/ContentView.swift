import SwiftUI
//ContentView

struct ContentView: View {
    var body: some View {
        TabView {
            //Text("Home")
            //    .tabItem {
            //        Image(systemName: "house")
            //        Text("Home")
            //    }
            
            //Text("Nature")
            //    .tabItem {
            //        Image(systemName: "leaf")
            //        Text("Nature")
            //    }
            
            //Text("Dhikr")
            //    .tabItem {
            //        Image(systemName: "heart")
            //        Text("Dhikr")
            //    }
            
            QuranView()
                .tabItem {
                    Image(systemName: "book")
                    Text("Quran")
                }
            
            //Text("Profile")
            //    .tabItem {
            //        Image(systemName: "person")
            //        Text("Profile")
            //    }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
