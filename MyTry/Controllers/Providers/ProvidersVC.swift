
import UIKit
import FirebaseAuth

class ProvidersVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var provName = ""
    
    var arrayInfo: [ProviderInfo] = []
    let userID = Auth.auth().currentUser?.uid
    let greetLbl = UILabel()
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemYellow
        tableView.dataSource = self
        tableView.delegate = self

        readInfo()
        setUpUI()
    }
    
    private func setUpUI(){
        
        let addItem = UIBarButtonItem(
            barButtonSystemItem: .add, target: self, action: #selector(addTpd))
        let showItem = UIBarButtonItem(title: "ShowItems", style: .done, target: self, action: #selector(showItem))
        navigationItem.rightBarButtonItems = [addItem, showItem]
        
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action: #selector(addTpd))
        view.addSubview(greetLbl)
        view.addSubview(tableView)
        
        greetLbl.translatesAutoresizingMaskIntoConstraints = false
        greetLbl.text = "Welcome " + provName
        greetLbl.font = .systemFont(ofSize: 24)
        greetLbl.textColor = .black
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProvidersCell.self, forCellReuseIdentifier: "Cell")
        tableView.rowHeight = 80

        NSLayoutConstraint.activate([
            greetLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 66),
            greetLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tableView.topAnchor.constraint(equalTo: greetLbl.bottomAnchor, constant: 34),
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
        cell.contentLbl.text = arrayInfo[indexPath.row].content
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        
//        let nextVC = ProviderItems()
//        
//        nextVC.userId = userID!
//        
//        navigationController?.pushViewController(nextVC, animated: true)
//    }
    
    @objc func addTpd(){
        navigationController?.pushViewController(AddNew(), animated: true)
    }
    
    @objc func showItem(){
        let nextVC = ShowItemVC()

        nextVC.userID = userID ?? "empty"
        
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    private func readInfo(){
        db.collection("providers").addSnapshotListener { snapshot, error in
            if error != nil{
                return
            }
            
            guard let docs = snapshot?.documents else {return}
            
            self.arrayInfo.removeAll()
            
            for doc in docs{
                self.arrayInfo.append(ProviderInfo(proviederName: doc.get("name") as? String, content: doc.get("content") as? String, myID: doc.get("myId") as? String))
            }
            self.tableView.reloadData()
            
        }

    }
    
  // MARK: - to shows data for me only 
//    func readData(){
//        let docRef = db.collection("providers").document("EA2F06FF-0EEF-4180-B9B0-97CFDD213D0F")
//
//        docRef.getDocument { (document, error) in
//            if let document = document, document.exists {
//                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
//                print("Document data: \(dataDescription)")
//            } else {
//                print("Document does not exist")
//            }
//        }
//    }
    
}
