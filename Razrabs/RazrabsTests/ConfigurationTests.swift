import XCTest
@testable import Razrabs

class ConfigurationTests: XCTestCase {
    
    func testDeserialization() throws {
        struct TestCase {
            let jsonString: String
            let expected: Configuration
        }
        let testCases = [
            TestCase(jsonString: """
                            {
                                "h": 1,
                                "w": 1,
                                "type": "column"
                            }
    """, expected: .init(h: 1, w: 1, type: "column"))
        ]
        for testCase in testCases {
            let jsonDecoder = JSONDecoder.dataModelDecoder()
            let jsonData = try XCTUnwrap(testCase.jsonString.data(using: .utf8))
            let configuration = try jsonDecoder.decode(Configuration.self, from: jsonData)
            XCTAssertEqual(configuration, testCase.expected)
        }
    }
}
