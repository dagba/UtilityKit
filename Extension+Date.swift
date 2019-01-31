import Foundation

extension Date {
    
    public var string: String {
        let date = self
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        let calendar = Calendar(identifier: Calendar.Identifier.gregorian)
        formatter.locale = Locale(identifier: Locale.current.languageCode ?? "ru_RU")
        
        if !calendar.isDateInToday(date) {
            var stringDate = formatter.string(from: date)
            let currentYear = String(Calendar.current.component(.year, from: Date()))
            
            if stringDate.contains(currentYear) {
                let day = calendar.component(.day, from: date)
                formatter.dateFormat = "MMM"
                let month = formatter.string(from: date)
                stringDate = "\(day) \(month)".replacingOccurrences(of: ".", with: "")
            } else {
                formatter.dateStyle = .short
                stringDate = formatter.string(from: date).replacingOccurrences(of: ".", with: "/")
            }
            
            return stringDate
        } else {
            formatter.dateStyle = .none
            formatter.timeStyle = .short
            return formatter.string(from: date)
        }
    }
    
    public var day: Int {
        return Calendar.init(identifier: Calendar.Identifier.gregorian).component(.day, from: self)
    }
    
    public var isToday: Bool {
        let calendar = Calendar.init(identifier: Calendar.Identifier.gregorian)
        return calendar.component(.day, from: self) == calendar.component(.day, from: Date())
    }
    
    public var month: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: Locale.current.languageCode ?? "ru_RU")
        formatter.dateFormat = "LLLL"
        return formatter.string(from: self)
    }
    
    public var year: Int {
        return Calendar.init(identifier: Calendar.Identifier.gregorian).component(.year, from: self)
    }
    
}
