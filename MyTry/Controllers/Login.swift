
import UIKit
import Firebase

class Login: UIViewController {
    
    let emailTF = UITextField()
    let passwordTF = UITextField()
    let loginBtn = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        setUpUI()
    }
    
    private func setUpUI() {
        view.addSubview(passwordTF)
        view.addSubview(emailTF)
        view.addSubview(loginBtn)
        
        passwordTF.translatesAutoresizingMaskIntoConstraints = false
        emailTF.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        passwordTF.placeholder = "enter your email"
        passwordTF.textAlignment = .center
        passwordTF.borderStyle = .roundedRect
        emailTF.placeholder = "password"
        emailTF.textAlignment = .center
        emailTF.borderStyle = .roundedRect
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.setTitleColor(.systemPurple, for: .normal)
        loginBtn.backgroundColor = .white
        loginBtn.layer.cornerRadius = 5
        loginBtn.addTarget(self, action: #selector(loginTpd), for: .touchUpInside)
        
        
        NSLayoutConstraint.activate([
            passwordTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 360),
            passwordTF.widthAnchor.constraint(equalToConstant: 360),
            passwordTF.heightAnchor.constraint(equalToConstant: 60),
            
            emailTF.topAnchor.constraint(equalTo: passwordTF.bottomAnchor, constant: 12),
            emailTF.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emailTF.widthAnchor.constraint(equalToConstant: 360),
            emailTF.heightAnchor.constraint(equalToConstant: 60),
            
            loginBtn.topAnchor.constraint(equalTo: emailTF.bottomAnchor, constant: 16),
            loginBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginBtn.widthAnchor.constraint(equalToConstant: 180),
            loginBtn.heightAnchor.constraint(equalToConstant: 48)
            
        ])
    }
    
    @objc func loginTpd(){
        if let email = emailTF.text, email.isEmpty == false,
           let password = passwordTF.text, password.isEmpty == false {
            
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                
                if let error = error as NSError? {
                    switch AuthErrorCode(rawValue: error.code) {
                    case .wrongPassword:
                        
                        let alert = UIAlertController(title: "Oops!".Localizable(), message: "you entered a wrong password".Localizable(), preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK".Localizable(), style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                        
                    case .invalidEmail:
                        
                        let alert = UIAlertController(title: "Oops!".Localizable(), message: "are sure you typed the email correctly?".Localizable(), preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK".Localizable(), style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                        
                    case .weakPassword:
                        
                        let alert = UIAlertController(title: "Oops!".Localizable(), message: "Your password is weak, please make sure it's strong.".Localizable(), preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK".Localizable(), style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                        
                    default:
                        
                        let alert = UIAlertController(title: "Oops!".Localizable(), message: "\(error.localizedDescription)", preferredStyle: .alert)
                        alert.addAction(UIAlertAction(title: "OK".Localizable(), style: .cancel, handler: nil))
                        self.present(alert, animated: true)
                        
                    }
                }else{
                    
                    if error == nil {
                        
                        self.navigationController?.pushViewController(CheakUser(), animated: true)
                    } else {
                        print(error?.localizedDescription)
                    }
                    
                }
                
            }
            
        }
    }
}

