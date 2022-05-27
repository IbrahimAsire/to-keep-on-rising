
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class CheakUser: UIViewController {
    
    let userVC = UsersVC()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectLogin()
        
    }
    
    private func selectLogin() {
//        print(userID as! String)
        let userID = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        db.collection("Users").getDocuments { Snapshot, error in
            if error == nil {
                let date = Snapshot!.documents
                for ID in date {
                    if userID == ID["UserId"] as? String {
                        self.userVC.userName = ID["name"] as! String
                        print("Is a User")
                        print(self.userVC.userName)
                        self.navigationController?.pushViewController(
                            self.userVC, animated: true)
                    }else{
                        self.navigationController?.pushViewController(
                            ProvidersVC(), animated: true)
                    }
                }
            }
        }
    }
    
//    private func readProviderInfo (){
//        db.collection("providers").getDocuments { snapshot, error in
//            if error == nil {
//                let info = snapshot!.documents
//                for ID in info {
//                    
//                }
//            }
//        }
//    }
    
}
