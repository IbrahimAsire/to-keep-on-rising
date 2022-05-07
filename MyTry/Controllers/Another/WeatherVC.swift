

import UIKit

class WeatherVC: UIViewController {
    
    let textTF: UITextField = {
        $0.borderStyle = .bezel
        $0.placeholder = "Type Any City!"
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UITextField())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        
        view.addSubview(textTF)
        NSLayoutConstraint.activate([
            textTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textTF.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10)
        
        ])

    }
    

}
