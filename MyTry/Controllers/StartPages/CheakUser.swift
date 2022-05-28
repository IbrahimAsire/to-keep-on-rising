
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class CheakUser: UIViewController {
    
    let userID = Auth.auth().currentUser?.uid
    
    let userVC = UsersVC()
    let providerVC = ProvidersVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectLogin()
    }
    
    private func selectLogin() {
        let db = Firestore.firestore()
        db.collection("Users").getDocuments { Snapshot, error in
            if error == nil {
                let date = Snapshot!.documents
                for ID in date {
                    if self.userID == ID["UserId"] as? String {
                        self.userVC.userName = ID["name"] as! String
                        print("Is a User")
                        self.navigationController?.pushViewController(
                            self.userVC, animated: true)
                    }else{
                        db.collection("providers").getDocuments { result, error in
                            if error == nil {
                                let data = result!.documents
                                for name in data {
                                    if self.userID == name["UserId"] as? String {
                                        self.providerVC.provName = name["name"] as! String
                                        self.navigationController?.pushViewController(
                                            self.providerVC, animated: true)
                                    }
                                }
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
}
