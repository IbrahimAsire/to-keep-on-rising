

import UIKit

class ShowItemCell: UITableViewCell {
    
    var contentLbl = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(contentLbl)
        contentLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLbl.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
