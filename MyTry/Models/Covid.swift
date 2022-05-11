
import Foundation

struct Covid: Decodable {
    let countries: [Country]
    
}

struct Country: Decodable {
    let name: String
    let iso2: String
}
