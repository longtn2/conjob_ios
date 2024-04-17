import UIKit

final class RegisterViewController: ViewController {
    //MARK: IBOutlets
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var addressTextField: UITextField!
    @IBOutlet private weak var dateOfBirthTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var errorDateLabel: UILabel!
    @IBOutlet private weak var errorPhoneLabel: UILabel!
    @IBOutlet private weak var errorLastNameLabel: UILabel!
    @IBOutlet private weak var errorFirstNameLabel: UILabel!
    @IBOutlet private weak var errorEmailLabel: UILabel!
    @IBOutlet private weak var errorPasswordLabel: UILabel!
    @IBOutlet private weak var errorAddressLabel: UILabel!
    @IBOutlet private weak var dateOfBirthButton: UIButton!
    @IBOutlet private weak var roleButton: UIButton!
    @IBOutlet private weak var genderButton: UIButton!
    @IBOutlet private weak var passwordView: UIView!
    @IBOutlet private weak var dayOfBirthView: UIView!
    
    //MARK: Propeties
    var viewModel: RegisterViewModel?
    private enum Const {
        static let genders = ["Male", "Female", "Other"]
        static let roles = ["Candidate", "Recruiter"]
    }

    private var menuGender: [UIMenuElement] = []
    private var menuRole: [UIMenuElement] = []

    //MARK: Functions
    override func setupData() {

    }
    override func setupUI() {
        firstNameTextField.delegate = self
        lastNameTextField.delegate = self
        phoneTextField.delegate = self
        addressTextField.delegate = self
        emailTextField.delegate = self
        passwordTextField.delegate = self
        dateOfBirthTextField.isEnabled = false
        continueButton.customRoundCorners(radius: 8)
        continueButton.isEnabled = false
        let image = UIImage(named: NameIcon.icon_back)
        setupUINavigationBar(withtitle: "", left: image, right: UIImage())
        setupMenuChooseGender()
        setupMenuChooseRole()
        let color = UIColor.hexStringToUIColor(hex: "#EBEBEB")
        dayOfBirthView.customCorner(with: 1, radius: 5, color: color)
        passwordView.customCorner(with: 1, radius: 5, color: color)
    }

    private func setupMenuChooseGender() {
        self.genderButton.customRoundCorners(radius: 7)
        let actionClosure = { (action: UIAction) in

        }

        for gen in Const.genders {
            menuGender.append(UIAction(title: gen, handler: actionClosure))
        }

        if #available(iOS 14.0, *) {
            genderButton.menu = UIMenu(options: .displayInline, children: menuGender)
            genderButton.showsMenuAsPrimaryAction = true
            if #available(iOS 15.0, *) {
                genderButton.changesSelectionAsPrimaryAction = true
            } else {
                return
            }
        } else {
            return
        }
    }
    private func setupMenuChooseRole() {
        roleButton.customRoundCorners(radius: 7)
        let actionClosure = { (action: UIAction) in

        }

        for role in Const.roles {
            menuRole.append(UIAction(title: role, handler: actionClosure))
        }

        if #available(iOS 14.0, *) {
            roleButton.menu = UIMenu(options: .displayInline, children: menuRole)
            roleButton.showsMenuAsPrimaryAction = true
            if #available(iOS 15.0, *) {
                roleButton.changesSelectionAsPrimaryAction = true
            } else {
                return
            }
        } else {
            return
        }
    }

    override func tapLeftBarButton() {
        navigationController?.popViewController(animated: true)
    }
    //MARK: IBActions
    @IBAction private func chooseDateButtonTouchUpInside(_ sender: UIButton) {
        let datePickerVC = DatePickerViewController()
        datePickerVC.modalPresentationStyle = .overCurrentContext
        datePickerVC.delegate = self
        self.present(datePickerVC, animated: true)
    }
    @IBAction private func showOrHideButtonTouchUpInside(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        let image = UIImage(named: sender.isSelected ? NameIcon.icon_show : NameIcon.icon_hide)
        sender.setImage(image, for: .normal)
        passwordTextField.isSecureTextEntry = !sender.isSelected
    }
    @IBAction private func continueButtonTouchUpInside(_ sender: UIButton) {
        let homeVC = HomeController()
        navigationController?.isNavigationBarHidden = true
        navigationController?.pushViewController(homeVC, animated: true)
    }

    private func showError(_ label: UILabel, testErr: String, check: Bool = false) {
        label.isHidden = check
        label.text = testErr
    }


}

//MARK: DatePickerViewDelegate
extension RegisterViewController: DatePickerViewDelegate {
    func viewController(_ view: DatePickerViewController, needPerfom date: String) {
        guard let viewModel = viewModel else { return }
        viewModel.isDate = true
        dateOfBirthTextField.text = date
        continueButton.isEnabled = viewModel.enableButton()
    }
}
//MARK: UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        guard let viewModel = viewModel else { return }
        let checkEmpty = text.isEmpty
        switch textField {
        case firstNameTextField:
            viewModel.isFirst = RegexManager.shared.isValidName(text)
            showError(errorFirstNameLabel, testErr: checkEmpty ? ErrorRegister.validateFirstNameNull : ErrorRegister.validateFirstName, check: viewModel.isFirst)
        case lastNameTextField:
            viewModel.isLast = RegexManager.shared.isValidName(text)
            showError(errorLastNameLabel, testErr: checkEmpty ? ErrorRegister.validateLastNameNull : ErrorRegister.validateLastName, check: viewModel.isLast)
        case phoneTextField:
            viewModel.isPhone = RegexManager.shared.isValidPhone(text)
            showError(errorPhoneLabel, testErr: checkEmpty ? ErrorRegister.validatePhoneNull : ErrorRegister.validatePhone, check: viewModel.isPhone)
        case addressTextField:
            viewModel.isAddress = !checkEmpty
            showError(errorAddressLabel, testErr: checkEmpty ? ErrorRegister.validateAddressNull : ErrorRegister.validateAddress, check: viewModel.isAddress)
        case emailTextField:
            viewModel.isEmail = RegexManager.shared.isValidEmail(text)
            showError(errorEmailLabel, testErr: checkEmpty ? ErrorRegister.validateEmailNull : ErrorRegister.validateEmail, check: viewModel.isEmail)
        default:
            viewModel.isPass = RegexManager.shared.isValidatePassword(text)
            showError(errorPasswordLabel, testErr: checkEmpty ? ErrorRegister.validatePasswordNull : ErrorRegister.validatePasswordRequire, check: viewModel.isPass)
        }
        continueButton.isEnabled = viewModel.enableButton()
    }
}

