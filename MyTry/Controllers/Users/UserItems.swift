
import UIKit
import FirebaseAuth

class UserItems: UITableViewController {
    
    var arrContent: [Userschoices] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        readData()
    }
    
    private func readData() {
        let userId = Auth.auth().currentUser?.uid
        db.collection("userschoices").whereField("userID", isEqualTo: userId).addSnapshotListener { result, error in
            if error != nil {
                return
            }
            guard let docs = result?.documents else { return}
            
            for doc in docs {
                let data = doc.data()
                guard
                    let content = data["content"] as? String
                else{
                    continue
                }
                self.arrContent.append(Userschoices(myID: nil, content: content))
            }
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrContent.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = arrContent[indexPath.row].content
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("Deleted")
            
            self.arrContent.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}
