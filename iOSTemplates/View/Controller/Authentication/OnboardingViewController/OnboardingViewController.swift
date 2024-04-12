import UIKit

final class OnboardingViewController: ViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var loginView: UIView!
    @IBOutlet private weak var registerView: UIView!
    // MARK: - Propeties

    // MARK: - Functions
    override func setupUI() {
        loginView.customRoundCorners(radius: loginView.bounds.height / 2)
        registerView.customRoundCorners(radius: registerView.bounds.height / 2)
        tapView()
        self.navigationController?.isNavigationBarHidden = true
    }
    override func setupData() {

    }

    //MARK: - UITapGestureRecognizer
    private func tapView() {
        let gestureLoginView = UITapGestureRecognizer(target: self, action: #selector(self.tapLoginView))
        self.loginView.addGestureRecognizer(gestureLoginView)

        let gestureRegisterView = UITapGestureRecognizer(target: self, action: #selector(self.tapRegisterView))
        self.registerView.addGestureRecognizer(gestureRegisterView)
    }

    //MARK: - OBJ Functions
    @objc private func tapLoginView(_ sender: UITapGestureRecognizer) {
        let loginVC = LoginViewController()
        loginVC.isRegister = false
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(loginVC, animated: true)
    }

    @objc private func tapRegisterView(_ sender: UITapGestureRecognizer) {
        let regisVC = RegisterViewController()
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.pushViewController(regisVC, animated: true)
    }
}
