

import UIKit

class ShowItemCell: UITableViewCell {
    
    var contentLbl = UILabel()
    var anyThing = UILabel()
    
    //    override func awakeFromNib() {
    //        super.awakeFromNib()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style , reuseIdentifier: reuseIdentifier )
        
        self.addSubview(contentLbl)
        contentLbl.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLbl.centerXAnchor.constraint(equalTo: centerXAnchor)
            
        ])
    }
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    //    override func setSelected(_ selected: Bool, animated: Bool) {
    //        super.setSelected(selected, animated: animated)
    //
    //        // Configure the view for the selected state
    //    }
    
}
