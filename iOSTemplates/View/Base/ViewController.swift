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
    func setupUINavigationBar(withtitle title: String, left: UIImage?, right: UIImage?) {
        navigationItem.title = title

        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 25, height: 20))
        leftButton.setBackgroundImage(left, for: .normal)
        leftButton.addTarget(self, action: #selector(tapLeftBarButton), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: leftButton)

        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        rightButton.setBackgroundImage(right, for: .normal)
        rightButton.addTarget(self, action: #selector(tapRightBarButton), for: .touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButton)

    }
    internal func setupUI() {
        view.removeMultiTouch()
    }

    /*
        This function is used for data binding
     **/
    //MARK: -Obj Functions
    @objc func tapLeftBarButton() {

    }
    @objc func tapRightBarButton() {

    }
}
