import UIKit

class ProfileUserViewController: ViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var coverImageView: UIImageView!
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var phoneLabel: UILabel!
    @IBOutlet private weak var emailLabel: UILabel!
    @IBOutlet private weak var addressLabel: UILabel!
    @IBOutlet private weak var phoneView: UIView!
    @IBOutlet private weak var mailView: UIView!
    @IBOutlet private weak var locationView: UIView!
    @IBOutlet private weak var tabCollectionView: UICollectionView!
    //MARK: - Functions
    override func setupUI() {
        super.setupUI()
        ui()
    }
    
    override func setupData() {
        super.setupData()
    }
    
    private func ui() {
        let color = UIColor.hexStringToUIColor(hex: "#ADADAD")
        let radius = phoneView.frame.height / 2
        phoneView.customCorner(withWidth: 1, radius: radius, color: color)
        mailView.customCorner(withWidth: 1, radius: radius, color: color)
        locationView.customCorner(withWidth: 1, radius: radius, color: color)
        
        let leftImage = UIImage(named: NameIcon.icon_back)
        let rightImage = UIImage(named: NameIcon.icon_more)
        setupUINavigationBar(withtitle: "", left: leftImage, right: rightImage)
        
        tabCollectionView.register(TabCollectionViewCell.self)
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
    }
    @objc func showMenu() {
            let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
            
            let option1Action = UIAlertAction(title: "Cập Nhập", style: .default) { action in
                let profile = ProfileViewController()
                self.navigationController?.pushViewController(profile, animated: true)
            }
            alertController.addAction(option1Action)
            
            let option2Action = UIAlertAction(title: "Sao chép liên kết", style: .default) { action in
                
            }
            alertController.addAction(option2Action)
            
            if let popoverController = alertController.popoverPresentationController {
                popoverController.barButtonItem = navigationItem.rightBarButtonItem
            }
            present(alertController, animated: true, completion: nil)
        }
    override func tapRightBarButton() {
        showMenu()
    }
}

extension ProfileUserViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tabCollectionView.dequeue(cell: TabCollectionViewCell.self, forIndexPath: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50, height: 44)
    }
}
