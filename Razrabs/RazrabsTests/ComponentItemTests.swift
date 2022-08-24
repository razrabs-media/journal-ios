import XCTest
@testable import Razrabs

class ComponentItemTests: XCTestCase {
    
    func testDeserialization() throws {
        struct TestCase {
            let jsonString: String
            let expected: ComponentItem
        }
        let testCases = [
            TestCase(jsonString: """
                    {
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
""", expected: .init(uid: "62da8fcd-e378-4fe3-b961-ff37bba8fa1e",
                     createdAt: .init(year: 2022, month: 8, day: 1, hour: 12, minute: 38, second: 21, millisecond: 000)!,
                     updatedAt: .init(year: 2022, month: 8, day: 1, hour: 12, minute: 38, second: 21, millisecond: 000)!,
                     name: "point",
                     configuration: .init(h: 1, w: 1, type: "column")))
        ]
        for testCase in testCases {
            let jsonDecoder = JSONDecoder.dataModelDecoder()
            let jsonData = try XCTUnwrap(testCase.jsonString.data(using: .utf8))
            let componentItem = try jsonDecoder.decode(ComponentItem.self, from: jsonData)
            XCTAssertEqual(componentItem, testCase.expected)
        }
    }
}
