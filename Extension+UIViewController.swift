import UIKit

extension UIViewController {
    
    /// Calculates current presented view controller
    static public func getTopViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return getTopViewController(base: nav.visibleViewController)
        }
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return getTopViewController(base: selected)
            }
        }
        if let presented = base?.presentedViewController {
            return getTopViewController(base: presented)
        }
        
        return base
    }
    
}
