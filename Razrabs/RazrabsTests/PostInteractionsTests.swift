import XCTest
@testable import Razrabs

class PostInteractionsTests: XCTestCase {
    func testDeserialization() throws {
        struct TestCase {
            let jsonString: String
            let expected: PostInteractions
        }
        let testCases = [
            TestCase(jsonString: """
            {
                "sharesCount": 0,
                "viewsCount": 0
            }
""", expected: .init(sharesCount: 0, viewsCount: 0)),
        ]
        for testCase in testCases {
            let jsonDecoder = JSONDecoder.dataModelDecoder()
            let jsonData = try XCTUnwrap(testCase.jsonString.data(using: .utf8))
            let profileItem = try jsonDecoder.decode(PostInteractions.self, from: jsonData)
            XCTAssertEqual(profileItem, testCase.expected)
        }
    }
}
