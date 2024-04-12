import UIKit

class HomeController: UITabBarController {
    
    //MARK: - Propeties
    var viewModel: MatchingViewModel?
    let bottomTabbarView = BottomTabBarView([NameIcon.icon_home, NameIcon.icon_chat, NameIcon.icon_plus, NameIcon.icon_notification, NameIcon.icon_profile])
    
    
    //MARK: -Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tabBar.isHidden = true
        self.setupBottomTabBar()
    }
    
    //MARK: - Functions
    private func setupUI() {
        let matchVC = MatchingViewController()
        let matchNavi = UINavigationController(rootViewController: matchVC)
        matchNavi.isNavigationBarHidden = true
        
        let messageVC = MessageViewController()
        let messageNavi = UINavigationController(rootViewController: messageVC)

        let addPostVC = AddPostViewController()
        let addPostNavi = UINavigationController(rootViewController: addPostVC)
        
        let notiVC = NotificationViewController()
        let notiNavi = UINavigationController(rootViewController: notiVC)
        
        let profileVC = NotificationViewController()
        let profileNavi = UINavigationController(rootViewController: profileVC)
        
        viewControllers = [matchNavi,messageNavi,addPostNavi,notiNavi,profileNavi]
    }
    private func setupBottomTabBar() {
        bottomTabbarView.delegate = self
        view.addSubview(bottomTabbarView)
        bottomTabbarView.centerHorrizontallyToSuperView()
        bottomTabbarView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
    }

    func toggle(hide: Bool) {
        bottomTabbarView.toggle(hide: hide)
    }
}

//MARK: - BottomTabBarViewDelegate
extension HomeController: BottomTabBarViewDelegate {
    func did(selectindex: Int) {
        selectedIndex = selectindex
    }
}
