
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
                    if userID == ID.documentID {
                        print("Is a User")
                        self.navigationController?.pushViewController(
                            Login(), animated: true)
                        return
                    }
                }
                self.navigationController?.pushViewController(
                    Login(), animated: true)

            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
