//
//  Feeling2.swift
//  MyTry
//
//  Created by ibrahim asiri on 29/09/1444 AH.
//

import UIKit

class Feeling2: UIViewController {

    let image2 = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .opaqueSeparator

        image2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(image2)
        image2.image = UIImage(named: "de")

//        image2.addTarget(self, action: #selector(actionBtnTpd), for: .touchUpInside)

        NSLayoutConstraint.activate([
            image2.topAnchor.constraint(equalTo: view.topAnchor, constant: 86),
            image2.widthAnchor.constraint(equalTo: view.widthAnchor),
            image2.heightAnchor.constraint(equalToConstant: 600),
        
        ])
        
    }
    

    @objc func actionBtnTpd(){
        print("DoNe")
        
    }
}
