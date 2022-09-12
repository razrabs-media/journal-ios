import XCTest
@testable import Razrabs

class GithubAuthorTests: XCTestCase {
    func testDeserialization() throws {
        struct TestCase {
            let jsonString: String
            let expected: GithubAuthor
        }
        let testCases = [
            TestCase(jsonString: """
            {
                "uid": "7ef44322-75e5-4e69-8541-c3231dcf5a35",
                "createdAt": "2022-08-08T12:30:44.000",
                "updatedAt": "2022-09-06T14:26:21.000",
                "usernameUrl": "https://github.com/rzrbs-editoring",
                "avatarUrl": "https://avatars.githubusercontent.com/u/24244542?v=4",
                "name": "Редакция \\"Разрабов\\"",
                "postsCount": 15,
                "user": null
            }
""", expected: .init(uid: "7ef44322-75e5-4e69-8541-c3231dcf5a35",
                     createdAt: .init(year: 2022, month: 8, day: 8, hour: 12, minute: 30, second: 44, millisecond: 0)!,
                     updatedAt: .init(year: 2022, month: 9, day: 6, hour: 14, minute: 26, second: 21, millisecond: 0)!,
                     usernameUrl: "https://github.com/rzrbs-editoring",
                     avatarUrl: "https://avatars.githubusercontent.com/u/24244542?v=4",
                     name: "Редакция \"Разрабов\"",
                     postsCount: 15)),
        ]
        for testCase in testCases {
            let jsonDecoder = JSONDecoder.dataModelDecoder()
            let jsonData = try XCTUnwrap(testCase.jsonString.data(using: .utf8))
            let profileItem = try jsonDecoder.decode(GithubAuthor.self, from: jsonData)
            XCTAssertEqual(profileItem, testCase.expected)
        }
    }
}
