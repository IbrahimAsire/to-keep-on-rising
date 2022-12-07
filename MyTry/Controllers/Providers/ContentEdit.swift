

import UIKit

class ContentEdit: UIViewController {
    
    var textView = UITextView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta
        
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
    

}
