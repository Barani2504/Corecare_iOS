import SwiftUI

@main
struct Core_CareApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    @State private var openHeartRateView = false
    @StateObject private var userManager = UserManager.shared // ✅ Create shared instance here
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                AppRootView()
                    .environmentObject(userManager) // ✅ Provide to AppRootView
                    .navigationDestination(isPresented: $openHeartRateView) {
                        HRCheckView()
                            .environmentObject(userManager) // ✅ Also provide to HRCheckView
                    }
            }
            .onReceive(NotificationCenter.default.publisher(for: NSNotification.Name("OpenHeartRateView"))) { _ in
                openHeartRateView = true
            }
        }
    }
}

class Manager {
    static let shared = Manager()
    private init () {}
    var userData: LoginData?
}
