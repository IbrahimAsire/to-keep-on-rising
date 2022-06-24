
import UIKit

class PhotoVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    var currentImage: UIImage = {
        
        return $0
    }(UIImage())
    
    var imgTest = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        title = "Photos"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add photo", style: .done, target: self, action: #selector(importPicture))
        navigationItem.rightBarButtonItem?.tintColor = .cyan
        
        view.addSubview(imgTest)
        imgTest.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imgTest.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        
        ])
        
        
        
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImageView else { return }

        dismiss(animated: true)

        imgTest = image
    }
    
  
}
