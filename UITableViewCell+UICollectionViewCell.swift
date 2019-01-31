import UIKit

extension UITableViewCell {
    
    /// Make background transparent when cell selected
    public func makeSelectionClear() {
        selectionStyle = .none
    }
    
    public func removeInsetsPadding() {
        let width = bounds.width / 2
        separatorInset = UIEdgeInsets.init(top: 0, left: width, bottom: 0, right: width)
    }
    
}
