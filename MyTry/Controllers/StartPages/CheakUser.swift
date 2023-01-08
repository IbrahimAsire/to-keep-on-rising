
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class CheakUser: UIViewController {
        
//    let db = Firestore.firestore()
    let userID = Auth.auth().currentUser?.uid
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectLogin()
        selectProv()
    }
    
    private func selectLogin() {
        let userVC = UsersVC()
        db.collection("Users").getDocuments { Snapshot, error in
            if error == nil {
                let date = Snapshot!.documents
                for ID in date {
                    if self.userID == ID["UserId"] as? String {
                        userVC.userName = ID["name"] as! String
                        print("Is a User")
                        print(userVC.userName)
                        self.navigationController?.pushViewController(
                            userVC, animated: true)
                    }
                }
            }
        }
    }
    
    private func selectProv() {
        let providerVC = ProvidersVC()
        db.collection("providers").getDocuments { Snapshot, error in
            if error == nil {
                let date = Snapshot!.documents
                for ID in date {
                    if self.userID == ID["UserId"] as? String {
                        providerVC.provName = ID["name"] as! String
                        print("Is a provider")
                        print(providerVC.provName)
                        self.navigationController?.pushViewController(
                            providerVC, animated: true)
                    }
                }
            }
        }
    }
}


