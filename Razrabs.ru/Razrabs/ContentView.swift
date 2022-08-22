import SwiftUI

struct ContentView: View {
    let razrabsApi: RazrabsApi
    
    var body: some View {
        Text("Hello, world!")
            .padding()
            .onAppear {
                razrabsApi.requestFeed(callback: { result in
                    print("result = \(result)")
                })
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(razrabsApi: .init(scheme: "https", host: "api.razrabs.ru"))
    }
}
