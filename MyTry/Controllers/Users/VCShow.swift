
import UIKit

class VCShow: UIViewController {
    
    var viewContect = UITextField()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uiSetUp()

    }
    
    private func uiSetUp() {
        view.addSubview(viewContect)
        viewContect.translatesAutoresizingMaskIntoConstraints = false
        viewContect.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            viewContect.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            viewContect.widthAnchor.constraint(equalToConstant: 400)
            
        
        ])
    }
    

    

}
