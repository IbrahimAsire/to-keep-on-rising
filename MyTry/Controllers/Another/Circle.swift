
import UIKit

class Circle: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        createCircle(startAngle: 0, endAngle: 360)


    }
    
    
    private func createSegment(startAngle: CGFloat, endAngle: CGFloat) -> UIBezierPath {
        return UIBezierPath(arcCenter: CGPoint(x: self.view.frame.midX, y: self.view.frame.midY), radius: 150, startAngle: startAngle.toRadians(), endAngle: endAngle.toRadians(), clockwise: true)
    }
    
    private func createCircle(startAngle: CGFloat, endAngle: CGFloat) {
        let segmentPath = createSegment(startAngle: startAngle, endAngle: endAngle)
        let segmentLayer = CAShapeLayer()
        segmentLayer.path = segmentPath.cgPath
        segmentLayer.lineWidth = 45
        segmentLayer.strokeColor = UIColor.blue.cgColor
        segmentLayer.fillColor = UIColor.clear.cgColor

        self.view.layer.addSublayer(segmentLayer)
        // to animate the Circle
        addAnimation(to: segmentLayer)

    }
    
    private func addAnimation(to layer: CALayer) {
        let drawAnimation = CABasicAnimation(keyPath: "strokeEnd")
        drawAnimation.duration = 0.75
        drawAnimation.repeatCount = 1.0
        drawAnimation.isRemovedOnCompletion = false
        drawAnimation.fromValue = 0
        drawAnimation.toValue = 1
        drawAnimation.timingFunction = CAMediaTimingFunction(name: .easeOut)
        layer.add(drawAnimation, forKey: "drawCircleAnimation")
    }
    
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
