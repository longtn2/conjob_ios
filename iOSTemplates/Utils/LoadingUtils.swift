import Foundation
import UIKit

class LoadingUtils {
    
    static var share = LoadingUtils()
    
    func showLoadingView(isLoading: Bool) {
        DispatchQueue.main.async {
            let loadingVc = LoadingViewController()
            loadingVc.viewModel = LoadingViewModel()
            loadingVc.viewModel?.isLoading = isLoading
            loadingVc.modalPresentationStyle = .overCurrentContext
            
            // Lấy ra window chính của ứng dụng
            let keyWindow = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
            
            // Nếu tìm thấy window chính, thực hiện hiển thị loadingVc trên topController hiện tại
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
