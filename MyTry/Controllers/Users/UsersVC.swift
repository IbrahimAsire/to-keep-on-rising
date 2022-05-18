
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
        greetLbl.text = "Welcome user"
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
        db.collection("provAdd").addSnapshotListener { snapshot, error in
            if error != nil {
                return
            }
            
            guard let docs = snapshot?.documents else {return}

            for doc in docs {
                let data = doc.data()
                guard let content = data["content"] as? String
                else {
                    continue
                }
                self.arrayData.append(UserGetData(myId: nil, content: content))
            }
            self.tableView.reloadData()
        }
    }
    
    @objc func goUserPage() {
        navigationController?.pushViewController(UserItems(), animated: true)
    }
    
}

extension UsersVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        let data = arrayData[indexPath.row]
        
        cell.textLabel?.text = data.content
        cell.textLabel?.textColor = .systemOrange
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let myId = UUID().uuidString
        let data = arrayData[indexPath.row]
        db.collection("userschoices").document(myId).setData([
            "content" : data.content,
            "userID" : userID
        ])
        print("add done")
        navigationController?.pushViewController(UserItems(), animated: true)
    
    }

}
