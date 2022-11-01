

import UIKit

class ShowItemVC: UIViewController {
    
    lazy var tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.dataSource = self
        $0.delegate = self
        $0.register(ShowItemCell.self, forCellReuseIdentifier: "showItem")
        $0.rowHeight = 77
        return $0
    }(UITableView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        tableView.dataSource = self
        //        tableView.delegate = self
        
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 37),
            tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            
            
        ])
        
        view.backgroundColor = .opaqueSeparator
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


