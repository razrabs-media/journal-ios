import XCTest
@testable import Razrabs

class SimplePostTests: XCTestCase {
    
    func testDeserialization() throws {
        struct TestCase {
            let jsonString: String
            let expected: SimplePost
        }
        let testCases = [
            TestCase(jsonString: """
                    {
                        "uid": "ad90c252-0911-419f-a75e-b470e00a2ebb",
                        "createdAt": "2022-08-05T10:05:44.349",
                        "updatedAt": "2022-08-06T14:38:53.000",
                        "title": "Из разработчиков игр в разработчики сервиса Balancy для разработчиков игр",
                        "previewUrl": "https://github.com/razrabs-media/editorial/raw/7431f4ebe19acbdd74f9c9bee1a9198610391dec/balancy%2Fpreview.jpg",
                        "content": "ototo",
                        "description": "Несколько лет стартапства и разработки своей провальной MOBA, чтобы в итоге создать новый стартап для помощи другим разработчикам игр. Сорванные оферы из-за *****, переезд на Кипр и другие приключения.",
                        "status": "Published"
                    }
""", expected: .init(uid: "ad90c252-0911-419f-a75e-b470e00a2ebb",
                     createdAt: .init(year: 2022, month: 8, day: 5, hour: 10, minute: 5, second: 44, millisecond: 349)!,
                     updatedAt: .init(year: 2022, month: 8, day: 6, hour: 14, minute: 38, second: 53, millisecond: 000)!,
                     title: "Из разработчиков игр в разработчики сервиса Balancy для разработчиков игр",
                     previewUrl: "https://github.com/razrabs-media/editorial/raw/7431f4ebe19acbdd74f9c9bee1a9198610391dec/balancy%2Fpreview.jpg",
                     content: "ototo",
                     description: "Несколько лет стартапства и разработки своей провальной MOBA, чтобы в итоге создать новый стартап для помощи другим разработчикам игр. Сорванные оферы из-за *****, переезд на Кипр и другие приключения.",
                     status: "Published"))
        ]
        for testCase in testCases {
            let jsonDecoder = JSONDecoder.dataModelDecoder()
            let jsonData = try XCTUnwrap(testCase.jsonString.data(using: .utf8))
            let simplePost = try jsonDecoder.decode(SimplePost.self, from: jsonData)
            XCTAssertEqual(simplePost, testCase.expected)
        }
    }
}
