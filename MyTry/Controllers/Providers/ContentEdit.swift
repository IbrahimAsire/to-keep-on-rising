

import UIKit

class ContentEdit: UIViewController {
    
    var textView = UITextView()
    var editeBtn: UIButton = {
        
        return $0
    }(UIButton())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        
        setUpUi()
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        textView.backgroundColor = .white
        NSLayoutConstraint.activate([
            textView.topAnchor.constraint(equalTo: view.topAnchor, constant: 166),
            textView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -118),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 8),
            textView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -8),
        
        ])

    }
    
    private func setUpUi(){
        editeBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(editeBtn)
        
        NSLayoutConstraint.activate([
            editeBtn.topAnchor.constraint(equalTo: textView.bottomAnchor, constant: 8),
            editeBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            editeBtn.heightAnchor.constraint(equalToConstant: 38)
        
        ])
    }
    

}
