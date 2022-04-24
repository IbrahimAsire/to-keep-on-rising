
import UIKit

class ProvidersCell: UITableViewCell {
    
    var nameLbl = UILabel()
    var contentLbl = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
            super.init(style: style , reuseIdentifier: reuseIdentifier )
        
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        contentLbl.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(nameLbl)
        self.addSubview(contentLbl)
        
        NSLayoutConstraint.activate([
            nameLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
            contentLbl.leftAnchor.constraint(equalTo: leftAnchor, constant: 5),
        
        ])
        

    }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
        }


}
