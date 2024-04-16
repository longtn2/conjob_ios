import UIKit

final class OnboardingViewController: ViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var loginView: UIView!
    @IBOutlet private weak var registerView: UIView!
    // MARK: - Propeties

    // MARK: - Functions
    override func setupUI() {
        loginView.customRoundCorners(radius: 8)
        registerView.customCorner(radius: 8, color: UIColor.black)
        tapView()
        navigationController?.isNavigationBarHidden = true
    }
    override func setupData() {

    }

    //MARK: - UITapGestureRecognizer
    private func tapView() {
        let gestureLoginView = UITapGestureRecognizer(target: self, action: #selector(self.tapLoginView))
        loginView.addGestureRecognizer(gestureLoginView)

        let gestureRegisterView = UITapGestureRecognizer(target: self, action: #selector(self.tapRegisterView))
        registerView.addGestureRecognizer(gestureRegisterView)
    }

    //MARK: - OBJ Functions
    @objc private func tapLoginView(_ sender: UITapGestureRecognizer) {
        let loginVC = LoginViewController()
        let viewModel = LoginViewModel()
        viewModel.isReister = false
        loginVC.viewModel = viewModel
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(loginVC, animated: true)
    }

    @objc private func tapRegisterView(_ sender: UITapGestureRecognizer) {
        let regisVC = RegisterViewController()
        regisVC.viewModel = RegisterViewModel()
        navigationController?.isNavigationBarHidden = false
        navigationController?.pushViewController(regisVC, animated: true)
    }
}
