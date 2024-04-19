import Foundation
import UIKit
import Koloda

protocol MatchingViewDelegate: AnyObject {
    func view(_ view: MatchingView, needPerfom action: MatchingView.Action)
}
final class MatchingView: OverlayView {
    //MARK: - Enum
    enum Action {
        case search
        case heart
        case message
        case share
        case seeMore
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
        addSubview(matchingView)
        matchingView.frame = self.bounds
        matchingView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        avatarImageView.customCorner(radius: avatarImageView.frame.height / 2)
        tapSeeMore()
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        postImageView.image = UIImage(named: viewModel.image)
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        numberHeartLabel.text = String(viewModel.numberHeart)
        numberShareLabel.text = String(viewModel.numberShare)
        numberMessageLabel.text = String(viewModel.numberMessage)
        avatarImageView.image = UIImage(named: viewModel.avartar)
        descriptionLabel.text = viewModel.description
    }

    private func tapSeeMore() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.tapSeeMoreLabel))
        seeMoreLabel.isUserInteractionEnabled = true
        seeMoreLabel.addGestureRecognizer(gesture)
    }
    //MARK: - IBAction
    @IBAction private func searchButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(self, needPerfom: Action.search)
    }
    @IBAction private func heartButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(self, needPerfom: Action.heart)
    }
    @IBAction private func messageButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(self, needPerfom: Action.message)
    }
    @IBAction private func shareButtonTouchUpInside(_ sender: UIButton) {
        delegate?.view(self, needPerfom: Action.share)
    }

    //MARK: - Objc Funtions
    @objc private func tapSeeMoreLabel() {
        delegate?.view(self, needPerfom: Action.seeMore)
    }
}

