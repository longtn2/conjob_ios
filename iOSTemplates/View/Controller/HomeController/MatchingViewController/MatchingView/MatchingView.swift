import Foundation
import UIKit
import Koloda
import AVKit
import AVFoundation

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
    }

    private func updateView() {
        guard let viewModel = viewModel else { return }
        let color = UIColor.black
        postImageView.backgroundColor = color
        postImageView.image = UIImage(named: viewModel.url)
        switch viewModel.type {
        case "image":
            postImageView.image = UIImage(named: viewModel.url)
        default:
            let videoURL = URL(string: viewModel.url)
            let player = AVPlayer(url: videoURL!)
            let playerLayer = AVPlayerLayer(player: player)
            playerLayer.frame = postImageView.bounds
            postImageView.layer.addSublayer(playerLayer)
            player.play()
        }
        nameLabel.text = viewModel.name
        //descriptionLabel.text = viewModel.description
        numberHeartLabel.text = String(viewModel.numberHeart)
        numberShareLabel.text = String(viewModel.numberShare)
        numberMessageLabel.text = String(viewModel.numberMessage)
        avatarImageView.image = UIImage(named: viewModel.avartar)
        let text = viewModel.description
        addSeeMoreInLabel(text: text)
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
    @objc private func tapperSeeMoreLabel() {
        delegate?.view(self, needPerfom: Action.seeMore)
    }

    func addSeeMoreInLabel(text: String) {
        let fullText = text + "...See More"
        descriptionLabel.text = fullText
        let attributedString = NSMutableAttributedString(string: fullText)
        let range = (fullText as NSString).range(of: "See More")
        attributedString.addAttribute(.foregroundColor, value: UIColor.white, range: range)
        attributedString.addAttribute(.font, value: UIFont.boldSystemFont(ofSize: 14), range: range)
        descriptionLabel.attributedText = attributedString
        descriptionLabel.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapperSeeMoreLabel))
        descriptionLabel.addGestureRecognizer(tapGesture)
    }
}

