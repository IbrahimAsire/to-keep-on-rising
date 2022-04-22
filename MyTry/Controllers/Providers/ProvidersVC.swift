
import UIKit

class ProvidersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var arrayInfo: [ProviderInfo] = []
    let greetLbl = UILabel()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        tableView.dataSource = self
        tableView.delegate = self
        
        readInfo()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(addTpd))
        view.addSubview(greetLbl)
        view.addSubview(tableView)
        
        greetLbl.translatesAutoresizingMaskIntoConstraints = false
        greetLbl.text = "Welcome provide"
        greetLbl.font = .systemFont(ofSize: 24)
        greetLbl.textColor = .black
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProvidersCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 80

        NSLayoutConstraint.activate([
            greetLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            greetLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: greetLbl.bottomAnchor, constant: 12),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        ])

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayInfo.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ProvidersCell
                
        cell.nameLbl.text = arrayInfo[indexPath.row].proviederName
        
        return cell
    }
    
    @objc func addTpd(){
        navigationController?.pushViewController(AddNew(), animated: true)
    }
    
    private func readInfo(){
        db.collection("providers").addSnapshotListener { snapshot, error in
            if error != nil{
                return
            }
            guard let docs = snapshot?.documents else {return}
            
            for doc in docs{
                self.arrayInfo.append(ProviderInfo(proviederName: doc.get("name") as! String))
            }
            self.tableView.reloadData()
        }
    }
    
}
