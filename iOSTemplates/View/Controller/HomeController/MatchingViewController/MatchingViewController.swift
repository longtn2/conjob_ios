import UIKit
import Koloda
protocol MatchingViewControllerDelegate: AnyObject {
    func viewController(_ view: MatchingViewController, needPerfom action: MatchingViewController.TabBar)
}

final class MatchingViewController: ViewController {
    //MARK: - Enum
    enum TabBar {
        case isHide
        case isShow
    }
    //MARK: - Constants
    private enum Const {
        static let acceptText: String = "Lướt qua phải để tuyển dụng"
        static let closeText: String = "Lướt qua trái để bỏ qua"
    }
    //MARK: - IBOutlets
    @IBOutlet private weak var kolodaView: KolodaView!

    //MARK: - Propeties
    var viewModel: MatchingViewModel?
    private var blurredEffectView = UIVisualEffectView(effect: .none)
    private var textLabel = UILabel()
    weak var delegate: MatchingViewControllerDelegate?
    //MARK: - Functions
    override func setupUI() {
        super.setupUI()
    }

    override func setupData() {
        super.setupData()
        guard let viewModel = viewModel else { return }
        viewModel.listPost()
        kolodaView.delegate = self
        kolodaView.dataSource = self
    }
}

//MARK: - KolodaViewDelegate, KolodaViewDataSource
extension MatchingViewController: KolodaViewDelegate, KolodaViewDataSource {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        guard let viewModel = self.viewModel else { return }
        viewModel.listPost2()
        kolodaView.resetCurrentCardIndex()
        
    }
    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
        return viewModel?.posts.count ?? 0
    }
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        guard let view = Bundle.main.loadNibNamed(CellIdentifer.matchingView, owner: nil, options: nil)?[0] as? MatchingView else {
            return UIView()
        }
        view.delegate = self
        guard let viewModel = viewModel else { return UIView() }
        view.viewModel = viewModel.viewModelForMatching(at: index)
        return view
    }
    func koloda(_ koloda: KolodaView, draggedCardWithPercentage finishPercentage: CGFloat, in direction: SwipeResultDirection) {
        if let currentCardView = kolodaView.viewForCard(at: kolodaView.currentCardIndex) {
            switch direction {
            case .left, .bottomLeft, .topLeft:
                let redColor = UIColor.hexStringToUIColor(hex: "#F5222D")
                textLabel.text = ""
                currentCardView.addUIEffect(withBlurredView: blurredEffectView, color: redColor, nameIcon: NameIcon.icon_closeRed, text: Const.closeText, label: textLabel)
            default:
                let greenColor = UIColor.hexStringToUIColor(hex: "#52C41A")
                textLabel.text = ""
                currentCardView.addUIEffect(withBlurredView: blurredEffectView, color: greenColor, nameIcon: NameIcon.icon_acceptGreen, text: Const.acceptText, label: textLabel)
            }
        }
    }
    func koloda(_ koloda: KolodaView, didSwipeCardAt index: Int, in direction: SwipeResultDirection) {
        switch direction {
        case .left:
            guard let viewModel = viewModel else { return }
            viewModel.removePost(at: index)
            kolodaView.resetCurrentCardIndex()
        default:
            return
        }
       
    }
    func kolodaDidResetCard(_ koloda: KolodaView) {
        if kolodaView.viewForCard(at: kolodaView.currentCardIndex) != nil {
            blurredEffectView.removeUIBlurEffect(blurredEffectView: blurredEffectView)
        }
    }
}

extension MatchingViewController: MatchingViewDelegate {
    func view(_ view: MatchingView, needPerfom action: MatchingView.Action) {
        switch action {
        case .seeMore:
            let postDetail = PostDetailViewController()
            let post = viewModel?.viewModelForMatching(at: kolodaView.currentCardIndex)
            postDetail.viewModel = PostDetailViewModel(postModel: post)
            postDetail.delegate = self
            navigationController?.pushViewController(postDetail, animated: true)
            delegate?.viewController(self, needPerfom: TabBar.isHide)
        case .search:
            print("Search")
            //Show search VC
        case .heart:
            print("Heart")
            //Call api
        case .message:
            print("Message")
            //Call api
        default:
            print("Share")
        }
    }
}

extension MatchingViewController: PostDetailViewControllerDelegate {
    func viewController(_ view: PostDetailViewController) {
        delegate?.viewController(self, needPerfom: TabBar.isShow)
    }
}

extension UIView {
    func addUIEffect(withBlurredView blurredView: UIVisualEffectView, color: UIColor, nameIcon: String , text: String, label: UILabel) {
        blurredView.backgroundColor = color.withAlphaComponent(0.16)
        blurredView.frame = self.bounds

        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: nameIcon), for: .normal)
        blurredView.contentView.addSubview(button)

        button.heightAnchor(60)
        button.widthAnchor(60)
        button.centerVerticallyToSuperView()
        button.centerHorrizontallyToSuperView()

        label.text = text
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        blurredView.contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: button.bottomAnchor, constant: 10),
            label.centerXAnchor.constraint(equalTo: blurredView.contentView.centerXAnchor)
            ])
        
        self.addSubview(blurredView)
    }

    func removeUIBlurEffect(blurredEffectView: UIVisualEffectView) {
        blurredEffectView.removeFromSuperview()
    }
}
