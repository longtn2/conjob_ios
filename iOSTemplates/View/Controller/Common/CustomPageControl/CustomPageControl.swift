import UIKit

class CustomPageControl: UIControl {
    // MARK: - Properties

    private var numberOfPages: Int
    private var colorNomal: UIColor = UIColor.hexStringToUIColor(hex: "#DDDDE5")
    private var colorSelect: UIColor = UIColor.hexStringToUIColor(hex: "#A8071A")
    private var currentPage: Int = 0 {
        didSet {
            updateDots()
        }
    }
    private var dotViews: [UIView] = []
    private var stackView: UIStackView!

    init(numberOfPages: Int) {
        self.numberOfPages = numberOfPages
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {
        for _ in 0..<numberOfPages {
            let dotView = UIView()
            dotView.backgroundColor = colorNomal
            dotView.layer.cornerRadius = 4
            dotViews.append(dotView)
        }

        stackView = UIStackView(arrangedSubviews: dotViews)
        stackView.spacing = 6
        stackView.distribution = .fillEqually
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
            ])

        updateDots()
    }

    private func updateDots() {
        for (index, dotView) in dotViews.enumerated() {
            dotView.backgroundColor = index == currentPage ? colorSelect : colorNomal
        }
    }

    func setCurrentPage(_ currentPage: Int) {
        guard currentPage >= 0 && currentPage < numberOfPages else { return }
        self.currentPage = currentPage
    }
}
