
import UIKit

class ProvidersCell: UITableViewCell {
    
    var nameLbl = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
            super.init(style: style , reuseIdentifier: reuseIdentifier )
        
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(nameLbl)
        
        NSLayoutConstraint.activate([
            nameLbl.rightAnchor.constraint(equalTo: rightAnchor, constant: -8),
        
        ])
        

    }
    
    required init?(coder: NSCoder) {
            super.init(coder: coder)
        }


}
