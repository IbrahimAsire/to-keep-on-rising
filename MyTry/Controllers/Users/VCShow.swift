
import UIKit

class VCShow: UIViewController {
    
    var viewContect = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uiSetUp()

    }
    
    private func uiSetUp() {
        
        view.addSubview(viewContect)
        viewContect.translatesAutoresizingMaskIntoConstraints = false
        viewContect.backgroundColor = .purple
        viewContect.textColor = .white
        
        NSLayoutConstraint.activate([
            viewContect.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewContect.widthAnchor.constraint(equalTo: view.widthAnchor),
            viewContect.heightAnchor.constraint(equalToConstant: 400)
            
        
        ])
    }
    

    

}
