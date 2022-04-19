//
//  UsersVC.swift
//  MyTry
//
//  Created by ibrahim asiri on 03/09/1443 AH.
//

import UIKit

class UsersVC: UIViewController {
    
    
    let greetLbl = UILabel()
    let tableView: UITableView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.register(UserCell.self, forCellReuseIdentifier: "userrCell")
        return $0
    }(UITableView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        view.addSubview(greetLbl)
        
        greetLbl.translatesAutoresizingMaskIntoConstraints = false
        greetLbl.text = "Welcome user"
        greetLbl.font = .systemFont(ofSize: 24)
        greetLbl.textColor = .black
        
        NSLayoutConstraint.activate([
            greetLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            greetLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])

    }
    
}

extension UsersVC: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as! UserCell
        
        return cell
    }
    
    
    
    
}
