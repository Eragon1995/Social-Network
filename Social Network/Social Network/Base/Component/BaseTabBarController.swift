
import UIKit

class BaseTabBarController: UITabBarController {
    func getTabIconSelectedColor() -> String? {
        return nil
    }
    
    func getTabIConUnSelectedColor() -> String? {
        return nil
    }
    
    func getTabTextSelectedColor() -> String? {
        return nil
    }
    
    func getTabTextUnSelectedColor() -> String? {
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        changeTabBarStyle()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        changeTabBarStyle()
    }
    
    func changeTabBarStyle() {
        // Foreach each item to change style
        if let count = self.tabBar.items?.count {
            for i in 0...(count-1) {
                
                // Set tab icon selected color
                if (getTabIconSelectedColor() != nil) {
                    self.tabBar.items?[i].selectedImage = self.tabBar.items?[i].selectedImage?.tint(with: UIColor(hexStr: getTabIconSelectedColor()!)).withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
                
                // Set tab icon unselected color
                if (getTabIConUnSelectedColor() != nil) {
                    self.tabBar.items?[i].image = self.tabBar.items?[i].image?.tint(with: UIColor(hexStr: getTabIConUnSelectedColor()!)).withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
                }
                
                // Set text value
                self.tabBar.items?[i].title = self.tabBar.items?[i].title?.localized
            }
        }
        
        // Set seleted text color
        if (getTabTextSelectedColor() != nil) {
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hexStr: getTabTextSelectedColor()!)], for: .selected)
        }
        
        // Set unselected text color
        if (getTabTextUnSelectedColor() != nil) {
            UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor(hexStr: getTabTextUnSelectedColor()!)], for: .normal)
        }
    }
    
}
