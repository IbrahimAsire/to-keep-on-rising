//
//  Providers.swift
//  MyTry
//
//  Created by ibrahim asiri on 03/09/1443 AH.
//

import UIKit

class ProvidersVC: UIViewController {
    
    let greetLbl = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        
        view.addSubview(greetLbl)
        
        greetLbl.translatesAutoresizingMaskIntoConstraints = false
        greetLbl.text = "Welcome provide"
        greetLbl.font = .systemFont(ofSize: 24)
        greetLbl.textColor = .secondaryLabel
        
        NSLayoutConstraint.activate([
            greetLbl.topAnchor.constraint(equalTo: view.topAnchor, constant: 77),
            greetLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])

    }
    

}
