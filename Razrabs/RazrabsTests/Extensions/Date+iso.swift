import Foundation

extension Date {
    init?(year: Int, month: Int, day: Int, hour: Int, minute: Int, second: Int, millisecond: Int) {
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        dateComponents.nanosecond = millisecond * 1000000
        guard let date = Calendar.current.date(from: dateComponents) else {
            return nil
        }
        self = date
    }
}
