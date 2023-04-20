//
//  HomeOfFeeling.swift
//  MyTry
//
//  Created by ibrahim asiri on 29/09/1444 AH.
//

import UIKit

class HomeOfFeeling: UIViewController {
    
//    let image1 = UIImageView()
    let textLbl = UILabel()
    let page2Btn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .init(red: 0.2727114856, green: 0.7798455954, blue: 0.3978339434, alpha: 1)
        
//        view.backgroundColor = .init(red: 1, green: 0.6235294118, blue: 0.03921568627, alpha: 0.7595131803)

//        image1.translatesAutoresizingMaskIntoConstraints = false
//        view.addSubview(image1)
//        image1.image = UIImage(named: "f1")
        
        textLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textLbl)
        textLbl.text = " أبو سعدية يبارك لكم بالعيد وكل عام وانتم بخير"
        textLbl.textColor = .white
        textLbl.textAlignment = .center
        textLbl.font = .boldSystemFont(ofSize: 34)
        textLbl.numberOfLines = .zero
        
        page2Btn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(page2Btn)
        page2Btn.addTarget(self, action: #selector(goPreesTpd), for: .touchUpInside)

        NSLayoutConstraint.activate([
//            image1.topAnchor.constraint(equalTo: view.topAnchor, constant: 86),
//            image1.widthAnchor.constraint(equalTo: view.widthAnchor),
//            image1.heightAnchor.constraint(equalToConstant: 600),
            
            textLbl.widthAnchor.constraint(equalTo: view.widthAnchor),
            textLbl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textLbl.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            page2Btn.topAnchor.constraint(equalTo: view.topAnchor, constant: 86),
            page2Btn.widthAnchor.constraint(equalTo: view.widthAnchor),
            page2Btn.heightAnchor.constraint(equalToConstant: 600),
        
        ])

    }
   
    @objc func goPreesTpd(){
//        navigationController?.pushViewController(Feeling2(), animated: true)
        present(Feeling2(), animated: true)
    }

}
