
import Foundation

struct UserSignUp {
    let id: String?
    var name: String?
    var email: String?
    let myId: String?
    
    func getData()->[String:Any] {
        return ["UserId": id, "name": name, "email": email, "myId": myId]
    }
}
