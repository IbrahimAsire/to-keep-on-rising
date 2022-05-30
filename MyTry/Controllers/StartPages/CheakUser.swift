
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class CheakUser: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        selectLogin()
    }
    
    private func selectLogin() {
        let userVC = UsersVC()
        let userID = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        db.collection("Users").getDocuments { Snapshot, error in
            if error == nil {
                let date = Snapshot!.documents
                for ID in date {
                    if userID == ID["UserId"] as? String {
                        userVC.userName = ID["name"] as! String
                        print("Is a User")
                        self.navigationController?.pushViewController(
                            userVC, animated: true)
                    }else{
                        print("this is no printing")
//                        self.navigationController?.pushViewController(
//                            ProvidersVC(), animated: true)
                        
                    }
                }
                
            }
        }
    }
}


