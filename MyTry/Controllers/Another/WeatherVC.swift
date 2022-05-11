

import UIKit

class WeatherVC: UIViewController {
    
    let textTF: UITextField = {
        $0.borderStyle = .bezel
        $0.placeholder = "Type Any City!"
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())
    
    let nameCountry = UILabel()
    let test = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        view.addSubview(textTF)
        view.addSubview(nameCountry)
        view.addSubview(test)
        
        nameCountry.translatesAutoresizingMaskIntoConstraints = false
        nameCountry.text = "Here name of country choose"
        test.translatesAutoresizingMaskIntoConstraints = false
        test.text = "here the Test!"
        
        NSLayoutConstraint.activate([
            textTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textTF.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            nameCountry.topAnchor.constraint(equalTo: textTF.bottomAnchor, constant: 18),
            nameCountry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            test.topAnchor.constraint(equalTo: nameCountry.bottomAnchor, constant: 12),
            test.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])

    }
    

}
