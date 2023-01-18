
import UIKit
import FirebaseAuth
import FirebaseFirestore

//Here should me fix to add content as array/list in firebase
class AddNew: UIViewController {
    
    let userID = Auth.auth().currentUser?.uid
    let addTF = UITextField()
    let addBtn = UIButton()
    var nameProv = ""
    var myId = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemGroupedBackground
        readInfo()
        setUpUI()
//        print(myId); print("You now in AddNew Page"); print(nameProv)
    }
    
    //To test get the information & I note in viewDidAppear it showing the myId num and did not show in viewDidLoad!?
    override func viewDidAppear(_ animated: Bool) {
        print(myId)
    }
    
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

// MARK: - this to try add array
//let docData: [String: Any] = [
//    "stringExample": "Hello world!",
//    "booleanExample": true,
//    "numberExample": 3.14159265,
//    "dateExample": Timestamp(date: Date()),
//    "arrayExample": [5, true, "hello"],
//    "nullExample": NSNull(),
//    "objectExample": [
//        "a": 5,
//        "b": [
//            "nested": "foo"
//        ]
//    ]
//]
//db.collection("data").document("one").setData(docData) { err in
//    if let err = err {
//        print("Error writing document: \(err)")
//    } else {
//        print("Document successfully written!")
//    }
//}
