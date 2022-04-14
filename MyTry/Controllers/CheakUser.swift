
import UIKit
import Firebase

class CheakUser: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userID = Auth.auth().currentUser?.uid
        let db = Firestore.firestore()
        db.collection("Users").getDocuments { Snapshot, error in
            if error == nil {
                let date = Snapshot!.documents
                for ID in date {
                    if userID == ID["myId"] as! String {
                        print("Is a User")
                        self.navigationController?.pushViewController(
                            UsersVC(), animated: true)
                    }else{
                        self.navigationController?.pushViewController(
                            ProvidersVC(), animated: true)
                    }
                }
            }
        }
    }
    
}
