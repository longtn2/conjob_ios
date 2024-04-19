import Foundation
import UIKit

class LoadingUtils {
    
    private static var loading = LoadingUtils()
    
    static func shared() -> LoadingUtils {
        return loading
    }
    
    func showLoadingView(isLoading: Bool) {
        DispatchQueue.main.async {
            let loadingVc = LoadingViewController()
            loadingVc.viewModel = LoadingViewModel()
            loadingVc.viewModel?.isLoading = isLoading
            loadingVc.modalPresentationStyle = .overCurrentContext
            
            let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
            
            if var topController = keyWindow?.rootViewController {
                while let presentedViewController = topController.presentedViewController {
                    topController = presentedViewController
                }
                switch isLoading {
                case true:
                    topController.present(loadingVc, animated: true)
                default:
                    topController.dismiss(animated: true)
                }
            }
        }
    }
}
