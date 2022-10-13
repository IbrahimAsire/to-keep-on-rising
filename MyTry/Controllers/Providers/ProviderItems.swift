

import UIKit

class ProviderItems: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! 
        
        
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBrown
        
        
    }
    

    private func setUpUi() {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
                collectionView.delegate = self
                collectionView.dataSource = self
                collectionView.backgroundColor = .white
                collectionView.alwaysBounceVertical = true
                collectionView.register(ProviderItems.self, forCellWithReuseIdentifier: "cell")
                collectionView.translatesAutoresizingMaskIntoConstraints = false
                view.addSubview(collectionView)
                NSLayoutConstraint.activate([
                    collectionView.leftAnchor.constraint(equalTo: view.leftAnchor , constant: 16),
                    collectionView.rightAnchor.constraint(equalTo: view.rightAnchor , constant: -16),
                    collectionView.topAnchor.constraint(equalTo: view.bottomAnchor),
                    collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
                ])
    }

}
