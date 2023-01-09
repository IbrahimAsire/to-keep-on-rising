
import UIKit
import FirebaseAuth
import FirebaseFirestore

class AddNew: UIViewController {
    
    let userID = Auth.auth().currentUser?.uid
    let addTF = UITextField()
    let addBtn = UIButton()
    var nameProv = ""
    var myId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemGroupedBackground
        print(myId)
        setUpUI()
        readInfo()
    }
    
    //    To test get the information
//    override func viewDidAppear(_ animated: Bool) {
//        print(nameProv)
//    }
    
    private func setUpUI() {
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
    
    private func readInfo() {
        db.collection("providers").getDocuments { snapshot, error in
            if error == nil {
                let info = snapshot!.documents
                for doc in info {
                    if self.userID == doc["UserId"] as? String{
                        self.nameProv = doc["name"] as? String ?? "nil"
                        self.myId = doc["myId"] as? String ?? "nil"
                    }
                }
            }
        }
    }
    
    @objc func addTpd(){
        print("DONE")
//        let userEmail = Auth.auth().currentUser?.email
        db.collection("providers").document(myId).setData([
            "content": addTF.text,
            "name": nameProv,
            "UserId": userID,
//            "email": userEmail,
            "myId": myId
        ])
    }
}
