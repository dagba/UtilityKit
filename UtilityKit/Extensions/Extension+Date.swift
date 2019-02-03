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
            let currentYear = String(calendar.component(.year, from: Date()))
            
            if stringDate.contains(currentYear) {
                let day = calendar.component(.day, from: date)
                let week = calendar.component(.weekOfYear, from: date)
                let currentWeek = calendar.component(.weekOfYear, from: Date())
                
                if calendar.isDateInYesterday(date) {
                    formatter.doesRelativeDateFormatting = true
                    return formatter.string(from: date)
                } else if week == currentWeek {
                    formatter.dateFormat = "EEEE"
                    return formatter.string(from: date)
                }
                
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
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "LLLL"
        
        let month = formatter.string(from: self)
        
        return month.prefix(1).uppercased() + month.dropFirst()
    }
    
    public var year: Int {
        return Calendar.init(identifier: Calendar.Identifier.gregorian).component(.year, from: self)
    }
    
}
