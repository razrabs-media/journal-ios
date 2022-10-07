import XCTest
@testable import Razrabs

class StorageTests: XCTestCase {
    
    func testCacheFrontPage() {
        struct TestCase {
            var frontPage: FrontPage
        }
        let testCases = [
            TestCase(frontPage: FrontPage(uid: "111",
                                          createdAt: .init(),
                                          updatedAt: .init(),
                                          title: "Lo malo",
                                          publicationDate: nil,
                                          endDate: nil,
                                          content: [
                                            PostOnFrontPage(uid: "222",
                                                            createdAt: .init(),
                                                            updatedAt: .init(),
                                                            postUid: "333",
                                                            frontPageUid: "111",
                                                            componentUid: "444",
                                                            position: Position(x: 1, y: 2),
                                                            post: SimplePost(uid: "333",
                                                                             createdAt: .init(),
                                                                             updatedAt: .init(),
                                                                             title: "post title",
                                                                             previewUrl: "https://url",
                                                                             content: "hi there",
                                                                             description: "hey there",
                                                                             status: "published"),
                                                            component: ComponentItem(uid: "444",
                                                                                     createdAt: .init(),
                                                                                     updatedAt: .init(),
                                                                                     name: "component",
                                                                                     configuration: Configuration(h: 1, w: 4, type: "type")))
                                          ]))
        ]
        for var testCase in testCases {
            let storage = Storage(filepath: "")
            storage.sync()
            storage.cache(frontPage: &testCase.frontPage)
            XCTAssertEqual(storage.extractFrontPage(), testCase.frontPage)
        }
    }
    
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
