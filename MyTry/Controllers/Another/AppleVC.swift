
import UIKit
import WebKit

class AppleVC: UIViewController, WKUIDelegate {
        
    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        return webView
    }()
    
    let forwardBarItem = UIBarButtonItem(title: "Forward", style: .plain, target: self,
                                         action: #selector(forwardAction))
    let backBarItem = UIBarButtonItem(title: "Backward", style: .plain, target: self,
                                      action: #selector(backAction))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBrown
        
        setupUI()
        setupNavItem()
        let myURL = URL(string: "https://www.apple.com")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavBar()
    }
    
    private func setupNavItem() {
        self.navigationItem.leftBarButtonItem = backBarItem
        self.navigationItem.rightBarButtonItem = forwardBarItem
    }
    
    private func setupNavBar() {
        self.navigationController?.navigationBar.barTintColor = .systemBlue
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func forwardAction() {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @objc func backAction() {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    private func setupUI() {
        view.addSubview(webView)
        webView.backgroundColor = .white
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            webView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            webView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor)
            
        ])
    }
    
}
