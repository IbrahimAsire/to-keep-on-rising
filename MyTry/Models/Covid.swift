
import Foundation

struct Covid: Decodable {
    let countries: [countrie]
    
}

struct countrie: Decodable {
    let name: String
    let iso2: String
}
