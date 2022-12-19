

import UIKit

class ContentEdit: UIViewController {
    
    var textView = UITextView()
    var editeBtn: UIButton = {
        $0.setTitle("EDIT", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.backgroundColor = .white
        $0.layer.cornerRadius = 5
        
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .tintColor
        
        setUpUi()
    }
    
    private func setUpUi(){
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        textView.backgroundColor = .white
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
    

}
