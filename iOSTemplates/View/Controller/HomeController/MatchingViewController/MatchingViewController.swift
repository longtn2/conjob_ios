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
    //MARK: - IBOutlets
    @IBOutlet private weak var kolodaView: KolodaView!

    //MARK: - Propeties
    var viewModel: MatchingViewModel?
    private var blurredEffectView = UIVisualEffectView(effect: .none)
    var userSwiped = false
    weak var delegate: MatchingViewControllerDelegate?
    //MARK: - Functions
    override func setupUI() {
        super.setupUI()
    }

    override func setupData() {
        super.setupData()
        guard let viewModel = viewModel else { return  }
        viewModel.listPost()
        kolodaView.delegate = self
        kolodaView.dataSource = self
    }
}

//MARK: - KolodaViewDelegate, KolodaViewDataSource
extension MatchingViewController: KolodaViewDelegate, KolodaViewDataSource {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        kolodaView.reloadData()
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

extension KolodaView {
    func addUIEffect(withColor color: UIColor,blurredEffectView: UIVisualEffectView) {
        blurredEffectView.backgroundColor = color.withAlphaComponent(0.16)
        blurredEffectView.frame = self.bounds
        self.addSubview(blurredEffectView)
    }

    func removeUIBlurEffect(blurredEffectView: UIVisualEffectView) {
        blurredEffectView.removeFromSuperview()
    }
}
