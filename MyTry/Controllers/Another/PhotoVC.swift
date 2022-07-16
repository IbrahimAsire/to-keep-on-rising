
import UIKit

class PhotoVC: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    
    let text = "I want solution foro that"
    
    var currentImage: UIImage = {
        
        return $0
    }(UIImage())
    
    var imgTest: UIImageView = {
            $0.contentMode = .scaleAspectFit
            $0.clipsToBounds = true
            return $0
        }(UIImageView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        
        title = "Photos"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add photo", style: .done, target: self, action: #selector(importPicture))
        navigationItem.rightBarButtonItem?.tintColor = .cyan
        
        view.addSubview(imgTest)
        imgTest.translatesAutoresizingMaskIntoConstraints = false
        imgTest.tintColor  = .white
        imgTest.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTpd))
        imgTest.addGestureRecognizer(tapRecognizer)
        
        NSLayoutConstraint.activate([
            imgTest.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imgTest.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imgTest.heightAnchor.constraint(equalToConstant: 250),
        
        ])
        
    }
    
    @objc func importPicture() {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
        
        @objc func imageTpd() {
            importPicture()
        }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        dismiss(animated: true)

        imgTest.image = image
        print("done")
    }

}
