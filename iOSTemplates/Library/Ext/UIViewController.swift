import UIKit

extension UIViewController {

    func alert(error: APIError, handler: ((UIAlertAction) -> Void)? = nil) {
        switch error {
        case .cancelRequest:
            return
        default:
            alert(title: "", msg: error.errorDescription, handler: handler)
        }
    }

    func alert(title: String? = nil,
               msg: String,
               buttons: [String] = [App.String.Common.okButton],
               preferButton: String = "",
               handler: ((UIAlertAction) -> Void)?) {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        for button in buttons {
            let action = UIAlertAction(title: button, style: .default, handler: { action in
                handler?(action)
            })
            alert.addAction(action)

            // Bold button title
            if preferButton.isNotEmpty && preferButton == button {
                alert.preferredAction = action
            }
        }

        present(alert, animated: true, completion: nil)
    }
}
