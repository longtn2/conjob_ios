import UIKit
protocol BottomTabBarViewDelegate: AnyObject {
    func cell(_ view: BottomTabBarView,needPerfom selectindex: Int)
}

final class BottomTabBarView: UIView {
    
    //MARK: - Propeties
    weak var delegate: BottomTabBarViewDelegate?
    var buttons: [UIButton] = []

    //MARKL - Init
    init(_ items: [String]) {
        super.init(frame: .zero)
        backgroundColor = .white

        setupStackView(items)
        updateUI(selectedIndex: 0)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Funtions
    override func layoutSubviews() {
        super.layoutSubviews()

        layer.cornerRadius = 18
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.1
        layer.shadowOffset = .zero
        layer.shadowRadius = bounds.height / 2
    }

    private func setupStackView(_ items: [String]) {
        for (index, item) in items.enumerated() {
            let normalImage = UIImage(named: item)
            let selectedImage = UIImage(named: item + "Fill")
            let button = createButton(normalImage: normalImage!, selectedImage: selectedImage!, index: index)
            buttons.append(button)
        }

        let stackView = UIStackView(arrangedSubviews: buttons)

        addSubview(stackView)
        stackView.fillSuperview(padding: .init(top: 16, left: 16, bottom: 16, right: 18))
        stackView.spacing = 12
    }

    private func createButton(normalImage: UIImage, selectedImage: UIImage, index: Int) -> UIButton {
        let button = UIButton()
        button.constrainWidth(constant: 48)
        button.constrainHeight(constant: 48)
        button.setImage(normalImage, for: .normal)
        button.setImage(selectedImage, for: .selected)
        button.tag = index
        button.adjustsImageWhenHighlighted = false
        button.addTarget(self, action: #selector(changeTab(_:)), for: .touchUpInside)
        return button
    }
    private func updateUI(selectedIndex: Int) {
        for (index, button) in buttons.enumerated() {
            if index == selectedIndex {
                button.isSelected = true
                button.customRoundCorners(radius: 8)
                button.backgroundColor = UIColor(named: ColorApp.secondaryAppColor)
                if index == 0 {
                    button.tintColor = .red
                } else {
                    button.tintColor = .black
                }
            } else {
                button.isSelected = false
                button.tintColor = .gray
                button.backgroundColor = .white
            }
        }
    }
    func toggle(hide: Bool) {
        if !hide {
            isHidden = hide
        }

        UIView.animate(withDuration: 0.25, delay: 0, usingSpringWithDamping: 1,
                       initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            self.alpha = hide ? 0 : 1
            self.transform = hide ? CGAffineTransform(translationX: 0, y: 10) : .identity
        }) { (_) in
            if hide {
                self.isHidden = hide
            }
        }
    }
    //MARK: -Objc Functions
    @objc func changeTab(_ sender: UIButton) {
        sender.pulse()
        delegate?.cell(self, needPerfom: sender.tag)
        updateUI(selectedIndex: sender.tag)
    }
    
}
