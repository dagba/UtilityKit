import UIKit

private extension CGRect {
    var minSideSize: CGFloat {
        return min(self.width, self.height)
    }
}

extension UIView {
    
    public func setDeepShadow() {
        
        let xTranslationFactor: CGFloat = 0
        let yTranslationFactor: CGFloat = 0.18
        var widthRelativeFactor: CGFloat = 0.68
        let heightRelativeFactor: CGFloat = 0.78
        let blurRadiusFactor: CGFloat = 0.1
        let shadowOpacity: CGFloat = 0.3

        if self.frame.width < 120 {
            widthRelativeFactor = widthRelativeFactor * 0.8
        }
        
        var shadowWidth = self.frame.width * widthRelativeFactor
        if (self.frame.width - shadowWidth) / 2 > 35 {
            shadowWidth = self.frame.width - 70
            widthRelativeFactor = shadowWidth / self.frame.width
        }
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let xTranslation = (self.frame.width - shadowWidth) / 2 + (self.frame.width * xTranslationFactor)
        var yTranslation = (self.frame.height - shadowHeight) / 2 + (self.frame.height * yTranslationFactor)
        
        let minBottomSpace: CGFloat = 6
        if (yTranslation + shadowHeight - self.frame.height) < minBottomSpace {
            yTranslation = self.frame.height + minBottomSpace - shadowHeight
        }
        
        let maxBottomSpace: CGFloat = 12
        if (yTranslation + shadowHeight - self.frame.height) > maxBottomSpace {
            yTranslation = self.frame.height + maxBottomSpace - shadowHeight
        }
        
        var blurRadius = self.frame.minSideSize * blurRadiusFactor
        blurRadius = blurRadius > 10 ? 10 : blurRadius
        blurRadius = blurRadius < 7 ? 7 : blurRadius
        
        self.setShadow(
            xTranslation: xTranslation,
            yTranslation: yTranslation,
            widthRelativeFactor: widthRelativeFactor,
            heightRelativeFactor: heightRelativeFactor,
            blurRadius: blurRadius,
            shadowOpacity: shadowOpacity,
            cornerRadius: self.layer.cornerRadius
        )
    }
    
    public func setShadow(
        xTranslationFactor: CGFloat,
        yTranslationFactor: CGFloat,
        widthRelativeFactor: CGFloat,
        heightRelativeFactor: CGFloat,
        blurRadiusFactor: CGFloat,
        shadowOpacity: CGFloat,
        cornerRadiusFactor: CGFloat = 0
        ) {
        let shadowWidth = self.frame.width * widthRelativeFactor
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let xTranslation = (self.frame.width - shadowWidth) / 2 + (self.frame.width * xTranslationFactor)
        let yTranslation = (self.frame.height - shadowHeight) / 2 + (self.frame.height * yTranslationFactor)
        
        let cornerRadius = self.frame.minSideSize * cornerRadiusFactor
        
        let shadowPath = UIBezierPath.init(
            roundedRect: CGRect.init(x: xTranslation, y: yTranslation, width: shadowWidth, height: shadowHeight),
            cornerRadius: cornerRadius
        )
        
        let blurRadius = self.frame.minSideSize * blurRadiusFactor
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowRadius = blurRadius
        self.layer.masksToBounds = false
        self.layer.shadowPath = shadowPath.cgPath;
    }
    
    public func setShadow(
        xTranslation: CGFloat,
        yTranslation: CGFloat,
        widthRelativeFactor: CGFloat,
        heightRelativeFactor: CGFloat,
        blurRadius: CGFloat,
        shadowOpacity: CGFloat,
        cornerRadius: CGFloat = 0
        ) {
        let shadowWidth = self.frame.width * widthRelativeFactor
        let shadowHeight = self.frame.height * heightRelativeFactor
        
        let shadowPath = UIBezierPath.init(
            roundedRect: CGRect.init(x: xTranslation, y: yTranslation, width: shadowWidth, height: shadowHeight),
            cornerRadius: cornerRadius
        )
        
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = Float(shadowOpacity)
        self.layer.shadowRadius = blurRadius
        self.layer.masksToBounds = false
        self.layer.shadowPath = shadowPath.cgPath
    }
    
    public func removeShadow() {
        self.layer.shadowColor = nil
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowOpacity = 0
        self.layer.shadowPath = nil
    }
    
    public func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    public func round() {
        self.layer.cornerRadius = self.frame.minSideSize / 2
    }
    
    public func setBlurShadow(color: UIColor, style: UIView.BlurShadowStyle) {
        layer.shadowColor = color.cgColor
        layer.shadowOffset = CGSize.zero
        layer.shadowOpacity = style.rawValue
        layer.shadowRadius = 17
    }
    
}

public extension UIView {
    
    public enum BlurShadowStyle: Float {
        case light = 0.2
        case medium = 0.4
        case bold = 0.8
    }
    
}
