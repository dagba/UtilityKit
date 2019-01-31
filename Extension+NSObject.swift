import UIKit

extension NSObject {
    
    /// Returns a string represantable name of class
    static var className: String {
        return String(describing: self.self)
    }
    
}
