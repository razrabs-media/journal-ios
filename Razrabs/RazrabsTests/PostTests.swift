import XCTest
@testable import Razrabs

class PostTests: XCTestCase {
    func testDeserialization() throws {
        struct TestCase {
            let jsonString: String
            let expected: Post
        }
        let testCases = [
            TestCase(jsonString: """
        {
            "uid": "b1c2614f-eb61-4bdb-9530-c64ee89f35e9",
            "createdAt": "2022-09-06T14:26:21.000",
            "updatedAt": "2022-09-06T14:26:21.000",
            "title": "Кириллу Никифорову 16 лет, он работает программистом, девопсом и учится в онлайн-школе вместо обычной. Как у него все получается?",
            "readingTime": null,
            "previewUrl": "https://github.com/razrabs-media/editorial/raw/d564560d291dc53ff6327a118377d9f2e87090f7/kirill-nikiforov%2Fpreview.jpg",
            "content": "ototo",
            "description": "Сколько языков программирования можно успеть попробовать в 10 классе, можно ли стать программистом без курсов и университетов, и обязательно ли ходить в школу, если умеешь писать код.",
            "status": "Published",
            "tags": [
                {
                    "uid": "e9c7e39a-67c1-4c61-93c0-bd2c26be9cf0",
                    "createdAt": "2022-08-11T12:00:22.000",
                    "updatedAt": "2022-08-11T12:00:22.000",
                    "name": "Интервью",
                    "description": "Разговоры, вопрос-ответ, классика"
                },
                {
                    "uid": "1f8caf45-bf1a-4a44-8f7c-5da342752dbc",
                    "createdAt": "2022-08-02T18:06:56.000",
                    "updatedAt": "2022-08-02T18:06:56.000",
                    "name": "История",
                    "description": "Лейбл для больших повествовательных лонгридов"
                },
                {
                    "uid": "03e3163c-758e-4438-b3cb-515771692379",
                    "createdAt": "2022-08-01T14:04:32.000",
                    "updatedAt": "2022-08-01T14:04:32.000",
                    "name": "Редакция",
                    "description": "этот лейбл ставится к постам, которые написаны людьми из редакции"
                }
            ],
            "githubAuthor": {
                "uid": "7ef44322-75e5-4e69-8541-c3231dcf5a35",
                "createdAt": "2022-08-08T12:30:44.000",
                "updatedAt": "2022-09-06T14:26:21.000",
                "usernameUrl": "https://github.com/rzrbs-editoring",
                "avatarUrl": "https://avatars.githubusercontent.com/u/24244542?v=4",
                "name": "Редакция \\"Разрабов\\"",
                "postsCount": 15,
                "user": null
            },
            "interactions": {
                "sharesCount": 0,
                "viewsCount": 0
            },
            "comments": [
                {
                    "uid": "c1f703d9-3fdc-45fc-927a-1a018722cea3",
                    "createdAt": "2022-09-06T14:31:33.000",
                    "updatedAt": "2022-09-06T14:31:33.000",
                    "content": "я в десятом классе бил палкой крапиву, к слову",
                    "author": {
                        "uid": "1821f21f-c767-4094-8f16-488f1dfaa3e9",
                        "createdAt": "2022-08-01T14:06:12.000",
                        "updatedAt": "2022-09-06T14:31:33.000",
                        "fullName": "Philipp Ranzhin",
                        "publicName": "Philipp Ranzhin",
                        "avatarUrl": "https://avatars.githubusercontent.com/philippranzhin",
                        "commentsCount": 60
                    }
                },
                {
                    "uid": "599cd29f-eb13-46dc-8285-189e18bd8a68",
                    "createdAt": "2022-09-06T18:14:27.000",
                    "updatedAt": "2022-09-06T18:14:27.000",
                    "content": "Эх, в 16 лет мечтал стать киберспортсменом, и играл круглые сутки в cs 1.6",
                    "author": {
                        "uid": "f997f30d-a301-463a-b16d-e16b0fd56552",
                        "createdAt": "2022-08-03T18:30:41.000",
                        "updatedAt": "2022-09-06T18:14:27.000",
                        "fullName": "Woozlik515",
                        "publicName": "Woozlik515",
                        "avatarUrl": "https://avatars.githubusercontent.com/Woozlik515",
                        "commentsCount": 1
                    }
                },
                {
                    "uid": "81300f0d-114b-4716-8801-cdd14f4e8dbe",
                    "createdAt": "2022-09-08T11:53:24.000",
                    "updatedAt": "2022-09-08T11:53:24.000",
                    "content": "А мне было 20 с лишним когда я только придумала кем бы хотела работать….",
                    "author": {
                        "uid": "3afa621d-f1aa-432d-a2d0-b0df230f183b",
                        "createdAt": "2022-08-01T13:56:53.000",
                        "updatedAt": "2022-09-08T11:53:24.000",
                        "fullName": "Ольга",
                        "publicName": "Ольга",
                        "avatarUrl": "https://avatars.githubusercontent.com/6y6b07",
                        "commentsCount": 11
                    }
                },
                {
                    "uid": "754d4fd7-4695-4850-8c30-6d183f0fd84e",
                    "createdAt": "2022-09-08T11:58:39.000",
                    "updatedAt": "2022-09-08T11:58:39.000",
                    "content": "а я стал) были успехи в Quake на профессиональном уровне, но там жахнул кризис 2008 и всё сокрушительно обломилось, сейчас киберспорт всё еще продолжает вставать с колен после того времени.",
                    "author": {
                        "uid": "60680869-6813-4fbe-a946-3c3cc38aafd5",
                        "createdAt": "2022-08-02T14:29:07.000",
                        "updatedAt": "2022-09-08T11:58:39.000",
                        "fullName": "Oleg",
                        "publicName": "Oleg",
                        "avatarUrl": "https://avatars.githubusercontent.com/Olegchs",
                        "commentsCount": 1
                    }
                },
                {
                    "uid": "916d43d2-cc32-496e-bf71-0efcb8b8c6c1",
                    "createdAt": "2022-09-09T20:54:21.000",
                    "updatedAt": "2022-09-09T20:54:21.000",
                    "content": "мм.. а я в доту играл",
                    "author": {
                        "uid": "22f5196a-5ffe-4f59-bc67-b88cdcbf6946",
                        "createdAt": "2022-08-02T21:09:00.000",
                        "updatedAt": "2022-09-09T20:54:21.000",
                        "fullName": "Gleb Ezhov",
                        "publicName": "Gleb Ezhov",
                        "avatarUrl": "https://avatars.githubusercontent.com/unit8379",
                        "commentsCount": 2
                    }
                },
            ]
        }
""", expected: .init(uid: "b1c2614f-eb61-4bdb-9530-c64ee89f35e9",
                     createdAt: .init(year: 2022, month: 9, day: 6, hour: 14, minute: 26, second: 21, millisecond: 0)!,
                     updatedAt: .init(year: 2022, month: 9, day: 6, hour: 14, minute: 26, second: 21, millisecond: 0)!,
                     title: "Кириллу Никифорову 16 лет, он работает программистом, девопсом и учится в онлайн-школе вместо обычной. Как у него все получается?",
                     readingTime: nil,
                     previewUrl: "https://github.com/razrabs-media/editorial/raw/d564560d291dc53ff6327a118377d9f2e87090f7/kirill-nikiforov%2Fpreview.jpg",
                     content: "ototo",
                     description: "Сколько языков программирования можно успеть попробовать в 10 классе, можно ли стать программистом без курсов и университетов, и обязательно ли ходить в школу, если умеешь писать код.",
                     status: "Published",
                     tags: [
                        TagItem(uid: "e9c7e39a-67c1-4c61-93c0-bd2c26be9cf0",
                                createdAt: .init(year: 2022, month: 8, day: 11, hour: 12, minute: 0, second: 22, millisecond: 0)!,
                                updatedAt: .init(year: 2022, month: 8, day: 11, hour: 12, minute: 0, second: 22, millisecond: 0)!,
                                name: "Интервью",
                                description: "Разговоры, вопрос-ответ, классика"),
                        TagItem(uid: "1f8caf45-bf1a-4a44-8f7c-5da342752dbc",
                                createdAt: .init(year: 2022, month: 8, day: 2, hour: 18, minute: 6, second: 56, millisecond: 0)!,
                                updatedAt: .init(year: 2022, month: 8, day: 2, hour: 18, minute: 6, second: 56, millisecond: 0)!,
                                name: "История",
                                description: "Лейбл для больших повествовательных лонгридов"),
                        TagItem(uid: "03e3163c-758e-4438-b3cb-515771692379",
                                createdAt: .init(year: 2022, month: 8, day: 1, hour: 14, minute: 4, second: 32, millisecond: 0)!,
                                updatedAt: .init(year: 2022, month: 8, day: 1, hour: 14, minute: 4, second: 32, millisecond: 0)!,
                                name: "Редакция",
                                description: "этот лейбл ставится к постам, которые написаны людьми из редакции"),
                     ],
                     githubAuthor: GithubAuthor(uid: "7ef44322-75e5-4e69-8541-c3231dcf5a35",
                                                createdAt: .init(year: 2022, month: 8, day: 8, hour: 12, minute: 30, second: 44, millisecond: 0)!,
                                                updatedAt: .init(year: 2022, month: 9, day: 6, hour: 14, minute: 26, second: 21, millisecond: 0)!,
                                                usernameUrl: "https://github.com/rzrbs-editoring",
                                                avatarUrl: "https://avatars.githubusercontent.com/u/24244542?v=4",
                                                name: "Редакция \"Разрабов\"",
                                                postsCount: 15),
                     interactions: PostInteractions(sharesCount: 0, viewsCount: 0),
                     comments: [
                        .init(uid: "c1f703d9-3fdc-45fc-927a-1a018722cea3",
                                             createdAt: .init(year: 2022, month: 9, day: 6, hour: 14, minute: 31, second: 33, millisecond: 0)!,
                                             updatedAt: .init(year: 2022, month: 9, day: 6, hour: 14, minute: 31, second: 33, millisecond: 0)!,
                                             content: "я в десятом классе бил палкой крапиву, к слову",
                                             author: .init(uid: "1821f21f-c767-4094-8f16-488f1dfaa3e9",
                                                           createdAt: .init(year: 2022, month: 8, day: 1, hour: 14, minute: 6, second: 12, millisecond: 0)!,
                                                           updatedAt: .init(year: 2022, month: 9, day: 6, hour: 14, minute: 31, second: 33, millisecond: 0)!,
                                                           fullName: "Philipp Ranzhin",
                                                           publicName: "Philipp Ranzhin",
                                                           email: nil,
                                                           avatarUrl: "https://avatars.githubusercontent.com/philippranzhin",
                                                           commentsCount: 60),
                                             authorUid: nil,
                                             postUid: nil,
                                             replyingToCommentUid: nil,
                                             status: nil),
                        .init(uid: "599cd29f-eb13-46dc-8285-189e18bd8a68",
                                             createdAt: .init(year: 2022, month: 9, day: 6, hour: 18, minute: 14, second: 27, millisecond: 0)!,
                                             updatedAt: .init(year: 2022, month: 9, day: 6, hour: 18, minute: 14, second: 27, millisecond: 0)!,
                                             content: "Эх, в 16 лет мечтал стать киберспортсменом, и играл круглые сутки в cs 1.6",
                                             author: .init(uid: "f997f30d-a301-463a-b16d-e16b0fd56552",
                                                           createdAt: .init(year: 2022, month: 8, day: 3, hour: 18, minute: 30, second: 41, millisecond: 0)!,
                                                           updatedAt: .init(year: 2022, month: 9, day: 6, hour: 18, minute: 14, second: 27, millisecond: 0)!,
                                                           fullName: "Woozlik515",
                                                           publicName: "Woozlik515",
                                                           email: nil,
                                                           avatarUrl: "https://avatars.githubusercontent.com/Woozlik515",
                                                           commentsCount: 1),
                                             authorUid: nil,
                                             postUid: nil,
                                             replyingToCommentUid: nil,
                                             status: nil),
                        .init(uid: "81300f0d-114b-4716-8801-cdd14f4e8dbe",
                                             createdAt: .init(year: 2022, month: 9, day: 8, hour: 11, minute: 53, second: 24, millisecond: 0)!,
                                             updatedAt: .init(year: 2022, month: 9, day: 8, hour: 11, minute: 53, second: 24, millisecond: 0)!,
                                             content: "А мне было 20 с лишним когда я только придумала кем бы хотела работать….",
                                             author: .init(uid: "3afa621d-f1aa-432d-a2d0-b0df230f183b",
                                                           createdAt: .init(year: 2022, month: 8, day: 1, hour: 13, minute: 56, second: 53, millisecond: 0)!,
                                                           updatedAt: .init(year: 2022, month: 9, day: 8, hour: 11, minute: 53, second: 24, millisecond: 0)!,
                                                           fullName: "Ольга",
                                                           publicName: "Ольга",
                                                           email: nil,
                                                           avatarUrl: "https://avatars.githubusercontent.com/6y6b07",
                                                           commentsCount: 11),
                                             authorUid: nil,
                                             postUid: nil,
                                             replyingToCommentUid: nil,
                                             status: nil),
                        .init(uid: "754d4fd7-4695-4850-8c30-6d183f0fd84e",
                                             createdAt: .init(year: 2022, month: 9, day: 8, hour: 11, minute: 58, second: 39, millisecond: 0)!,
                                             updatedAt: .init(year: 2022, month: 9, day: 8, hour: 11, minute: 58, second: 39, millisecond: 0)!,
                                             content: "а я стал) были успехи в Quake на профессиональном уровне, но там жахнул кризис 2008 и всё сокрушительно обломилось, сейчас киберспорт всё еще продолжает вставать с колен после того времени.",
                                             author: .init(uid: "60680869-6813-4fbe-a946-3c3cc38aafd5",
                                                           createdAt: .init(year: 2022, month: 8, day: 2, hour: 14, minute: 29, second: 7, millisecond: 0)!,
                                                           updatedAt: .init(year: 2022, month: 9, day: 8, hour: 11, minute: 58, second: 39, millisecond: 0)!,
                                                           fullName: "Oleg",
                                                           publicName: "Oleg",
                                                           email: nil,
                                                           avatarUrl: "https://avatars.githubusercontent.com/Olegchs",
                                                           commentsCount: 1),
                                             authorUid: nil,
                                             postUid: nil,
                                             replyingToCommentUid: nil,
                                             status: nil),
                        .init(uid: "916d43d2-cc32-496e-bf71-0efcb8b8c6c1",
                                             createdAt: .init(year: 2022, month: 9, day: 9, hour: 20, minute: 54, second: 21, millisecond: 0)!,
                                             updatedAt: .init(year: 2022, month: 9, day: 9, hour: 20, minute: 54, second: 21, millisecond: 0)!,
                                             content: "мм.. а я в доту играл",
                                             author: .init(uid: "22f5196a-5ffe-4f59-bc67-b88cdcbf6946",
                                                           createdAt: .init(year: 2022, month: 8, day: 2, hour: 21, minute: 9, second: 0, millisecond: 0)!,
                                                           updatedAt: .init(year: 2022, month: 9, day: 9, hour: 20, minute: 54, second: 21, millisecond: 0)!,
                                                           fullName: "Gleb Ezhov",
                                                           publicName: "Gleb Ezhov",
                                                           email: nil,
                                                           avatarUrl: "https://avatars.githubusercontent.com/unit8379",
                                                           commentsCount: 2),
                                             authorUid: nil,
                                             postUid: nil,
                                             replyingToCommentUid: nil,
                                             status: nil),
                     ]))
        ]
        for testCase in testCases {
            let jsonDecoder = JSONDecoder.dataModelDecoder()
            let jsonData = try XCTUnwrap(testCase.jsonString.data(using: .utf8))
            let post = try jsonDecoder.decode(Post.self, from: jsonData)
            XCTAssertEqual(post.uid, testCase.expected.uid)
            XCTAssertEqual(post.createdAt, testCase.expected.createdAt)
            XCTAssertEqual(post.updatedAt, testCase.expected.updatedAt)
            XCTAssertEqual(post.title, testCase.expected.title)
            XCTAssertEqual(post.readingTime, testCase.expected.readingTime)
            XCTAssertEqual(post.previewUrl, testCase.expected.previewUrl)
            XCTAssertEqual(post.content, testCase.expected.content)
            XCTAssertEqual(post.description, testCase.expected.description)
            XCTAssertEqual(post.status, testCase.expected.status)
            XCTAssertEqual(post.tags!.count, testCase.expected.tags!.count)
            XCTAssertEqual(post.tags![0], testCase.expected.tags![0])
            XCTAssertEqual(post.tags![1], testCase.expected.tags![1])
            XCTAssertEqual(post.tags![2], testCase.expected.tags![2])
            XCTAssertEqual(post.tags, testCase.expected.tags)
            XCTAssertEqual(post.githubAuthor, testCase.expected.githubAuthor)
            XCTAssertEqual(post.interactions, testCase.expected.interactions)
            XCTAssertEqual(post.comments, testCase.expected.comments)
//            XCTAssertEqual(post, testCase.expected)
        }
    }
}
