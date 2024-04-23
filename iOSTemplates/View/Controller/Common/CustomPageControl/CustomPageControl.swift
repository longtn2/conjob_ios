import UIKit

class CustomPageControl: UIControl {
    // MARK: - Properties

    private var numberOfPages: Int
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
               dotView.backgroundColor = .lightGray
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
           let dotSize: CGSize = CGSize(width: 8, height: 8)
           let dotSize1: CGSize = CGSize(width: 16, height: 8)
           for (index, dotView) in dotViews.enumerated() {
               dotView.backgroundColor = index == currentPage ? .blue : .lightGray
               dotView.frame.size = (currentPage != 0) ? dotSize1 : dotSize
           }
       }

       func setCurrentPage(_ currentPage: Int) {
           guard currentPage >= 0 && currentPage < numberOfPages else { return }
           self.currentPage = currentPage
       }
}
