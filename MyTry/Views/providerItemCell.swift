
import UIKit

class ProviderItemCell: UICollectionViewCell {
    
    let text = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        text.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(text)
        text.font = .systemFont(ofSize: 37)
        NSLayoutConstraint.activate([
            text.heightAnchor.constraint(equalToConstant: 37),
            text.topAnchor.constraint(equalTo: topAnchor, constant: 37),
            text.centerXAnchor.constraint(equalTo: centerXAnchor),
            
        ])
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        super.init(coder: coder)
        
    }
    
}
