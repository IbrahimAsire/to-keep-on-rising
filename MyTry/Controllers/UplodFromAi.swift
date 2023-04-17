

import UIKit
import FirebaseStorage
import Firebase

class UplodFromAi: UIViewController {
    
    // MARK: - Properties
    
    private let imagePicker = UIImagePickerController()
    private var selectedImage: UIImage?
    var imageUrl : URL?
    let storage = Storage.storage()

    
    // MARK: - IBOutlets
    
    let imageView = UIImageView()
    let imagBtn = UIButton()
    let uploadBtn = UIButton()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        // Set up image picker
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        setUpUi()
        fetchImage()
    }
    
    //MARK: - layout of Image
    
    private func setUpUi() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imageView)
        imageView.backgroundColor = .darkGray

        imagBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imagBtn)
        imagBtn.addTarget(self, action: #selector(selectImageButtonTapped), for: .touchUpInside)
        
        uploadBtn.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(uploadBtn)
        uploadBtn.setTitle("Save", for: .normal)
        uploadBtn.layer.cornerRadius = 5
        
        uploadBtn.addTarget(self, action: #selector(uploadImageButtonTapped), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalTo: view.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor),
            imageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            
            imagBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imagBtn.widthAnchor.constraint(equalTo: view.widthAnchor),
            imagBtn.heightAnchor.constraint(equalTo: view.widthAnchor),
            imagBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 112),
            
            uploadBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            uploadBtn.widthAnchor.constraint(equalToConstant: 92),
            uploadBtn.heightAnchor.constraint(equalToConstant: 34),
            uploadBtn.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 12),
            
        ])
    }
    
    // MARK: - IBActions
    
    @objc func selectImageButtonTapped() {
        present(imagePicker, animated: true)
        print("Okay")
    }
    
    @objc func uploadImageButtonTapped(_ sender: Any) {
        print("just to ensure the image is uploaded")
        guard let image = selectedImage else { return }
        
        // Create a unique file name for the image
        let imageName = UUID().uuidString
        
        // Get a reference to the Firebase Storage location where the image will be uploaded
        let storageRef = storage.reference().child("images/\("1")/\(imageName)")
        
        // Convert the image to data
        guard let imageData = image.jpegData(compressionQuality: 0.1) else { return }
        
        // Upload the data to Firebase Storage
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            guard error == nil else {
                print("Error uploading image: \(error!.localizedDescription)")
                return
            }
            
            // Image uploaded successfully
            print("Image uploaded successfully!")
        }
    }
    
    func fetchImage() {
        // Get a reference to the Firebase Storage location of the image
        let storageRef = storage.reference().child("images/\("1")")
        
        // Download the image data from Firebase Storage
        storageRef.getData(maxSize: 10 * 1024 * 1024) { (data, error) in
            guard error == nil else {
                print("Error downloading image: \(error!.localizedDescription)")
                return
            }
            
            // Convert the image data to a UIImage
            guard let imageData = data, let image = UIImage(data: imageData) else {
                print("Error converting image data to UIImage")
                return
            }
            
            // Display the image in a UIImageView
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
            self.view.addSubview(imageView)
        }
    }
    
    @IBAction func updateImageButtonTapped(_ sender: Any) {
        guard let image = selectedImage else { return }
        
        // Create a unique file name for the image
        let imageName = UUID().uuidString
        
        // Get a reference to the Firebase Storage location where the image will be uploaded
        let storageRef = Storage.storage().reference().child("images/\(imageName)")
        
        // Convert the image to data
        guard let imageData = image.jpegData(compressionQuality: 0.1) else { return }
        
        // Upload the data to Firebase Storage and replace the existing image
        storageRef.putData(imageData, metadata: nil) { (metadata, error) in
            guard error == nil else {
                print("Error updating image: \(error!.localizedDescription)")
                return
            }
            
            // Image updated successfully
            print("Image updated successfully!")
        }
    }
    
    //the updaet and delete may be I don't use them now ...
    @IBAction func deleteImageButtonTapped(_ sender: Any) {
        // Get a reference to the Firebase Storage location of the image to be deleted
        let storageRef = Storage.storage().reference().child("images/image1.jpg")
        
        // Delete the image from Firebase Storage
        storageRef.delete { (error) in
            guard error == nil else {
                print("Error deleting image: \(error!.localizedDescription)")
                return
            }
            
            // Image deleted successfully
            print("Image deleted successfully!")
        }
    }
}

// MARK: - Extension for UIImagePickerControllerDelegate and UINavigationControllerDelegate

extension UplodFromAi: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            dismiss(animated: true)
            return
        }
        
        selectedImage = image
        imageView.image = image
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
}


/*In this example, the user can select an image from their photo library using an `UIImagePickerController`, which is presented when the "Select Image" button is tapped. The selected image is then displayed in an `UIImageView`.

When the "Upload Image" button is tapped, the selected image is uploaded to Firebase Storage using a unique file name generated by a `UUID`. The data is first compressed to reduce its size using the `jpegData` method. Once the upload is complete, a message is printed to the console.

When the "Update Image" button is tapped, the selected image is uploaded to Firebase Storage using the same unique file name as before, effectively replacing the existing image. Again, a message is printed to the console once the upload is complete.

When the "Delete Image" button is tapped, the image at the specified Firebase Storage location is deleted. A message is printed to the console once the image has been successfully deleted.

 Note that in this example, the Firebase Storage location of the image to be deleted is hard-coded as "images/image1.jpg". In a real-world application, you would likely want to retrieve the storage location dynamically based on some user input or other criteria.*/
