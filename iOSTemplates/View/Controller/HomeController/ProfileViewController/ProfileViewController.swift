import UIKit

class ProfileViewController: ViewController {
    
    //MARK: - Functions
     override func setupData() {
         
     }
     override func setupUI() {
         
     }
    //MARK: -IBActions
    @IBAction private func logOutButtonTouchUpInside(_ sender: UIButton) {
        UserManage.shared.clearUserManager()
        setRootWithNavigationItemTo(OnboardingViewController())
    }
    
 }
