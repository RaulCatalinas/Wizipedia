import UIKit

@IBDesignable
class GradientView: UIView {

    private let gradientLayer = CAGradientLayer()

    @IBInspectable var firstColor: UIColor = .clear {
        didSet { updateGradient() }
    }

    @IBInspectable var secondColor: UIColor = .clear {
        didSet { updateGradient() }
    }

    @IBInspectable var thirdColor: UIColor = .clear {
        didSet { updateGradient() }
    }

    @IBInspectable var horizontal: Bool = false {
        didSet { updateGradient() }
    }

    @IBInspectable var diagonal: Bool = true {
        didSet { updateGradient() }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        setupGradient()
    }

    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupGradient()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.cornerRadius = layer.cornerRadius
    }

    private func setupGradient() {
        guard gradientLayer.superlayer == nil else { return }
        layer.insertSublayer(gradientLayer, at: 0)
        updateGradient()
    }

    private func updateGradient() {
        gradientLayer.colors = [
            firstColor.cgColor,
            secondColor.cgColor,
            thirdColor.cgColor,
        ]

        if horizontal {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1, y: 0.5)
        } else if diagonal {
            gradientLayer.startPoint = CGPoint(x: 0, y: 0)
            gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        } else {
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0)
            gradientLayer.endPoint = CGPoint(x: 0.5, y: 1)
        }
    }
}
