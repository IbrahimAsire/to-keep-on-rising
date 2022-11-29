

import UIKit

class ShowItemVC: UIViewController {
    
    var userID = ""
    var provContent : [ProviderInfo] = []
    
    var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(ShowItemCell.self, forCellReuseIdentifier: "showItem")
        $0.rowHeight = 66
        $0.backgroundColor = .purple
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userID)
        print(provContent)
        
        getData()
        
        view.backgroundColor = .opaqueSeparator
        tableView.dataSource = self
        tableView.delegate = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
        
    }
}

extension ShowItemVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return provContent.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showItem", for: indexPath) as! ShowItemCell
        
        //        cell.textLabel?.text = "123"
        cell.contentLbl.text = provContent[indexPath.row].content
        
        return cell
    }
    
    private func getData(){
        db.collection("providers").whereField("UserId", isEqualTo: userID).addSnapshotListener { snapshot, error in
            if error != nil{
                return
            }
            // here write your code what do you want do after fetch the data
            guard let docs = snapshot?.documents else {return}
            
            for doc in docs {
                let info = doc.data()
                guard
                    let content = info["content"] as? String
                else {
                    continue
                }
                
                self.provContent.append(ProviderInfo(proviederName: nil, content: content, myID: nil))
                
            }
            // refersh the tabelView Here
            self.tableView.reloadData()
            
            
        }
        
    }
    
}


