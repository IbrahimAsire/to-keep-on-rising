
import Foundation

protocol NewsAPIDelegate {
    func didFetchInfo (info: Covid)
    func didFailWithError (error: Error?)
}

struct CovidApi {
    
    var delegate: NewsAPIDelegate?
    
    func getInfo() {
                
        let urlString = URL(string: "https://covid19.mathdro.id/api/countries/")!
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: urlString) { data, urlResponse, error in
            if error != nil {
                print(error?.localizedDescription ?? "eRROR ")
            }else {
                
                do {
                    let info = try JSONDecoder().decode(Covid.self, from: data!)
                    
                    delegate?.didFetchInfo(info: info)
                }catch{
                    print(error)
                }
                
            }
        }
        task.resume()

    }
}
