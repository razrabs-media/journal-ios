import SwiftUI

@main
struct RazrabsApp: App {
    let razrabsApi = RazrabsApi(scheme: "https", host: "api.razrabs.ru")
    
    var body: some Scene {
        WindowGroup {
            MainView(razrabsApi: razrabsApi).onAppear {
//                UINavigationBar.appearance().tintColor = .clear
//                UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
//                UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
            }
        }
    }
}
