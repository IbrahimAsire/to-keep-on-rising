
import UIKit

class WeatherVC: UIViewController {
    
    var weatherApi = WeatherApi()
    
    let cityLabel = UILabel()
    let temperatureLabel = UILabel()
    let conditionImageView = UIImageView()
    let searchTextField = UITextField()
    let textArLbl = UILabel()
    
    let imgC = UILabel()
    let mapImg = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        weatherApi.delegate = self
        searchTextField.delegate = self
        
        barButtonItem(); setUpUI(); backgroundColorMix()
//        gestureRecognizer()

    }
    
    private func barButtonItem() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "see Covid Info", style: .plain, target: self, action: #selector(CovidTpd))
        navigationItem.rightBarButtonItem?.tintColor = .systemIndigo
    }
    
    private func setUpUI() {
        
        cityLabel.text = "City"
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(cityLabel)
        cityLabel.font = .boldSystemFont(ofSize: 40)
        NSLayoutConstraint.activate([
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130)
        ])
        
        mapImg.image = UIImage(systemName: "mappin")
        mapImg.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapImg)
        NSLayoutConstraint.activate([
           mapImg.leftAnchor.constraint(equalTo: cityLabel.leftAnchor, constant: -20),
           mapImg.topAnchor.constraint(equalTo: view.topAnchor, constant: 145)
           
        ])
        
        temperatureLabel.text = "temp"
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(temperatureLabel)
        temperatureLabel.font = .systemFont(ofSize: 75)
        NSLayoutConstraint.activate([
            temperatureLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            temperatureLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 45)
        ])
        
        imgC.text = "°C"
        imgC.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(imgC)
        imgC.font = .systemFont(ofSize: 80)
        NSLayoutConstraint.activate([
            imgC.rightAnchor.constraint(equalTo: temperatureLabel.rightAnchor, constant: 100),
            imgC.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 45)
        ])
        
        conditionImageView.layer.masksToBounds = true
        conditionImageView.layer.cornerRadius = 5.0
        conditionImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(conditionImageView)
        NSLayoutConstraint.activate([
            conditionImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 230),
            conditionImageView.rightAnchor.constraint(equalTo: imgC.rightAnchor, constant: 80),
            conditionImageView.heightAnchor.constraint(equalToConstant: 70),
            conditionImageView.widthAnchor.constraint(equalToConstant: 70)
        ])
        
        searchTextField.placeholder = "Type a city"
        searchTextField.backgroundColor = .systemGray5
        searchTextField.textColor = .black
        searchTextField.endEditing(true)
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(searchTextField)
        searchTextField.font = .boldSystemFont(ofSize: 40)
        searchTextField.textAlignment = .center
        NSLayoutConstraint.activate([
            searchTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50),
            searchTextField.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 45),
            searchTextField.widthAnchor.constraint(equalToConstant: 210)
        ])
        
        textArLbl.text = "نعتذر لعدم دعم لغتنا العربية"
        textArLbl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textArLbl)
        textArLbl.font = .boldSystemFont(ofSize: 10)
        NSLayoutConstraint.activate([
            textArLbl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5),
            textArLbl.topAnchor.constraint(equalTo: temperatureLabel.bottomAnchor, constant: 45),
            textArLbl.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func backgroundColorMix() {
        let gradient = CAGradientLayer()
        gradient.frame = self.view.bounds
        gradient.colors = [UIColor.gray.cgColor, UIColor.white.cgColor, UIColor.blue.cgColor]
        self.view.layer.insertSublayer(gradient, at: 0)
    }
    
    private func gestureRecognizer(){
        let mode = UITapGestureRecognizer(target: self, action: #selector(Mode))
        mode.numberOfTapsRequired = 2
        view.addGestureRecognizer(mode)
        
        let mode2 = UITapGestureRecognizer(target: self, action: #selector(Mode2))
        view.addGestureRecognizer(mode2)
        
        view.isUserInteractionEnabled = true
        
    }
    
    @objc func Mode() {
        view.backgroundColor = UIColor(named: "background")
    }
    
    @objc func Mode2() {
        view.backgroundColor = UIColor(named: "background2")
    }
    
    @objc func CovidTpd(){
        navigationController?.pushViewController(CovidVC(), animated: true)
        
    }

}

extension WeatherVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.endEditing(true)
        let img = UIImage(named: "4")
        let background = UIColor(patternImage: img!)
        view.backgroundColor = background
        return true
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            textField.placeholder = "Type something"
            return false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {

        if let city = searchTextField.text {
            weatherApi.fetchWeather(cityName: city)
        }
        searchTextField.text = ""
    }

}

extension WeatherVC: WeatherApiDelegate {
    
    func didUpdateWeather(_ weatherManager: WeatherApi, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLabel.text = weather.temperatureString
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
            self.cityLabel.text = weather.cityName
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}
