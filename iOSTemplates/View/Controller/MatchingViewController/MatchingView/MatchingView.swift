import Foundation
import UIKit
import Koloda

protocol MatchingViewDelegate: AnyObject {
    func view(_ view: MatchingView, needPerfom action: MatchingView.Action)
}
final class MatchingView: OverlayView {
    //MARK: - Enum
    enum Action {
        case Search
        case Heart
        case Message
        case Share
    }
    //MARK: - IBOutlets
    @IBOutlet private weak var matchingView: UIView!
    @IBOutlet private weak var postImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var heartButton: UIButton!
    @IBOutlet private weak var messageButton: UIButton!
    @IBOutlet private weak var shareButton: UIButton!
    @IBOutlet private weak var searchButton: UIButton!
    @IBOutlet private weak var numberHeartLabel: UILabel!
    @IBOutlet private weak var numberMessageLabel: UILabel!
    @IBOutlet private weak var numberShareLabel: UILabel!
    @IBOutlet private weak var seeMoreLabel: UILabel!
    @IBOutlet private weak var avatarImageView: UIImageView!
    //MARK: - Propeties
    weak var delegate: MatchingViewDelegate?
    var viewModel: Post? {
        didSet {
            updateView()
            setupUI()
        }
    }

    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

    }

    //MARK: - Functions
    private func setupUI() {
        Bundle.main.loadNibNamed("MatchingView", owner: self, options: nil)
        self.addSubview(matchingView)
        self.matchingView.frame = self.bounds
        self.matchingView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        self.avatarImageView.customCorner(radius: avatarImageView.frame.height / 2)
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        self.postImageView.image = UIImage(named: viewModel.image)
        self.nameLabel.text = viewModel.name
        self.descriptionLabel.text = viewModel.description
        self.numberHeartLabel.text = String(viewModel.numberHeart)
        self.numberShareLabel.text = String(viewModel.numberShare)
        self.numberMessageLabel.text = String(viewModel.numberMessage)
        self.avatarImageView.image = UIImage(named: viewModel.avartar)
        self.descriptionLabel.text = viewModel.description
    }

    //MARK: - IBAction
    @IBAction private func searchButtonTouchUpInside(_ sender: UIButton) {
        self.delegate?.view(self, needPerfom: Action.Search)
    }
    @IBAction private func heartButtonTouchUpInside(_ sender: UIButton) {
        self.delegate?.view(self, needPerfom: Action.Heart)
    }
    @IBAction private func messageButtonTouchUpInside(_ sender: UIButton) {
        self.delegate?.view(self, needPerfom: Action.Message)
    }
    @IBAction private func shareButtonTouchUpInside(_ sender: UIButton) {
        self.delegate?.view(self, needPerfom: Action.Share)
    }
}

