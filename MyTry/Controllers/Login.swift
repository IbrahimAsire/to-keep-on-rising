
import UIKit

class Login: UIViewController {
    
    let nameTF = UITextField()
    let emailTF = UITextField()
    let loginBtn = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubview(nameTF)
        view.addSubview(emailTF)
        view.addSubview(loginBtn)
        
        nameTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        nameTF.placeholder = "type your name"
        nameTF.textAlignment = .center
        nameTF.borderStyle = .roundedRect
        emailTF.placeholder = "type your email"
        emailTF.textAlignment = .center
        emailTF.borderStyle = .roundedRect
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.setTitleColor(.systemPurple, for: .normal)
        loginBtn.backgroundColor = .white
        loginBtn.layer.cornerRadius = 5
        
        
        NSLayoutConstraint.activate([
            nameTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            nameTF.widthAnchor.constraint(equalToConstant: 360),
            nameTF.heightAnchor.constraint(equalToConstant: 60),
            
            emailTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor, constant: 12),
            emailTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTF.widthAnchor.constraint(equalToConstant: 360),
            emailTF.heightAnchor.constraint(equalToConstant: 60),
            
            loginBtn.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 16),
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.widthAnchor.constraint(equalToConstant: 180),
            loginBtn.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
}


