
import UIKit

class CovidVC: UIViewController {
    
    lazy var covid = CovidApi()
    
    let textTF: UITextField = {
        $0.borderStyle = .bezel
        $0.placeholder = "Type Any City!"
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.returnKeyType = .search
        return $0
    }(UITextField())
    
    let resultBtn = UIButton()
    var nameCountry = UILabel()
    var test = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        textTF.delegate = self
        covid.delegate = self
        covid.getInfo()
        
        view.addSubview(textTF)
        view.addSubview(nameCountry)
        view.addSubview(test)
        view.addSubview(resultBtn)
        
        resultBtn.translatesAutoresizingMaskIntoConstraints = false
        resultBtn.setTitle("Get Info ..", for: .normal)
        resultBtn.addTarget(self, action: #selector(getTpd), for: .touchUpInside)
        nameCountry.translatesAutoresizingMaskIntoConstraints = false
        nameCountry.text = "Here name of country choose"
        test.translatesAutoresizingMaskIntoConstraints = false
        test.text = "here the Test!"
        
        NSLayoutConstraint.activate([
            textTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textTF.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            textTF.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10),
            resultBtn.topAnchor.constraint(equalTo: textTF.bottomAnchor, constant: 18),
            resultBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameCountry.topAnchor.constraint(equalTo: resultBtn.bottomAnchor, constant: 18),
            nameCountry.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            test.topAnchor.constraint(equalTo: nameCountry.bottomAnchor, constant: 12),
            test.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        
        ])
    }
    
    @objc func getTpd() {
        
        print(textTF.text!)
    }
    
}

extension CovidVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        print(textTF.text!)
        return true
    }
    
}

extension CovidVC: NewsAPIDelegate {
    func didFetchInfo(info: Covid) {
        
        print(info)
    }
    
    func didFailWithError(error: Error?) {
        print(error)
    }
    
    
}
