
import UIKit

class FirstTry: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemIndigo
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "See Covid Info", style: .done, target: self, action: #selector(CovidTpd))
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = "Here I will git Info from API"
        
        return cell
    }
    
    @objc func CovidTpd(){
        navigationController?.pushViewController(PrayerTimesVC(), animated: true)
        
    }
    
    
}
