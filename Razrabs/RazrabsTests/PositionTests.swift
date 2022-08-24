import XCTest
@testable import Razrabs

class PositionTests: XCTestCase {
    
    func testDeserialization() throws {
        struct TestCase {
            let jsonString: String
            let expected: Position
        }
        let testCases = [
            TestCase(jsonString: """
                        {
                            "x": 0,
                            "y": 6
                        }
    """, expected: .init(x: 0, y: 6)),
            TestCase(jsonString: """
                    {
                        "x": 3,
                        "y": 6
                    }
    """, expected: .init(x: 3, y: 6))
        ]
        for testCase in testCases {
            let jsonDecoder = JSONDecoder.dataModelDecoder()
            let jsonData = try XCTUnwrap(testCase.jsonString.data(using: .utf8))
            let position = try jsonDecoder.decode(Position.self, from: jsonData)
            XCTAssertEqual(position, testCase.expected)
        }
    }
}
