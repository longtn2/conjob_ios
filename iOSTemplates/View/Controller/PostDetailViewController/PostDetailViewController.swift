import UIKit
protocol PostDetailViewControllerDelegate: AnyObject {
    func viewController(_ view: PostDetailViewController)
}

class PostDetailViewController: ViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var pageControlView: UIView!
    @IBOutlet private weak var postImageColectionView: UICollectionView!
    @IBOutlet private weak var descriptionPostLabel: UILabel!
    @IBOutlet private weak var namePostLabel: UILabel!
    @IBOutlet private weak var timePostLabel: UILabel!
    @IBOutlet private weak var quanlityPostLabel: UILabel!
    @IBOutlet private weak var skipButton: UIButton!
    @IBOutlet private weak var acceptButton: UIButton!
    @IBOutlet private weak var shadowView: UIView!

    //MARK: - Propeties
    weak var delegate: PostDetailViewControllerDelegate?
    var viewModel: PostDetailViewModel?
    private var pageControl: CustomPageControl!
    //MARK: Functions
    override func setupUI() {
        super.setupUI()
        navigationController?.isNavigationBarHidden = false
        setupNavigation()
        configCollectionView()
        if let post = viewModel?.postModel {
            descriptionPostLabel.text = post.description
        }
        skipButton.customCorner(withWidth: 1, radius: acceptButton.frame.height / 2, color: UIColor.hexStringToUIColor(hex: "#A8071A"))
        acceptButton.customRoundCorners(radius: acceptButton.frame.height / 2)

        shadowView.roundCorners(corners: [.layerMaxXMinYCorner, .layerMinXMinYCorner], radius: 15)
        shadowView.addShadow(ofColor: UIColor.hexStringToUIColor(hex: "#B8B8BF"), opacity: 0.2)

        let number = 5
        let width = 5*8 + 6*4
        pageControl = CustomPageControl(numberOfPages: number)
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(pageControl)

        NSLayoutConstraint.activate([
            pageControl.centerXAnchor.constraint(equalTo: pageControlView.centerXAnchor),
            pageControl.bottomAnchor.constraint(equalTo: pageControlView.bottomAnchor, constant: -16),
            pageControl.widthAnchor.constraint(equalToConstant: CGFloat(width)),
            pageControl.heightAnchor.constraint(equalToConstant: 8)
            ])
        pageControl.setCurrentPage(0)

    }

    override func setupData() {
        super.setupData()
    }

    private func setupNavigation() {
        let imageView = UIImageView()
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 32),
            imageView.widthAnchor.constraint(equalToConstant: 32)
            ])
        imageView.image = UIImage(named: "image_avatar1")
        imageView.customRoundCorners(radius: 16)
        let titleLabel = UILabel()
        titleLabel.text = "Name User"

        let hStack = UIStackView(arrangedSubviews: [imageView, titleLabel])
        hStack.spacing = 12
        hStack.alignment = .center
        setupUINavigationBar(withTitleView: hStack, left: UIImage(named: NameIcon.icon_back), right: UIImage(named: NameIcon.icon_more))
    }

    private func configCollectionView() {
        postImageColectionView.register(PostImageCollectionViewCell.self)
        postImageColectionView.delegate = self
        postImageColectionView.dataSource = self
    }
    override func tapLeftBarButton() {
        delegate?.viewController(self)
        navigationController?.isNavigationBarHidden = true
        navigationController?.popViewController(animated: true)
    }


    @IBAction private func heartButtonTouchUpInside(_ sender: UIButton) {
    }

    @IBAction private func messageButtonTouchUpInside(_ sender: UIButton) {
    }

    @IBAction private func shareButtonTouchUpInside(_ sender: UIButton) {
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate
extension PostDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(cell: PostImageCollectionViewCell.self, forIndexPath: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: postImageColectionView.frame.width, height: postImageColectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        var visibleRect = CGRect()
        visibleRect.origin = postImageColectionView.contentOffset
        visibleRect.size = postImageColectionView.bounds.size
        let visiblePoint = CGPoint(x: CGFloat(visibleRect.midX), y: CGFloat(visibleRect.midY))
        let visibleIndexPath: IndexPath? = postImageColectionView.indexPathForItem(at: visiblePoint)
        pageControl.setCurrentPage(visibleIndexPath?.item ?? 0)
    }
}
