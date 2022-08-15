
import UIKit
//import Firebase

class VCShow: UIViewController {
    
    var name = "here what is name << as test!"
    let age = "for kza"
    
    var viewContect = UITextView()
    var nameProv = ""

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
        viewContect.font = .boldSystemFont(ofSize: 17)
        
        NSLayoutConstraint.activate([
            viewContect.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            viewContect.widthAnchor.constraint(equalTo: view.widthAnchor),
            viewContect.heightAnchor.constraint(equalToConstant: 400)
            
        
        ])
    }
    
    func getNameProvider() {
        db.collection("providers").addSnapshotListener { snapchat, error in
                
        }
    }
    

    

}
