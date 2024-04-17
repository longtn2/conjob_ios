import UIKit

class ProfileViewController: ViewController {
    
    //MARK: - Functions
     override func setupData() {
         
     }
     override func setupUI() {
         
     }
    //MARK: -IBActions
    @IBAction private func logOutButtonTouchUpInside(_ sender: UIButton) {
        UserManager.shared.clearUserManager()
        setRootWithNavigationItemTo(OnboardingViewController())
    }
    
 }
