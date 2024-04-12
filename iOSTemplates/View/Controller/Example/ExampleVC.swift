import UIKit
import SkeletonView

final class ExampleVC: ViewController {

    // MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var viewModel: ExampleVM?

    // MARK: - Life cycle

    // MARK: - Override functions
    override func setupUI() {
        super.setupUI()
        title = App.String.Example.title
        configTableView()
    }

    override func setupData() {
        super.setupData()
        performGetListPokemons()
    }

    // MARK: - Private functions
    private func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ExampleCell.self)
    }

    private func performGetListPokemons() {
        guard let viewModel = viewModel else { return }
        viewModel.performGetListPokemons { [weak self] result in
            guard let this = self else { return }
            switch result {
            case .success:
                this.tableView.reloadData()
            case .failure(let error):
                this.alert(error: error)
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ExampleVC: SkeletonTableViewDataSource {

    func numSections(in collectionSkeletonView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else { return 0 }
        return viewModel.pokemons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(cell: ExampleCell.self, forIndexPath: indexPath)
        if let viewModel = viewModel {
            cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        }
        return cell
    }

    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        return App.String.Identifier.exampleCell
    }
}

// MARK: - UITableViewDelegate
extension ExampleVC: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("IndexPath: \(indexPath.row)")
    }
}
