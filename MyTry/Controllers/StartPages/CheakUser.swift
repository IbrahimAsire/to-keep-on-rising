
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class CheakUser: UIViewController {
   
    let db = Firestore.firestore()
    let userVC = UsersVC()
    let userID = Auth.auth().currentUser?.uid

    override func viewDidLoad() {
        super.viewDidLoad()
        selectLogin()
    }
    
    private func selectLogin() {
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
                        print("this is no printing")
                        self.navigationController?.pushViewController(
                            ProvidersVC(), animated: true)
                        
                    }
                }
                
            }
        }
    }
}


