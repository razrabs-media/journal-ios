import SwiftUI

@main
struct RazrabsApp: App {
    let razrabsApi = RazrabsApi(scheme: "https", host: "api.razrabs.ru")
    
    var body: some Scene {
        WindowGroup {
            MainView(razrabsApi: razrabsApi).onAppear {
                /*let themeRegularFont = UIFont(name: "StyreneBLCWeb-Regular", size: 12)
                let themeMediumFont = UIFont(name: "StyreneBLCWeb-Medium", size: 12)
                let themeBoldFont = UIFont(name: "StyreneBLCWeb-Bold", size: 12)
                for familyName in UIFont.familyNames {
                    for font in UIFont.fontNames(forFamilyName: familyName) {
                        print("font = \(font)")
                    }
                }*/
            }
        }
    }
}
