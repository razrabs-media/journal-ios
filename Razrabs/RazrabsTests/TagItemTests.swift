import XCTest
import Then
@testable import Razrabs

class TagItemTests: XCTestCase {
    
    func testDeserialization() throws {
        struct TestCase {
            let jsonString: String
            let expected: TagItem
        }
        let testCases = [
            TestCase(jsonString: """
                        {
                            "uid": "03e3163c-758e-4438-b3cb-515771692379",
                            "createdAt": "2022-08-01T14:04:32.187",
                            "updatedAt": "2022-08-01T14:04:32.187",
                            "name": "Редакция",
                            "description": "этот лейбл ставится к постам, которые написаны людьми из редакции"
                        }
                        """,
                     expected: .init(uid: "03e3163c-758e-4438-b3cb-515771692379",
                                     createdAt: .init(year: 2022, month: 8, day: 1, hour: 14, minute: 4, second: 32, millisecond: 187)!,
                                     updatedAt: .init(year: 2022, month: 8, day: 1, hour: 14, minute: 4, second: 32, millisecond: 187)!,
                                     name: "Редакция",
                                     description: "этот лейбл ставится к постам, которые написаны людьми из редакции")),
            TestCase(jsonString: """
                    {
                        "uid": "33a626e3-ffd8-4ea1-a340-55306e27f98b",
                        "createdAt": "2022-08-01T15:50:46.500",
                        "updatedAt": "2022-08-01T15:50:46.500",
                        "name": "Колонка Фила",
                        "description": "У каждого колумниста \\"Разрабов\\" будет свой собственный лейбл, который будет добавляться к его постам"
                    }
                    """,
                     expected: .init(uid: "33a626e3-ffd8-4ea1-a340-55306e27f98b",
                                     createdAt: .init(year: 2022, month: 8, day: 1, hour: 15, minute: 50, second: 46, millisecond: 500)!,
                                     updatedAt: .init(year: 2022, month: 8, day: 1, hour: 15, minute: 50, second: 46, millisecond: 500)!,
                                     name: "Колонка Фила",
                                     description: "У каждого колумниста \"Разрабов\" будет свой собственный лейбл, который будет добавляться к его постам")),
            TestCase(jsonString: """
                    {
                        "uid": "e6738878-e41f-4317-b288-f4116f37a226",
                        "createdAt": "2022-08-01T15:29:14.490",
                        "updatedAt": "2022-08-01T15:29:14.490",
                        "name": "Мнения",
                        "description": "Этот лейбл ставится к постам, которые отражают чьё-то субъективное мнение на какой-то вопрос"
                    }
                    """,
                     expected: .init(uid: "e6738878-e41f-4317-b288-f4116f37a226",
                                     createdAt: .init(year: 2022, month: 8, day: 1, hour: 15, minute: 29, second: 14, millisecond: 490)!,
                                     updatedAt: .init(year: 2022, month: 8, day: 1, hour: 15, minute: 29, second: 14, millisecond: 490)!,
                                     name: "Мнения",
                                     description: "Этот лейбл ставится к постам, которые отражают чьё-то субъективное мнение на какой-то вопрос")),
            TestCase(jsonString: """
                    {
                        "uid": "c948d4e9-9704-4aba-b0eb-3ac5da39dc33",
                        "createdAt": "2022-08-05T10:05:44.000",
                        "updatedAt": "2022-08-05T10:05:44.000",
                        "name": "Заметки безработного",
                        "description": "Авторский лейбл Андрея Апанасика"
                    }
                    """,
                     expected: .init(uid: "c948d4e9-9704-4aba-b0eb-3ac5da39dc33",
                                     createdAt: .init(year: 2022, month: 8, day: 5, hour: 10, minute: 5, second: 44, millisecond: 000)!,
                                     updatedAt: .init(year: 2022, month: 8, day: 5, hour: 10, minute: 5, second: 44, millisecond: 000)!,
                                     name: "Заметки безработного",
                                     description: "Авторский лейбл Андрея Апанасика")),
        ]
        for testCase in testCases {
            let jsonDecoder = JSONDecoder.dataModelDecoder()
            let jsonData = try XCTUnwrap(testCase.jsonString.data(using: .utf8))
            let tagItem = try jsonDecoder.decode(TagItem.self, from: jsonData)
            XCTAssertEqual(tagItem, testCase.expected)
        }
    }
}
