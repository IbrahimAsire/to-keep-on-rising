
import UIKit

struct GridPoint {
    var x: Int
    var y: Int
}

class HashAble: UIViewController {
    
    let greet = UILabel()
    
    var tappedPoints: Set = [GridPoint(x: 2, y: 3), GridPoint(x: 4, y: 1)]
    let nextTap = GridPoint(x: 0, y: 1)
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        
        if tappedPoints.contains(nextTap) {
            print("Already tapped at (\(nextTap.x), \(nextTap.y)).")
        } else {
            tappedPoints.insert(nextTap)
            print("New tap detected at (\(nextTap.x), \(nextTap.y)).")
        }
//         Prints "New tap detected at (0, 1).")

    }
    
    private func setupUI() {
        view.addSubview(greet)
        greet.translatesAutoresizingMaskIntoConstraints = false
        greet.text = "this page to try HashAble protocol"
        NSLayoutConstraint.activate([
            greet.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greet.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        
        ])
    }
}

extension GridPoint: Hashable {
    static func == (lhs: GridPoint, rhs: GridPoint) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(y)
        hasher.combine(x)
    }
}
