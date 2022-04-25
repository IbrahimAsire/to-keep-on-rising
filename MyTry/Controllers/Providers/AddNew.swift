
import UIKit
import FirebaseAuth

class AddNew: UIViewController {
    
    let addTF = UITextField()
    let addBtn = UIButton()
    var nameProv: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemGroupedBackground
        print(nameProv)
        
        view.addSubview(addTF)
        view.addSubview(addBtn)
        
        addTF.translatesAutoresizingMaskIntoConstraints = false
        addBtn.translatesAutoresizingMaskIntoConstraints = false
        
        addTF.borderStyle = .roundedRect
        addTF.placeholder = "ADD"
        addTF.textAlignment = .center
        
        addBtn.setTitle("Add", for: .normal)
        addBtn.backgroundColor = .systemPurple
        addBtn.setTitleColor(.systemMint, for: .normal)
        addBtn.addTarget(self, action: #selector(addTpd), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            addTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            addTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addTF.widthAnchor.constraint(equalToConstant: 280),
            addBtn.topAnchor.constraint(equalTo: addTF.bottomAnchor, constant: 12),
            addBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addBtn.widthAnchor.constraint(equalToConstant: 80)
            
        ])

    }
    
    @objc func addTpd(){
        print("DONE")
        let myId = UUID().uuidString
        let userID = Auth.auth().currentUser?.uid
        let userEmail = Auth.auth().currentUser?.email
        db.collection("providers").document(myId).setData([
            "content": addTF.text,
            "name": nameProv,
            "userID": userID,
            "email": userEmail
        ])
        
    }
    
}
