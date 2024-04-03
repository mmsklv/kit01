
import UIKit

class ViewController: UIViewController {
    
    var gradientShadowCornerView = GradientView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradientShadowCornerView = GradientView(frame: CGRect(x: 100, y: view.frame.midY - 50, width: 100, height: 100))
        view.addSubview(gradientShadowCornerView)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        
        coordinator.animate(alongsideTransition: { _ in
            let yPosition = size.height / 2 - 50
            self.gradientShadowCornerView.frame = CGRect(x: 100, y: yPosition, width: 100, height: 100)
        }, completion: nil)
    }
}


class GradientView: UIView {
    
    private let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        containerView.frame = bounds
        addSubview(containerView)
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = containerView.bounds
        gradientLayer.colors = [UIColor.purple.cgColor, UIColor.red.cgColor, UIColor.yellow.cgColor, UIColor.blue.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        
        containerView.layer.insertSublayer(gradientLayer, at: 0)
        
        containerView.layer.cornerRadius = 10.0
        containerView.clipsToBounds = true
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 4.0
        clipsToBounds = false
    }
}

