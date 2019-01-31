import UIKit

extension UITableView {
    
    public enum ReloadAnimationStyle {
        case up
        case down
        case left
        case right
        case none
    }
    
    public func removeSeparatorsForEmptyCells() {
        tableFooterView = UIView(frame: CGRect.zero)
    }
    
    public func removeCellPadding() {
        contentInset = UIEdgeInsets.zero
    }
    
    public func reloadWithAnimation(style: ReloadAnimationStyle) {
        reloadData()
        layoutIfNeeded()
        if style != .none {
            let cells = visibleCells
            var index = 0
            let tableHeight: CGFloat = bounds.size.height
            for cell in cells {
                switch style {
                case .up:    cell.transform = CGAffineTransform(translationX: 0, y: -tableHeight)
                case .down:  cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
                case .left:  cell.transform = CGAffineTransform(translationX: tableHeight, y: 0)
                case .right: cell.transform = CGAffineTransform(translationX: -tableHeight, y: 0)
                default: break
                }
                UIView.animate(withDuration: 1, delay: 0.05 * Double(index), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseIn, animations: {
                    cell.transform = CGAffineTransform(translationX: 0, y: 0);
                }, completion: nil)
                index += 1
            }
        }
    }
    
}
