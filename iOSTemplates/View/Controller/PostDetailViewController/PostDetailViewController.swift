import UIKit
protocol PostDetailViewControllerDelegate: AnyObject {
    func viewController(_ view: PostDetailViewController)
}

class PostDetailViewController: ViewController {
    
    //MARK: -
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var descriptionPostLabel: UILabel!
    @IBOutlet private weak var namePostLabel: UILabel!
    @IBOutlet private weak var timePostLabel: UILabel!
    @IBOutlet private weak var quanlityPostLabel: UILabel!
    //MARK: - Propeties
    weak var delegate: PostDetailViewControllerDelegate?
    var viewModel: PostDetailViewModel?
    //MARK: Functions
    override func setupUI() {
        super.setupUI()
        navigationController?.isNavigationBarHidden = false
        setupNavigation()
        if let post = viewModel?.postModel {
            postImageView.image = UIImage(named: post.image)
            descriptionPostLabel.text = post.description
        }
    }

    override func setupData() {
        super.setupData()
    }

    private func setupNavigation() {
        let imageView = UIImageView()
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 35),
            imageView.widthAnchor.constraint(equalToConstant: 35)
            ])
        imageView.image = UIImage(named: "image_avatar1")
        imageView.customRoundCorners(radius: 35 / 2)
        let titleLabel = UILabel()
        titleLabel.text = "Name User"

        let hStack = UIStackView(arrangedSubviews: [imageView, titleLabel])
        hStack.spacing = 8
        hStack.alignment = .center
        setupUINavigationBar(withTitleView: hStack, left: UIImage(named: NameIcon.icon_back), right: UIImage(named: NameIcon.icon_chat))
    }
    
    override func tapLeftBarButton() {
        delegate?.viewController(self)
        navigationController?.popViewController(animated: true)
    }
}
