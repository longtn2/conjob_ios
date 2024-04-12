import UIKit
import Koloda

final class MatchingViewController: ViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var kolodaView: KolodaView!
    
    //MARK: - Propeties
    var viewModel = MatchingViewModel()
    
    //MARK: - Functions
    override func setupUI() {
        super.setupUI()
        viewModel.listPost()
        kolodaView.delegate = self
        kolodaView.dataSource = self
    }

    override func setupData() {
        super.setupData()
    }
}

//MARK: - KolodaViewDelegate, KolodaViewDataSource
extension MatchingViewController: KolodaViewDelegate, KolodaViewDataSource {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        kolodaView.reloadData()
    }
    func kolodaNumberOfCards(_ koloda: Koloda.KolodaView) -> Int {
        return viewModel.posts.count
    }
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }
    func koloda(_ koloda: Koloda.KolodaView, viewForCardAt index: Int) -> UIView {
        guard let view = Bundle.main.loadNibNamed("MatchingView", owner: nil, options: nil)?[0] as? MatchingView else {
            return UIView()
        }
        view.delegate = self
        view.viewModel = viewModel.viewModelForMatching(at: index)
        return view
    }
    func koloda(_ koloda: KolodaView, draggedCardWithPercentage finishPercentage: CGFloat, in direction: SwipeResultDirection) {
    }
}

extension MatchingViewController: MatchingViewDelegate {
    func view(_ view: MatchingView, needPerfom action: MatchingView.Action) {
        switch action {
        case .Search:
            print("Search")
            //Show search VC
        case .Heart:
            print("Heart")
            //Call api
        case .Message:
            print("Message")
            //Call api
        default:
            print("Share")
        }
    }
}


