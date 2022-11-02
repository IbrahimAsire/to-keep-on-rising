

import UIKit

class ShowItemVC: UIViewController {
    
//    var tableView: UITableView = {
//        $0.translatesAutoresizingMaskIntoConstraints = false
//        $0.register(ShowItemCell.self, forCellReuseIdentifier: "showItem")
//        $0.rowHeight = 77
//        $0.backgroundColor = .purple
//        return $0
//    }(UITableView())
    
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .opaqueSeparator
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.backgroundColor = .purple
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            
        ])
        
    }
    
}

extension ShowItemVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "showItem", for: indexPath) as! ShowItemCell
        
        cell.contentLbl.text = "Good Morning!!"
        
        return cell
    }
    
}


