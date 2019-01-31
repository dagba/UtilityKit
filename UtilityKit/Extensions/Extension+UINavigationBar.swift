import UIKit

extension UINavigationBar {
    
    public func makeClear() {
        setBackgroundImage(UIImage(), for: .default)
        shadowImage = UIImage()
        isTranslucent = true
    }
    
}
