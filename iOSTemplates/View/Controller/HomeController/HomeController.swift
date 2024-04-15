import UIKit

class HomeController: UITabBarController {
    
    //MARK: - Propeties
    let bottomTabbarView = BottomTabBarView([NameIcon.icon_home, NameIcon.icon_chat, NameIcon.icon_plus, NameIcon.icon_notification, NameIcon.icon_profile])
    
    
    //MARK: -Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        tabBar.isHidden = true
        setupBottomTabBar()
    }
    
    //MARK: - Functions
    private func setupUI() {
        let matchVC = MatchingViewController()
        matchVC.viewModel = MatchingViewModel()
        matchVC.delegate = self
        let matchNavi = UINavigationController(rootViewController: matchVC)
        matchNavi.isNavigationBarHidden = true
        
        let messageVC = MessageViewController()
        let messageNavi = UINavigationController(rootViewController: messageVC)

        let addPostVC = AddPostViewController()
        let addPostNavi = UINavigationController(rootViewController: addPostVC)
        
        let notiVC = NotificationViewController()
        let notiNavi = UINavigationController(rootViewController: notiVC)
        
        let profileVC = ProfileViewController()
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
    func cell(_ view: BottomTabBarView, needPerfom selectindex: Int) {
        selectedIndex = selectindex
    }
}

extension HomeController: MatchingViewControllerDelegate {
    func viewController(_ view: MatchingViewController, needPerfom isHiden: Bool) {
        toggle(hide: isHiden)
    }
}
