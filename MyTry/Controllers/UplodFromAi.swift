

import UIKit
import FirebaseStorage

class UplodFromAi: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // Get a reference to the storage service
        let storage = Storage.storage()

        // Create a reference to the file you want to upload
        let imageRef = storage.reference().child("images/example.jpg")

        // Get the local file URL
        guard let localFile = Bundle.main.url(forResource: "example", withExtension: "jpg") else {
            print("Error: file not found")
            return
        }

        // Create a metadata object
        let metadata = StorageMetadata()
        metadata.contentType = "image/jpeg"

        // Upload the file to the storage reference
        let uploadTask = imageRef.putFile(from: localFile, metadata: metadata) { metadata, error in
            if let error = error {
                // Handle error
                print("Error: \(error.localizedDescription)")
            } else {
                // Metadata contains file metadata such as size, content-type, and download URL.
                let downloadURL = metadata!.bucket
                print("Upload successful! Download URL: \(downloadURL)")
            }
        }

        // Observe the upload progress
        uploadTask.observe(.progress) { snapshot in
            // A progress event occurred
            let percentComplete = 100.0 * Double(snapshot.progress!.completedUnitCount) / Double(snapshot.progress!.totalUnitCount)
            print("Upload progress: \(percentComplete)%")
        }
    }
}
