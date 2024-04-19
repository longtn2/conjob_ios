import UIKit

class LoadingViewController: ViewController {
    
    //MARK: - IBOutlets
    @IBOutlet private weak var indicatorView: UIActivityIndicatorView!
    
    //MARK: - Propeties
    var viewModel: LoadingViewModel?
    //MARK: - Functions
    
    override func setupUI() {
        super.setupUI()
        setupUIIndicatorView()
    }
    
    override func setupData() {
        super.setupData()
    }
    
    func setupUIIndicatorView () {
        guard let viewModel = viewModel else { return }
        switch viewModel.isLoading {
        case false:
            indicatorView.stopAnimating()
        default:
            indicatorView.startAnimating()
        }
    }
    
}
