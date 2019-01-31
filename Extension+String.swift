import UIKit

extension String {
    
    /// If string have no characters returns nil
    public func clear() -> String? {
        let cleanText = trimmingCharacters(in: .whitespacesAndNewlines)
        return cleanText.isEmpty ? nil : cleanText
    }
}
