
import UIKit

class UserCell: UITableViewCell {
    
    var nameProv = UILabel()
    var content = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style , reuseIdentifier: reuseIdentifier )
        
        self.addSubview(nameProv)
        self.addSubview(content)
        
        nameProv.translatesAutoresizingMaskIntoConstraints = false
        nameProv.text = "by: "
        nameProv.textColor = .systemIndigo
        content.translatesAutoresizingMaskIntoConstraints = false
        content.text = "here what you choose .."
        
        NSLayoutConstraint.activate([
            content.centerXAnchor.constraint(equalTo: centerXAnchor),
            content.leftAnchor.constraint(equalTo: leftAnchor, constant: 12),
            nameProv.rightAnchor.constraint(equalTo: rightAnchor, constant: -12),
            nameProv.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12)
        
        ])
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}
