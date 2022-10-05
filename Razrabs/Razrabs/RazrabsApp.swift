import SwiftUI
import SQLiteORM

fileprivate func getDocumentsDirectory() -> URL {
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

@main
struct RazrabsApp: App {
    let razrabsApi = RazrabsApi(scheme: "https", host: "api.razrabs.ru")
    let storage = Storage(filepath: getDocumentsDirectory().appendingPathComponent("db.sqlite").absoluteString)
    
    var body: some Scene {
        WindowGroup {
            MainView(razrabsApi: razrabsApi, storage: storage).onAppear {
//                UINavigationBar.appearance().tintColor = .clear
//                UINavigationBar.appearance().backIndicatorImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
//                UINavigationBar.appearance().backIndicatorTransitionMaskImage = UIImage(named: "back")?.withRenderingMode(.alwaysOriginal)
            }.onAppear {
                storage.sync()
            }
        }
    }
}
