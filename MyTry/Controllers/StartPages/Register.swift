import UIKit
import Firebase
import FirebaseAuth
import SwiftUI

class Register: UITableViewController {
    
    //    Used here Generic Function
    public static func InitUI<Type>(value : Type, block: (_ object: Type) -> Void) -> Type {
        block(value)
        return value
    }
    
    let containerV = InitUI(value: UIView()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(named: "bgColor")
        $0.layer.cornerRadius = 5
        $0.layer.masksToBounds = true
    }
    
    let registerBtn = InitUI(value: UIButton()) {
        $0.backgroundColor = .systemBrown
        $0.setTitle("Register".Localizable(), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 10
        $0.addTarget(self, action: #selector(register), for: .touchUpInside)
    }
    
    let nameTF = InitUI(value: UITextField()) {
        $0.placeholder = "Your Name".Localizable()
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let emailTF = InitUI(value: UITextField()) {
        $0.placeholder = "Email".Localizable()
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    
    let passTf = InitUI(value: UITextField()) {
        $0.placeholder = "Password".Localizable()
        $0.textAlignment = .center
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.isSecureTextEntry = true
    }
    
    let loginLbl = InitUI(value: UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "Do you have your account?".Localizable()
        $0.textColor = .systemBrown
    }
    
    let loginBtn = InitUI(value: UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(loginGo), for: .touchUpInside)
        $0.setTitle("Login".Localizable(), for: .normal)
        $0.setTitleColor(.systemBrown, for: .normal)
        $0.backgroundColor = .secondarySystemBackground
    }
    
    let languageBtn = InitUI(value: UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("changeLang".Localizable(), for: .normal)
        $0.addTarget(self, action: #selector(changeLangTpd), for: .touchUpInside)
        $0.setTitleColor(.systemBrown, for: .normal)
    }
    
    let providerLbl = InitUI(value: UILabel()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.text = "As Provider".Localizable()
        $0.textColor = .systemBrown
    }
    var isProvider = false
    
    let chooseBtn = InitUI(value: UIButton()) {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setImage(UIImage(systemName: "circlebadge"), for: .normal)
        $0.addTarget(self, action: #selector(chooseRegTpd), for: .touchUpInside)
    }
    
    let emailSeparatorV = UIView()
    let nameSeparatorV = UIView()
    
    let coffeImg = InitUI(value: UIImageView()) {
        $0.image = UIImage(named: "1")
    }
    
    let whereImg = InitUI(value: UIImageView()) {
        $0.image = UIImage(named: "2")
    }
    
    let stackView = InitUI(value: UIStackView()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.axis = .horizontal
        $0.distribution = .fillEqually
        $0.spacing = 5
    }
    
    let lableSwiftUI = InitUI(value: UIButton()){
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("Navigate to SwiftUI Screen", for: .normal)
        $0.setTitleColor(.purple, for: .normal)
        $0.titleLabel?.textAlignment = .center
        $0.titleLabel?.font = .boldSystemFont(ofSize: 23)
        $0.addTarget(self, action: #selector(openSwiftUIScreen), for: .touchUpInside)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .secondarySystemBackground
        
        setUpStackView()
        setUpConstraint()
    }
    
  // MARK: - to ignore the safe area insets of all edges.
    override func viewSafeAreaInsetsDidChange(){
        super.viewSafeAreaInsetsDidChange()
        var insets = view.safeAreaInsets
        insets.top = -8
        tableView.contentInset = insets
    }
    
    
    private func setUpConstraint() {
        
        view.addSubview(containerV)
        view.addSubview(registerBtn)
        view.addSubview(loginLbl)
        view.addSubview(loginBtn)
        view.addSubview(languageBtn)
        view.addSubview(providerLbl)
        view.addSubview(chooseBtn)
        view.addSubview(lableSwiftUI)
        
        containerV.addSubview(nameTF)
        containerV.addSubview(nameSeparatorV)
        containerV.addSubview(emailTF)
        containerV.addSubview(emailSeparatorV)
        containerV.addSubview(passTf)
        
        nameSeparatorV.translatesAutoresizingMaskIntoConstraints = false
        nameSeparatorV.backgroundColor = .lightGray
        
        emailSeparatorV.translatesAutoresizingMaskIntoConstraints = false
        emailSeparatorV.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            containerV.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            containerV.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 4),
            containerV.widthAnchor.constraint(equalToConstant: 350),
            containerV.heightAnchor.constraint(equalToConstant: 150),
            
            nameTF.leftAnchor.constraint(equalTo: containerV.leftAnchor, constant: 10),
            nameTF.topAnchor.constraint(equalTo: containerV.topAnchor),
            nameTF.widthAnchor.constraint(equalTo: containerV.widthAnchor),
            nameTF.heightAnchor.constraint(equalTo: containerV.heightAnchor, multiplier: 1/3),
            
            nameSeparatorV.leftAnchor.constraint(equalTo: containerV.leftAnchor),
            nameSeparatorV.topAnchor.constraint(equalTo: nameTF.bottomAnchor),
            nameSeparatorV.widthAnchor.constraint(equalTo: containerV.widthAnchor),
            nameSeparatorV.heightAnchor.constraint(equalToConstant: 1),
            
            emailTF.leftAnchor.constraint(equalTo: containerV.leftAnchor, constant: 10),
            emailTF.topAnchor.constraint(equalTo: nameTF.bottomAnchor),
            emailTF.widthAnchor.constraint(equalTo: containerV.widthAnchor),
            emailTF.heightAnchor.constraint(equalTo: containerV.heightAnchor, multiplier: 1/3, constant: 0),
            emailSeparatorV.leftAnchor.constraint(equalTo: containerV.leftAnchor),
            emailSeparatorV.topAnchor.constraint(equalTo: emailTF.bottomAnchor),
            emailSeparatorV.widthAnchor.constraint(equalTo: containerV.widthAnchor),
            emailSeparatorV.heightAnchor.constraint(equalToConstant: 1),
            
            passTf.leftAnchor.constraint(equalTo: containerV.leftAnchor, constant: 10),
            passTf.topAnchor.constraint(equalTo: emailTF.bottomAnchor),
            passTf.widthAnchor.constraint(equalTo: containerV.widthAnchor),
            passTf.heightAnchor.constraint(equalTo: containerV.heightAnchor, multiplier: 1/3, constant: 0),
            
            registerBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            registerBtn.topAnchor.constraint(equalTo: containerV.bottomAnchor, constant: 28),
            registerBtn.widthAnchor.constraint(equalToConstant: 150),
            registerBtn.heightAnchor.constraint(equalToConstant: 50),
            
            providerLbl.leftAnchor.constraint(equalTo: registerBtn.rightAnchor, constant: 12),
            providerLbl.topAnchor.constraint(equalTo: containerV.bottomAnchor, constant: 37),
            
            chooseBtn.leftAnchor.constraint(equalTo: providerLbl.rightAnchor),
            chooseBtn.topAnchor.constraint(equalTo: containerV.bottomAnchor, constant: 37),
            
            loginLbl.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 30),
            loginLbl.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30),
            
            loginBtn.topAnchor.constraint(equalTo: registerBtn.bottomAnchor, constant: 22.5),
            loginBtn.leftAnchor.constraint(equalTo: loginLbl.rightAnchor, constant: 20),
            
            languageBtn.topAnchor.constraint(equalTo: view.topAnchor),
            languageBtn.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15),
            
            lableSwiftUI.topAnchor.constraint(equalTo: languageBtn.bottomAnchor, constant: 8),
            lableSwiftUI.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
    }
    
    private func setUpStackView() {
        
        view.addSubview(stackView)
        stackView.addArrangedSubview(whereImg)
        stackView.addArrangedSubview(coffeImg)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            //            stackView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            stackView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            stackView.heightAnchor.constraint(equalToConstant: 160),
            whereImg.widthAnchor.constraint(equalToConstant: 180)
            
        ])
    }
    
    @objc private func chooseRegTpd() {
        let imageEmpty = UIImage(systemName: "circlebadge")
        let image = UIImage(systemName: "circlebadge.fill")
        if chooseBtn.imageView?.image == UIImage(systemName: "circlebadge") {
            chooseBtn.setImage(image, for: .normal)
            self.isProvider = true
            print(self.isProvider)
        }else{
            chooseBtn.setImage(imageEmpty, for: .normal)
            self.isProvider = false
            print(self.isProvider)
        }
    }
    
    @objc private func changeLangTpd() {
        
        let alertDone = UIAlertController(title: "Change the language!".Localizable(), message: "Must restart to activate".Localizable(), preferredStyle: .alert)
        
        // Create the actions
        let okAction = UIAlertAction(title: "OK".Localizable(), style: UIAlertAction.Style.default){
            UIAlertAction in
            NSLog("OK Pressed")
            let currentLang = Locale.current.languageCode
            let newLanguage = currentLang == "en" ? "ar" : "en"
            UserDefaults.standard.setValue([newLanguage], forKey: "AppleLanguages")
            exit(0)
        }
        let cancelAction = UIAlertAction(title: "NO".Localizable(), style: .cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
            return
        }
        
        // Add the actions
        alertDone.addAction(okAction)
        alertDone.addAction(cancelAction)
        
        // Present the controller
        present(alertDone, animated: true, completion: nil)
        alertDone.view.tintColor = .systemRed
        alertDone.view.backgroundColor = .systemRed
        
    }
    
    @objc private func loginGo() {
        navigationController?.pushViewController(Login(), animated: true)
    }
    
    @objc private func openSwiftUIScreen() {
        let swiftUIViewController = UIHostingController(rootView: SwiftUIView(navigationController: self.navigationController))
        self.navigationController?.pushViewController(swiftUIViewController, animated: true)
    }
    
    
    // MARK: - to register a new user and save the info for database
    @objc private func register(){
        print(isProvider)
        
        if let email = emailTF.text, email.isEmpty == false,
           let password = passTf.text, password.isEmpty == false {
            print("Register Done")
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if error == nil {
                    let userId = result?.user.uid
                    let myId =  UUID().uuidString
                    
                    if self.isProvider == true {
                        let userNew = UserSignUp(id: userId, name: self.nameTF.text, email: self.emailTF.text, myId: myId)
                        db.collection("providers").document(myId).setData(userNew.getData())
                        
                    } else {
                        let userNew = UserSignUp(id: userId, name: self.nameTF.text, email: self.emailTF.text, myId: myId)
                        db.collection("Users").document(myId).setData(userNew.getData())
                    }
                    self.navigationController?.pushViewController(CheakUser(), animated: true)
                    
                } else {
                    print(error?.localizedDescription ?? "")
                }
            }
        }
    }
}

extension Register: UITextViewDelegate {
}

// MARK: - to Localizable
extension String {
    
    func Localizable() -> String {
        
        return NSLocalizedString(
            self, tableName: "Localizable",
            bundle: .main, value: self,
            comment: self)
    }
}



let myName = " ibrahim ahmed asiri"

