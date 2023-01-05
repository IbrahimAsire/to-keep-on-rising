

import UIKit
import FirebaseAuth

class ContentEdit: UIViewController {
    
    var textView = UITextView()
    var userID = ""
    var contentGet = ""
    var editeBtn: UIButton = {
        $0.setTitle("EDIT", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
        $0.addTarget(self, action: #selector(editTabBtn), for: .touchUpInside)
        
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkText
        print(userID)
        
        
        setUpTextV()
    }
    
    private func setUpTextV(){
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        textView.text = contentGet
        textView.font = UIFont.systemFont(ofSize: 36)
        textView.textAlignment = .center
        textView.backgroundColor = .tertiaryLabel
        textView.textColor = .white
        editeBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editeBtn)
        
        
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 166),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -118),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 8),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -8),

            editeBtn.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8),
            editeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editeBtn.heightAnchor.constraint(equalToConstant: 38),
            editeBtn.widthAnchor.constraint(equalToConstant: 138)
        
        ])
    }
    
    @objc func editTabBtn(){
        
        let contentEdit = ProviderInfo(proviederName: nil, content: textView.text, myID: userID)
        db.collection("providers").document(userID).setData([
            "userId":"",
            "content":"",
//            "email":"",
            "myId":"",
            "name":"",
            
        ], merge: true)
    }

}
