import Foundation
import Then

extension JSONDecoder {
    static func dataModelDecoder() -> JSONDecoder {
        return .init().then {
            $0.dateDecodingStrategy = .formatted(DateFormatter().then {
                $0.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSS"
            })
        }
    }
}
