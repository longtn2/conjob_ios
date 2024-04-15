import UIKit
protocol DatePickerViewDelegate: AnyObject {
    func viewController(_ view: DatePickerViewController, needPerfom date: String)
}

final class DatePickerViewController: ViewController {
    //MARK: IBOutlets
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var backButton: UIButton!
    @IBOutlet private weak var acceptButton: UIButton!
    @IBOutlet private weak var pickerView: UIView!

    //MARK: Propeties
    weak var delegate: DatePickerViewDelegate?

    //MARK: Functions
    override func setupData() {

    }
    override func setupUI() {
        backButton.customRoundCorners(radius: 5)
        acceptButton.customRoundCorners(radius: 5)
        pickerView.customRoundCorners(radius: 5)
    }

    @IBAction private func dismissButtonTouchUpInside(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction private func backButtonTouchUpInside(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    @IBAction private func acceptButtonTouchUpInside(_ sender: UIButton) {
        let dateString: String = dateToString(dateFormat: "yyyy-MM-dd", date: datePicker.date)
        delegate?.viewController(self, needPerfom: dateString)
        self.dismiss(animated: true)
    }
}


