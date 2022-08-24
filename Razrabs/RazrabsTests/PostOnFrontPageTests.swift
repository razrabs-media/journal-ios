import XCTest
@testable import Razrabs

class PostOnFrontPageTests: XCTestCase {
    
    func testDeserialization() throws {
        struct TestCase {
            let jsonString: String
            let expected: PostOnFrontPage
        }
        let testCases = [
            TestCase(jsonString: """
                {
                    "uid": "0849a006-4fe3-4ba0-a587-bd4e49026436",
                    "createdAt": "2022-08-23T16:57:45.000",
                    "updatedAt": "2022-08-23T16:57:45.000",
                    "postUid": "ad90c252-0911-419f-a75e-b470e00a2ebb",
                    "frontPageUid": "a61bd361-13fa-4f76-abb7-09cdb8be7e3f",
                    "componentUid": "62da8fcd-e378-4fe3-b961-ff37bba8fa1e",
                    "position": {
                        "x": 0,
                        "y": 6
                    },
                    "post": {
                        "uid": "ad90c252-0911-419f-a75e-b470e00a2ebb",
                        "createdAt": "2022-08-05T10:05:44.349",
                        "updatedAt": "2022-08-06T14:38:53.000",
                        "title": "Из разработчиков игр в разработчики сервиса Balancy для разработчиков игр",
                        "previewUrl": "https://github.com/razrabs-media/editorial/raw/7431f4ebe19acbdd74f9c9bee1a9198610391dec/balancy%2Fpreview.jpg",
                        "content": "ototo",
                        "description": "Несколько лет стартапства и разработки своей провальной MOBA, чтобы в итоге создать новый стартап для помощи другим разработчикам игр. Сорванные оферы из-за *****, переезд на Кипр и другие приключения.",
                        "status": "Published"
                    },
                    "component": {
                        "uid": "62da8fcd-e378-4fe3-b961-ff37bba8fa1e",
                        "createdAt": "2022-08-01T12:38:21.000",
                        "updatedAt": "2022-08-01T12:38:21.000",
                        "name": "point",
                        "configuration": {
                            "h": 1,
                            "w": 1,
                            "type": "column"
                        }
                    }
                }
""", expected: .init(uid: "0849a006-4fe3-4ba0-a587-bd4e49026436",
                     createdAt: .init(year: 2022, month: 8, day: 23, hour: 16, minute: 57, second: 45, millisecond: 000)!,
                     updatedAt: .init(year: 2022, month: 8, day: 23, hour: 16, minute: 57, second: 45, millisecond: 000)!,
                     postUid: "ad90c252-0911-419f-a75e-b470e00a2ebb",
                     frontPageUid: "a61bd361-13fa-4f76-abb7-09cdb8be7e3f",
                     componentUid: "62da8fcd-e378-4fe3-b961-ff37bba8fa1e",
                     position: .init(x: 0, y: 6),
                     post: .init(uid: "ad90c252-0911-419f-a75e-b470e00a2ebb",
                                 createdAt: .init(year: 2022, month: 8, day: 5, hour: 10, minute: 5, second: 44, millisecond: 349)!,
                                 updatedAt: .init(year: 2022, month: 8, day: 6, hour: 14, minute: 38, second: 53, millisecond: 000)!,
                                 title: "Из разработчиков игр в разработчики сервиса Balancy для разработчиков игр",
                                 previewUrl: "https://github.com/razrabs-media/editorial/raw/7431f4ebe19acbdd74f9c9bee1a9198610391dec/balancy%2Fpreview.jpg",
                                 content: "ototo",
                                 description: "Несколько лет стартапства и разработки своей провальной MOBA, чтобы в итоге создать новый стартап для помощи другим разработчикам игр. Сорванные оферы из-за *****, переезд на Кипр и другие приключения.",
                                 status: "Published"),
                     component: .init(uid: "62da8fcd-e378-4fe3-b961-ff37bba8fa1e",
                                      createdAt: .init(year: 2022, month: 8, day: 1, hour: 12, minute: 38, second: 21, millisecond: 000)!,
                                      updatedAt: .init(year: 2022, month: 8, day: 1, hour: 12, minute: 38, second: 21, millisecond: 000)!,
                                      name: "point",
                                      configuration: .init(h: 1, w: 1, type: "column"))))
        ]
        for testCase in testCases {
            let jsonDecoder = JSONDecoder.dataModelDecoder()
            let jsonData = try XCTUnwrap(testCase.jsonString.data(using: .utf8))
            let postOnFrontPage = try jsonDecoder.decode(PostOnFrontPage.self, from: jsonData)
            XCTAssertEqual(postOnFrontPage, testCase.expected)
        }
    }
}
