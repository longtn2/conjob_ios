import UIKit

extension UIView {

    struct AnchorOptions: OptionSet {

        let rawValue: Int

        init(rawValue: Int) {
            self.rawValue = rawValue
        }

        static let top = UIView.AnchorOptions(rawValue: 1 << 0)

        static let leading = UIView.AnchorOptions(rawValue: 1 << 1)

        static let trailing = UIView.AnchorOptions(rawValue: 1 << 2)

        static let bottom = UIView.AnchorOptions(rawValue: 1 << 3)

        static let all: UIView.AnchorOptions = [.top, .leading, .trailing, .bottom]
    }

    class func loadNib<T: UIView>() -> T {
        let name = String(describing: self)
        let bundle = Bundle(for: T.self)
        guard let xib = bundle.loadNibNamed(name, owner: nil, options: nil)?.first as? T else {
            fatalError("Cannot load nib named `\(name)`")
        }
        return xib
    }

    func anchorToSuperView(with insets: UIEdgeInsets = .zero) {
        guard let superview = superview else { return }
        anchor(toView: superview, insets: insets)
    }

    func anchor(toView view: UIView?, insets: UIEdgeInsets = .zero, anchorOptions options: AnchorOptions = .all) {
        guard let view = view else { return }
        translatesAutoresizingMaskIntoConstraints = false

        if options.contains(.top) {
            topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top).isActive = true
        }
        if options.contains(.leading) {
            leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: insets.left).isActive = true
        }
        if options.contains(.trailing) {
            trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: insets.right).isActive = true
        }
        if options.contains(.bottom) {
            bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: insets.bottom).isActive = true
        }
    }

    func anchor(top: NSLayoutYAxisAnchor? = nil,
                leading: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                trailing: NSLayoutXAxisAnchor? = nil,
                padding: UIEdgeInsets = .zero,
                size: CGSize = .zero) {
        translatesAutoresizingMaskIntoConstraints = false

        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }

        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }

        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }

    func fillToSuperview() {
        translatesAutoresizingMaskIntoConstraints = false
        if let superview = superview {
            let left = leftAnchor.constraint(equalTo: superview.leftAnchor)
            let right = rightAnchor.constraint(equalTo: superview.rightAnchor)
            let top = topAnchor.constraint(equalTo: superview.topAnchor)
            let bottom = bottomAnchor.constraint(equalTo: superview.bottomAnchor)
            NSLayoutConstraint.activate([left, right, top, bottom])
        }
    }

    func anchorToSuperViewLeading(with constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor,
                                 constant: constant).isActive = true
    }

    func anchorToSuperViewTrailing(with constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: superview.trailingAnchor,
                                  constant: constant).isActive = true
    }

    func anchorToSuperViewTrailing(lessThanOrEqual constant: CGFloat) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(lessThanOrEqualTo: superview.trailingAnchor,
                                  constant: constant).isActive = true
    }

    func anchorToSuperViewTop(with constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superview.topAnchor,
                             constant: constant).isActive = true
    }

    func anchorToSuperViewTop(greaterThanOrEqual constant: CGFloat) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(greaterThanOrEqualTo: superview.topAnchor,
                             constant: constant).isActive = true
    }

    func anchorToSuperViewBottom(with constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: superview.bottomAnchor,
                                constant: constant).isActive = true
    }

    func anchorToSuperViewBottom(lessThanOrEqual constant: CGFloat) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(lessThanOrEqualTo: superview.topAnchor,
                                constant: constant).isActive = true
    }

    func heightAnchor(_ constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func widthAnchor(_ constant: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        widthAnchor.constraint(equalToConstant: constant).isActive = true
    }

    func centerVerticallyToSuperView(_ constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: constant).isActive = true
    }

    func centerHorrizontallyToSuperView(_ constant: CGFloat = 0) {
        guard let superview = superview else { return }
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: superview.centerXAnchor, constant: constant).isActive = true
    }

    func removeMultiTouch() {
        subviews.forEach {
            $0.isExclusiveTouch = true
            $0.removeMultiTouch()
        }
    }

    func addShadow(ofColor color: UIColor = .init(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0),
                   radius: CGFloat = 3,
                   offset: CGSize = .zero,
                   opacity: Float = 0.5) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = offset
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.masksToBounds = false
    }

    func addCircleShadow(radius: CGFloat = 3,
                         color: UIColor = .init(red: 0.07, green: 0.47, blue: 0.57, alpha: 1.0),
                         offSet: CGSize = .zero,
                         opacity: Float = 0.5) {
        clipsToBounds = false
        let circleRadius = frame.width / 2
        let center: CGPoint = CGPoint(x: circleRadius, y: circleRadius)
        layer.shadowPath = UIBezierPath(arcCenter: center,
                                        radius: circleRadius,
                                        startAngle: 0,
                                        endAngle: 2 * CGFloat.pi,
                                        clockwise: false).cgPath
        layer.shadowRadius = radius
        layer.shadowOffset = offSet
        layer.shadowOpacity = 1
        layer.shadowColor = color.cgColor
    }

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius))

        let shape = CAShapeLayer()
        shape.path = maskPath.cgPath
        layer.mask = shape
    }

    func roundCorners(corners: CACornerMask, radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
        layer.maskedCorners = corners
    }
    
    func customRoundCorners(radius: CGFloat) {
        layer.cornerRadius = radius
        clipsToBounds = true
    }
    func customCorner(with width: CGFloat = 1, radius: CGFloat, color: UIColor = UIColor.white) {
        layer.cornerRadius = radius
        clipsToBounds = true
        layer.borderWidth = width
        layer.borderColor = color.cgColor
    }
}
