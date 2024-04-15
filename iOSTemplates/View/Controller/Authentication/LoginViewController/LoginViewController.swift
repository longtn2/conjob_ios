import UIKit

final class LoginViewController: ViewController {
    //MARK: IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorEmailLabel: UILabel!
    @IBOutlet private weak var errorPasswordLabel: UILabel!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    //MARK: Propeties
    var viewModel: LoginViewModel?
    private var isShow: Bool = true
    private var checkMail: Bool = false
    private var checkPass: Bool = false
    private enum Const {
        static let registerText: String = "Register"
        static let loginText: String = "Login"
        
    }
    //MARK: Functions
    override func setupUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        continueButton.customRoundCorners(radius: 8)
        continueButton.isEnabled = false
        if let viewModel = viewModel {
            let image = viewModel.isReister ? UIImage(named: NameIcon.icon_back) : UIImage(named: NameIcon.logo_small)
            setupUINavigationBar(withtitle: "", left: image, right: UIImage())
            titleLabel.text = viewModel.isReister ? Const.registerText : Const.loginText
        }
    }

    override func tapLeftBarButton() {
        navigationController?.popViewController(animated: true)
    }

    private func showError(_ label: UILabel, testErr: String, check: Bool = false) {
        label.isHidden = check
        label.text = testErr
    }
    //MARK: - IBActions
    @IBAction private func hidenButtonTouchUpInside(_ sender: UIButton) {
        let image = UIImage(named: isShow ? NameIcon.icon_show : NameIcon.icon_hide)
        sender.setImage(image, for: .normal)
        passwordTextField.isSecureTextEntry = !isShow
        isShow = !isShow
    }
    @IBAction private func continueButtonTouchUpInside(_ sender: UIButton) {
        viewModel?.loginHandler(withEmail: emailTextField.text ?? "", pass: passwordTextField.text ?? "")
        let homeVC = HomeController()
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(homeVC, animated: true)
    }
}
//MARK: UITextFieldDelegate
extension LoginViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {
            return
        }
        let checkEmpty = text.isEmpty
        switch textField {
        case emailTextField:
            let check = text.isValidEmail(text)
            checkMail = check
            showError(errorEmailLabel, testErr: checkEmpty ? ErrorRegister.validateEmailNull : ErrorRegister.validateEmail, check: check)
        default:
            let check = text.isValidatePassword(text)
            checkPass = check
            showError(errorPasswordLabel, testErr: checkEmpty ? ErrorRegister.validatePasswordNull : ErrorRegister.validatePasswordRequire, check: check)
        }
        continueButton.isEnabled = (checkMail && checkPass) ? true : false
    }
}
