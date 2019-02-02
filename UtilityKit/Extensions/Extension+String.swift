import UIKit

extension String {
    
    /// If string have no characters returns nil
    public func clear() -> String? {
        let cleanText = trimmingCharacters(in: .whitespacesAndNewlines)
        return cleanText.isEmpty ? nil : cleanText
    }
    
    // Return string with uppercased first character
    public func capitalizedFirst() -> String {
        return prefix(1).uppercased() + self.lowercased().dropFirst()
    }
    
    mutating public func capitalizeFirst() {
        self = self.capitalizedFirst()
    }
}
