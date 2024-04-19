import UIKit

final class LoginViewController: ViewController {
    //MARK: IBOutlets
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var errorEmailLabel: UILabel!
    @IBOutlet private weak var errorPasswordLabel: UILabel!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet weak var passwordView: UIView!
    //MARK: Propeties
    var viewModel: LoginViewModel?
    private var checkMail: Bool = false
    private var checkPass: Bool = false
    private enum Const {
        static let loginText: String = "Login"
    }
    //MARK: Functions
    override func setupUI() {
        emailTextField.delegate = self
        passwordTextField.delegate = self
        let color = UIColor.hexStringToUIColor(hex: "#EBEBEB")
        passwordView.customCorner(with: 1, radius: 5, color: color)
        continueButton.customRoundCorners(radius: 8)
        continueButton.isEnabled = false
        let image = UIImage(named: NameIcon.icon_back)
        setupUINavigationBar(withtitle: "", left: image, right: UIImage())
        titleLabel.text = Const.loginText
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
        sender.isSelected = !sender.isSelected
        let image = UIImage(named: sender.isSelected ? NameIcon.icon_show: NameIcon.icon_hide)
        sender.setImage(image, for: .normal)
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    @IBAction private func continueButtonTouchUpInside(_ sender: UIButton) {
        LoadingUtils.shared().showLoadingView(isLoading: true)
        viewModel?.loginHandler(withEmail: emailTextField.text ?? "", pass: passwordTextField.text ?? "", completion: { [weak self] result in
            LoadingUtils.shared().showLoadingView(isLoading: false) {
                guard let this = self else { return }
                DispatchQueue.main.async {
                    switch result {
                    case .success:
                        let homeVC = HomeController()
                        this.navigationController?.isNavigationBarHidden = true
                        this.navigationController?.pushViewController(homeVC, animated: true)
                    case .failure(let error):
                        this.alert(error: error)
                    }
                }
            }
        })
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
            let check = RegexManager.shared.isValidEmail(text)
            checkMail = check
            showError(errorEmailLabel, testErr: checkEmpty ? ErrorRegister.validateEmailNull : ErrorRegister.validateEmail, check: check)
        default:
            let check = RegexManager.shared.isValidatePassword(text)
            checkPass = check
            showError(errorPasswordLabel, testErr: checkEmpty ? ErrorRegister.validatePasswordNull : ErrorRegister.validatePasswordRequire, check: check)
        }
        continueButton.isEnabled = (checkMail && checkPass) ? true : false
    }
}
