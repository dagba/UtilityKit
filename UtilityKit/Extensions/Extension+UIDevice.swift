import UIKit

extension UIDevice {
    
    public static var isIphone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    public static var isIpad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
}
