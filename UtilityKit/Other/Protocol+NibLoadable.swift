import UIKit

public func performWith(delay: Double, on thread: DispatchQueue, _ completion: @escaping () -> ()) {
    thread.asyncAfter(deadline: DispatchTime.now() + delay) {
        completion()
    }
}
