import UIKit

final class ExampleCell: UITableViewCell {

    // MARK: - IBOutlets
    @IBOutlet private weak var avatarImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Properties
    var viewModel: ExampleCellVM? {
        didSet {
            updateView()
        }
    }

    // MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
        avatarImageView.showSkeleton(transition: .crossDissolve(0.25))
        titleLabel.showSkeleton(transition: .crossDissolve(0.25))
    }

    // MARK: - Private functions
    private func updateView() {
        guard let viewModel = viewModel, let pokemon = viewModel.pokemon else { return }
        if pokemon.name.isNotEmpty {
            let urlString: String = "https://static.wikia.nocookie.net/pokemon-fano/images/6/6f/Poke_Ball.png/revision/latest/scale-to-width-down/767?cb=20140520015336"
            avatarImageView.loadImage(urlString: urlString) { [weak self] _ in
                guard let this = self else { return }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                    this.avatarImageView.hideSkeleton(transition: .crossDissolve(0.25))
                    this.titleLabel.hideSkeleton(transition: .crossDissolve(0.25))
                    this.titleLabel.text = pokemon.name
                }
            }
        }
    }
}
