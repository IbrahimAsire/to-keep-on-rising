
import UIKit

class ProviderItemCell: UICollectionViewCell {
    
    let provContent = UILabel()
    let provName = UILabel()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        provContent.translatesAutoresizingMaskIntoConstraints = false
        provName.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(provContent)
        self.addSubview(provName)
        provContent.font; provName.font = .systemFont(ofSize: 37)
        NSLayoutConstraint.activate([
            provContent.heightAnchor.constraint(equalToConstant: 37),
            provContent.topAnchor.constraint(equalTo: topAnchor, constant: 37),
            provContent.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            provName.heightAnchor.constraint(equalToConstant: 34),
            provName.topAnchor.constraint(equalTo: provContent.bottomAnchor, constant: 37),
            provName.leftAnchor.constraint(equalTo: leftAnchor, constant: -17),
            
        ])
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
//        super.init(coder: coder)
        
    }
    
}
