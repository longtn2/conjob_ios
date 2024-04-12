import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupData()
    }

    /*
        This function is used for data setup
        Ex:
        - Call api
        - Fetch data from local database (Realm, SQLite...)
     **/
    internal func setupData() { }

    /*
        This function is used for UI setup
        Ex:
        - Config table view
        - Setup navigation...
     **/
    internal func setupUI() {
        view.removeMultiTouch()
    }

    /*
        This function is used for data binding
     **/
}
