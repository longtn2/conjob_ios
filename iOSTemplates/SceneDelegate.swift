import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    static var shared: SceneDelegate {
        guard let scene = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate else {
            fatalError("Can not case scene delegate")
        }
        return scene
    }

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScence = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScence)
        configWindow()
    }

    // MARK: - Private functions

    private func configWindow() {
        //let exampleVC = ExampleVC()
        //exampleVC.viewModel = ExampleVM()
        let onboardVC = OnboardingViewController()
        let navController = UINavigationController(rootViewController: onboardVC)
        window?.rootViewController = navController
        window?.backgroundColor = .white
        window?.makeKeyAndVisible()
        
//        let homeVC = HomeController()
//        let navController = UINavigationController(rootViewController: homeVC)
//        window?.rootViewController = navController
//        window?.backgroundColor = .white
//        window?.makeKeyAndVisible()
    }
}
