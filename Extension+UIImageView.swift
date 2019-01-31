import UIKit

extension UIImageView {
    
    public func setNative() {
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.Native.midGray.cgColor
        self.layer.masksToBounds = true
    }
    
}
