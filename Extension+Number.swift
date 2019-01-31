import UIKit

public extension Int {
    
    public static func random(_ n: Int) -> Int {
        return Int(arc4random_uniform(UInt32(n)))
    }
    
    public static func random(min: Int, max: Int) -> Int {
        return Int(arc4random_uniform(UInt32(max - min - 1))) + min
    }
}

public extension Double {
    
    public static func random() -> Double {
        return Double(arc4random()) / 0xFFFFFFFF
    }
    
    public static func random(min: Double, max: Double) -> Double {
        return Double.random() * (max - min) + min
    }
}

public extension Float {
    
    public static func random() -> Float {
        return Float(arc4random()) / 0xFFFFFFFF
    }
    
    public static func random(min: Float, max: Float) -> Float {
        return Float.random() * (max - min) + min
    }
}

public extension CGFloat {
    
    public static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    public static func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}
