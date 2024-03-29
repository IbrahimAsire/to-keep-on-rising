
import UIKit
import FirebaseAuth

class UsersVC: UIViewController {
    
    var userName = ""
    
    var arrayData: [UserGetData] = []
    let userID = Auth.auth().currentUser?.uid
    
    let greetLbl = UILabel()
    let tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(UserCell.self, forCellReuseIdentifier: "userCell")
        $0.rowHeight = 60
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        tableView.dataSource = self
        tableView.delegate = self
        readData()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Go your page", style: .done, target: self, action: #selector(goUserPage))
        navigationItem.rightBarButtonItem?.tintColor = .systemMint
        
        view.addSubview(greetLbl)
        view.addSubview(tableView)
        
        greetLbl.translatesAutoresizingMaskIntoConstraints = false
//        greetLbl.text = "Welcome " + userName
        greetLbl.font = .systemFont(ofSize: 24)
        greetLbl.textColor = .black
        
        NSLayoutConstraint.activate([
            greetLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            greetLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: greetLbl.bottomAnchor, constant: 12),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
    
    func readData() {
        db.collection("providers").addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            
            guard let docs = snapshot?.documents else {return}
            
            for doc in docs {
                let data = doc.data()
                guard
                    let content = data["content"] as? String,
                    let nameProve = data["name"] as? String,
                    let myID = data["myId"] as? String
                else {
                    continue
                }
                self.arrayData.append(UserGetData(myId: myID , content: content, nameProvide: nameProve))
            }
            self.tableView.reloadData()
        }
    }
    
    @objc func goUserPage() {
        let nextVC = UserItems()
        nextVC.nameUser = userName
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

extension UsersVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        let data = arrayData[indexPath.row]
        
        cell.nameProv.text = "by: " + (data.nameProvide ?? "nil")
        cell.content.text = data.content
        cell.myID = data.myId ?? "nil"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = self.arrayData[indexPath.row]
        db.collection("providers").getDocuments { result, error in
            if error == nil {
                
                let myId = data.myId
                db.collection("userschoices").document(myId!).setData([
                    "content" : data.content ?? "nil",
                    "userID" : self.userID ?? "nil",
                    "myID" : myId
                ])
                self.navigationController?.pushViewController(UserItems(), animated: true)
            }
        }
    }
    
}
