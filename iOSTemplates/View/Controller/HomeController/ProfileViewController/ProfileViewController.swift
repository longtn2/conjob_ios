import UIKit

class ProfileViewController: ViewController {
    
    //MARK: - Functions
     override func setupData() {
         
     }
     override func setupUI() {
         
     }
    //MARK: -IBActions
    @IBAction private func logOutButtonTouchUpInside(_ sender: UIButton) {
        let currentUser = UserDefaults.standard
        currentUser.removeObject(forKey: "currentUser")
        setRootWithNavigationItemTo(OnboardingViewController())
    }
    
 }
