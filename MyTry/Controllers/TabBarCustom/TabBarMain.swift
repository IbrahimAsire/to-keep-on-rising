
import UIKit

class TabBarMain: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = [
            barItem(tabBarTitle: "Home".Localizable(), tabBarImage: UIImage(systemName: "house")!.withTintColor(.white, renderingMode: .alwaysOriginal), viewController: Register()),
            barItem(tabBarTitle: "Go To ..".Localizable(), tabBarImage: UIImage(systemName: "doc.fill")!.withTintColor(.white, renderingMode: .alwaysOriginal), viewController: WeatherVC()),
            barItem(tabBarTitle: "photo", tabBarImage: UIImage(systemName: "photo")!, viewController: PhotoVC()),
            barItem(tabBarTitle: "Apple", tabBarImage: UIImage(systemName: "applelogo")!, viewController: AppleVC()),
            barItem(tabBarTitle: "circle", tabBarImage: UIImage(systemName: "circle")!, viewController: Circle()),
            barItem(tabBarTitle: "Protocol", tabBarImage: UIImage(systemName: "graduationcap")!.withTintColor(.red), viewController: HashAble())
        ]
        
        tabBar.backgroundColor = .systemBrown
        tabBar.isTranslucent = false
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .selected)
        tabBar.unselectedItemTintColor = UIColor(#colorLiteral(red: 0.2403967083, green: 0.1442204118, blue: 0.02279633656, alpha: 1))
        selectedIndex = 0
        selectedIndex = 0
    }
    
    private func barItem(tabBarTitle: String, tabBarImage: UIImage, viewController: UIViewController) -> UINavigationController {
        let navCont = UINavigationController(rootViewController: viewController)
        navCont.tabBarItem.title = tabBarTitle
        navCont.tabBarItem.image = tabBarImage
        return navCont
    }
    
}

