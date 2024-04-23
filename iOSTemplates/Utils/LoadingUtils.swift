import Foundation
import UIKit

class LoadingUtils {

    private static var loading = LoadingUtils()

    static func shared() -> LoadingUtils {
        return loading
    }

    private var isLoading = false
    func showLoadingView(isLoading: Bool, completion: (() -> Void)? = nil) {
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
                    topController.present(loadingVc, animated: false)
                default:
                    topController.dismiss(animated: false)
                }
            }
        }
        completion?()
    }
}
