import Foundation

extension DateFormatter {
    static func themeFormatter() -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM"
        dateFormatter.locale = .init(identifier: "ru_RU")
        return dateFormatter
    }
}
