

import UIKit
import FirebaseStorage

class UplodFromAi: UIViewController {
    
    // Initialize Firebase storage reference
    let storageRef = Storage.storage().reference()
    
    // Upload image to Firebase storage
    func uploadImage(image: UIImage, imageName: String) {
        
        // Create a reference to the image file in Firebase storage
        let imageRef = storageRef.child("images/\(imageName)")
        
        // Convert image to data format
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        
        // Upload image data to Firebase storage
        let uploadTask = imageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
            } else {
                print("Image uploaded successfully!")
            }
        }
        
        // Track progress of image upload
        uploadTask.observe(.progress) { snapshot in
            let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount) / Double(snapshot.progress!.totalUnitCount)
            print("Upload progress: \(percentComplete)%")
        }
    }
    
    // Update image in Firebase storage
    func updateImage(image: UIImage, imageName: String) {
        
        // Create a reference to the image file in Firebase storage
        let imageRef = storageRef.child("images/\(imageName)")
        
        // Convert image to data format
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        
        // Update image data in Firebase storage
        imageRef.putData(imageData, metadata: nil) { metadata, error in
            if let error = error {
                print("Error updating image: \(error.localizedDescription)")
            } else {
                print("Image updated successfully!")
            }
        }
    }
    
    // Delete image from Firebase storage
    func deleteImage(imageName: String) {
        
        // Create a reference to the image file in Firebase storage
        let imageRef = storageRef.child("images/\(imageName)")
        
        // Delete image from Firebase storage
        imageRef.delete { error in
            if let error = error {
                print("Error deleting image: \(error.localizedDescription)")
            } else {
                print("Image deleted successfully!")
            }
        }
    }
}


//This code assumes that you have already set up Firebase in your project and have imported the necessary Firebase modules. Also, make sure that you have granted permission to access Firebase storage in your app's Info.plist file.
