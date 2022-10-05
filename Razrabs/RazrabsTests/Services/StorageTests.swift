import XCTest
@testable import Razrabs

/*class AnyField {
    init(keyPath: AnyKeyPath) {
        _keyPath = keyPath
    }
    
    private let _keyPath: AnyKeyPath
    
    var keyPath: AnyKeyPath {
        return self._keyPath
    }
    
    func compare<O>(lhs: O, rhs: O) -> Bool {
        fatalError()
    }
    
    func isArray<T>(object: T) -> Bool {
        fatalError()
    }
}

class Field<T, V>: AnyField where V: Equatable {
    init(keyPath: KeyPath<T, V>) {
        super.init(keyPath: keyPath)
    }
    
    override var keyPath: KeyPath<T, V> {
        return super.keyPath as! KeyPath<T, V>
    }
    
    override func compare<O>(lhs: O, rhs: O) -> Bool {
        guard let lhsT = lhs as? T, let rhsT = rhs as? T else {
            return false
        }
        return lhsT[keyPath: self.keyPath] == rhsT[keyPath: self.keyPath]
    }
    
    override func isArray<O>(object: O) -> Bool {
        guard let objectT = object as? T else {
            return false
        }
        return objectT is Array<Any>
    }
}

class AnySchema {
    let fields: [AnyField]
    
    init(fields: [AnyField]) {
        self.fields = fields
    }
    
    var type: Any.Type {
        return Void.self
    }
}

class Schema<T>: AnySchema {
    override var type: Any.Type {
        return T.self
    }
}

enum PathNode {
    case keyPath(keyPath: AnyKeyPath)
    case index(index: Int)
}

typealias PropertyPath = [PathNode]

enum ComparisonResult {
    case equal
    case notEqual(propertyPath: PropertyPath)
    case notMapped
}

class Comparator {
    var schemas = [AnySchema]()
    
    init(schemas: [AnySchema]) {
        self.schemas = schemas
    }
    
    func compare<T>(lhs: T, rhs: T) -> ComparisonResult {
        guard let schema = schemas.first(where: { $0.type == T.self }) else {
            return .notMapped
        }
        for field in schema.fields {
            if !field.isArray(object: lhs) {
                if !field.compare(lhs: lhs, rhs: rhs) {
                    return .notEqual(propertyPath: [.keyPath(keyPath: field.keyPath)])
                }
            } else {
                
            }
        }
        return .equal
    }
}*/

class StorageTests: XCTestCase {
    
    /*let comparator = Comparator(schemas: [
        Schema<FeedItem>(fields: [
            Field(keyPath: \FeedItem.uid),
            Field(keyPath: \FeedItem.name),
            Field(keyPath: \FeedItem.createdAt),
            Field(keyPath: \FeedItem.updatedAt),
            Field(keyPath: \FeedItem.tags),
            Field(keyPath: \FeedItem.status),
            Field(keyPath: \FeedItem.order),
        ])
    ])*/
    
    func testCacheFeeds() {
        struct TestCase {
            var feedItems: [FeedItem]
        }
        let testCases = [
            TestCase(feedItems: [
                FeedItem(uid: "1",
                         name: "Common",
                         createdAt: .init(year: 2022, month: 10, day: 4, hour: 14, minute: 18, second: 0, millisecond: 0)!,
                         updatedAt: .init(year: 2022, month: 10, day: 4, hour: 14, minute: 18, second: 0, millisecond: 0)!,
                         tags: [
                            TagItem(uid: "10",
                                    createdAt: .init(year: 2022, month: 10, day: 4, hour: 6, minute: 18, second: 0, millisecond: 0)!,
                                    updatedAt: .init(year: 2022, month: 10, day: 4, hour: 6, minute: 18, second: 0, millisecond: 0)!,
                                    name: "tag1",
                                    description: "kinda description"),
                         ],
                         status: "done"),
            ]),
            TestCase(feedItems: [
                FeedItem(uid: "1",
                         name: "new",
                         createdAt: .init(year: 2022, month: 1, day: 4, hour: 14, minute: 18, second: 0, millisecond: 0)!,
                         updatedAt: .init(year: 2022, month: 1, day: 4, hour: 14, minute: 18, second: 0, millisecond: 0)!,
                         tags: [
                            TagItem(uid: "10",
                                    createdAt: .init(year: 2022, month: 10, day: 4, hour: 16, minute: 18, second: 0, millisecond: 0)!,
                                    updatedAt: .init(year: 2022, month: 10, day: 4, hour: 16, minute: 18, second: 0, millisecond: 0)!,
                                    name: "tag1",
                                    description: "kinda description"),
                            TagItem(uid: "20",
                                    createdAt: .init(year: 2022, month: 10, day: 4, hour: 16, minute: 18, second: 0, millisecond: 0)!,
                                    updatedAt: .init(year: 2022, month: 10, day: 4, hour: 16, minute: 18, second: 0, millisecond: 0)!,
                                    name: "tag2",
                                    description: "one more description"),
                         ],
                         status: "new"),
                FeedItem(uid: "2",
                         name: "cash",
                         createdAt: .init(year: 2022, month: 1, day: 4, hour: 14, minute: 18, second: 0, millisecond: 0)!,
                         updatedAt: .init(year: 2022, month: 1, day: 4, hour: 14, minute: 18, second: 0, millisecond: 0)!,
                         tags: [
                            TagItem(uid: "30",
                                    createdAt: .init(year: 2022, month: 10, day: 4, hour: 16, minute: 18, second: 0, millisecond: 0)!,
                                    updatedAt: .init(year: 2022, month: 10, day: 4, hour: 16, minute: 18, second: 0, millisecond: 0)!,
                                    name: "tag3",
                                    description: "kinda description"),
                            TagItem(uid: "40",
                                    createdAt: .init(year: 2022, month: 10, day: 4, hour: 16, minute: 18, second: 0, millisecond: 0)!,
                                    updatedAt: .init(year: 2022, month: 10, day: 4, hour: 16, minute: 18, second: 0, millisecond: 0)!,
                                    name: "tag4",
                                    description: "one more description"),
                         ],
                         status: "oops"),
            ]),
        ]
        for var testCase in testCases {
            let storage = Storage(filepath: "")
            storage.sync()
            storage.cache(feedItems: &testCase.feedItems)
            XCTAssertEqual(storage.extractFeedItems(), testCase.feedItems)
        }
    }
}
