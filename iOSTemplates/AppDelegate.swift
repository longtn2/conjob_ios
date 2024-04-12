import IQKeyboardManagerSwift
import UIKit

let iqKeyboard = IQKeyboardManager.shared

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        configIQKeyBoardManager()
        return true
    }

    private func configIQKeyBoardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = false
    }
}
