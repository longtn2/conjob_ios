import UIKit

final class RegisterViewController: ViewController {
    //MARK: IBOutlets
    @IBOutlet private weak var firstNameTextField: UITextField!
    @IBOutlet private weak var lastNameTextField: UITextField!
    @IBOutlet private weak var phoneTextField: UITextField!
    @IBOutlet private weak var dateOfBirthTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!
    @IBOutlet private weak var errorDateLabel: UILabel!
    @IBOutlet private weak var errorPhoneLabel: UILabel!
    @IBOutlet private weak var errorLastNameLabel: UILabel!
    @IBOutlet private weak var errorFirstNameLabel: UILabel!
    @IBOutlet private weak var roleButton: UIButton!
    @IBOutlet private weak var genderButton: UIButton!

    //MARK: Propeties
    private enum Const {
        static let genders = ["Male", "Female", "Other"]
        static let roles = ["Candidate", "Recruiter"]
        static let logoSmallImageName: String = "logo_small"
    }
    
    private var menuGender: [UIMenuElement] = []
    private var menuRole: [UIMenuElement] = []
    private var checkFirst: Bool = false
    private var checkLast: Bool = false
    private var checkPhone: Bool = false
    private var checkDate: Bool = false
    
    //MARK: Functions
    override func setupData() {

    }
    override func setupUI() {
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.phoneTextField.delegate = self
        self.dateOfBirthTextField.isEnabled = false
        self.continueButton.customRoundCorners(radius: 7)
        self.continueButton.isHidden = true
        let image = UIImage(named: Const.logoSmallImageName)
        self.setupUINavigationBar(withtitle: "", left: image, right: UIImage())
        self.setupMenuChooseGender()
        self.setupMenuChooseRole()
        
    }

    private func setupMenuChooseGender() {
        self.genderButton.customRoundCorners(radius: 7)
        let actionClosure = { (action: UIAction) in

        }

        for gen in Const.genders {
            menuGender.append(UIAction(title: gen, handler: actionClosure))
        }

        if #available(iOS 14.0, *) {
            self.genderButton.menu = UIMenu(options: .displayInline, children: menuGender)
            self.genderButton.showsMenuAsPrimaryAction = true
            if #available(iOS 15.0, *) {
                self.genderButton.changesSelectionAsPrimaryAction = true
            } else {
                return
            }
        } else {
            return
        }
    }
    private func setupMenuChooseRole() {
        self.roleButton.customRoundCorners(radius: 7)
        let actionClosure = { (action: UIAction) in

        }

        for role in Const.roles {
            menuRole.append(UIAction(title: role, handler: actionClosure))
        }

        if #available(iOS 14.0, *) {
            self.roleButton.menu = UIMenu(options: .displayInline, children: menuRole)
            self.roleButton.showsMenuAsPrimaryAction = true
            if #available(iOS 15.0, *) {
                self.roleButton.changesSelectionAsPrimaryAction = true
            } else {
                return
            }
        } else {
            return
        }
    }

    override func tapLeftBarButton() {
        self.navigationController?.popViewController(animated: true)
    }
    //MARK: IBActions
    @IBAction private func chooseDateButtonTouchUpInside(_ sender: UIButton) {
        let datePickerVC = DatePickerViewController()
        datePickerVC.modalPresentationStyle = .overCurrentContext
        datePickerVC.delegate = self
        self.present(datePickerVC, animated: true)
    }
    @IBAction private func continueButtonTouchUpInside(_ sender: UIButton) {
        let loginVC = LoginViewController()
        loginVC.isRegister = true
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    private func showError(_ label: UILabel, testErr: String ,check: Bool = false) {
        label.isHidden = check
        label.text = testErr
    }
}

//MARK: DatePickerViewDelegate
extension RegisterViewController: DatePickerViewDelegate {
    func view(_ view: DatePickerViewController, needPerfom date: String) {
        self.checkDate = true
        dateOfBirthTextField.text = date
        continueButton.isHidden = (checkFirst && checkLast && checkPhone && checkDate) ? false : true
    }
}
//MARK: UITextFieldDelegate
extension RegisterViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        switch textField {
        case firstNameTextField:
            let check = text.isValidName(text)
            checkFirst = check
            self.showError(errorFirstNameLabel, testErr: ErrorRegister.enterFirstName, check: check)
        case lastNameTextField:
            let check = text.isValidName(text)
            checkLast = check
            self.showError(errorLastNameLabel, testErr: ErrorRegister.enterLastName, check: check)
        case phoneTextField:
            let check = text.isValidPhone(text)
            checkPhone = check
            self.showError(errorPhoneLabel, testErr: ErrorRegister.enterPhone, check: check)
        default:
            return
        }
        continueButton.isHidden = (checkFirst && checkLast && checkPhone && checkDate) ? false : true
    }
}

