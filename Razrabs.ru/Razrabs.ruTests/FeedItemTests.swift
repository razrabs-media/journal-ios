import XCTest
@testable import Razrabs_ru

class FeedItemTests: XCTestCase {
    
    func testDeserialization() throws {
        let jsonString = """
                        {
                            "uid": "aa557187-bf7c-4d0b-bd17-63cb13809fc1",
                            "name": "Все подряд",
                            "createdAt": "2022-08-01T16:03:52.865",
                            "updatedAt": "2022-08-19T11:59:37.000",
                            "tags": [
                                {
                                    "uid": "03e3163c-758e-4438-b3cb-515771692379",
                                    "createdAt": "2022-08-01T14:04:32.187",
                                    "updatedAt": "2022-08-01T14:04:32.187",
                                    "name": "Редакция",
                                    "description": "этот лейбл ставится к постам, которые написаны людьми из редакции"
                                },
                                {
                                    "uid": "33a626e3-ffd8-4ea1-a340-55306e27f98b",
                                    "createdAt": "2022-08-01T15:50:46.500",
                                    "updatedAt": "2022-08-01T15:50:46.500",
                                    "name": "Колонка Фила",
                                    "description": "У каждого колумниста \\"Разрабов\\" будет свой собственный лейбл, который будет добавляться к его постам"
                                },
                                {
                                    "uid": "e6738878-e41f-4317-b288-f4116f37a226",
                                    "createdAt": "2022-08-01T15:29:14.490",
                                    "updatedAt": "2022-08-01T15:29:14.490",
                                    "name": "Мнения",
                                    "description": "Этот лейбл ставится к постам, которые отражают чьё-то субъективное мнение на какой-то вопрос"
                                },
                                {
                                    "uid": "c948d4e9-9704-4aba-b0eb-3ac5da39dc33",
                                    "createdAt": "2022-08-05T10:05:44.000",
                                    "updatedAt": "2022-08-05T10:05:44.000",
                                    "name": "Заметки безработного",
                                    "description": "Авторский лейбл Андрея Апанасика"
                                },
                                {
                                    "uid": "e2226abc-5ce6-416d-b289-4fdca91e3559",
                                    "createdAt": "2022-08-05T10:05:44.000",
                                    "updatedAt": "2022-08-05T10:05:44.000",
                                    "name": "Релокейт",
                                    "description": "Лейбл для историй про переезд"
                                },
                                {
                                    "uid": "e2a2bd70-ad54-4178-b6c1-5a98209fd02d",
                                    "createdAt": "2022-08-01T16:02:21.342",
                                    "updatedAt": "2022-08-01T16:02:21.342",
                                    "name": "Код",
                                    "description": "Этот лейбл — для технических постов"
                                },
                                {
                                    "uid": "9adac6e7-5bb8-46f2-b2de-cf37e562cc8b",
                                    "createdAt": "2022-08-02T18:06:56.379",
                                    "updatedAt": "2022-08-02T18:06:56.379",
                                    "name": "Колонка Наташи",
                                    "description": "У каждого колумниста \\"Разрабов\\" будет свой собственный лейбл, который будет добавляться к его поста"
                                }
                            ],
                            "status": "Public"
                        }
                        """
        let jsonDecoder = JSONDecoder.dataModelDecoder()
        let jsonData = try XCTUnwrap(jsonString.data(using: .utf8))
        let feedItem = try jsonDecoder.decode(FeedItem.self, from: jsonData)
        XCTAssertEqual(feedItem, .init(uid: "aa557187-bf7c-4d0b-bd17-63cb13809fc1",
                                       name: "Все подряд",
                                       createdAt: Date(year: 2022, month: 8, day: 1, hour: 16, minute: 3, second: 52, millisecond: 865)!,
                                       updatedAt: Date(year: 2022, month: 8, day: 19, hour: 11, minute: 59, second: 37, millisecond: 000)!,
                                       tags: [
                                        .init(uid: "03e3163c-758e-4438-b3cb-515771692379",
                                                                               createdAt: .init(year: 2022, month: 8, day: 1, hour: 14, minute: 4, second: 32, millisecond: 187)!,
                                                                               updatedAt: .init(year: 2022, month: 8, day: 1, hour: 14, minute: 4, second: 32, millisecond: 187)!,
                                                                               name: "Редакция",
                                                                               description: "этот лейбл ставится к постам, которые написаны людьми из редакции"),
                                        .init(uid: "33a626e3-ffd8-4ea1-a340-55306e27f98b",
                                                                               createdAt: .init(year: 2022, month: 8, day: 1, hour: 15, minute: 50, second: 46, millisecond: 500)!,
                                                                               updatedAt: .init(year: 2022, month: 8, day: 1, hour: 15, minute: 50, second: 46, millisecond: 500)!,
                                                                               name: "Колонка Фила",
                                                                               description: "У каждого колумниста \"Разрабов\" будет свой собственный лейбл, который будет добавляться к его постам"),
                                        .init(uid: "e6738878-e41f-4317-b288-f4116f37a226",
                                                                               createdAt: .init(year: 2022, month: 8, day: 1, hour: 15, minute: 29, second: 14, millisecond: 490)!,
                                                                               updatedAt: .init(year: 2022, month: 8, day: 1, hour: 15, minute: 29, second: 14, millisecond: 490)!,
                                                                               name: "Мнения",
                                                                               description: "Этот лейбл ставится к постам, которые отражают чьё-то субъективное мнение на какой-то вопрос"),
                                        .init(uid: "c948d4e9-9704-4aba-b0eb-3ac5da39dc33",
                                                                               createdAt: .init(year: 2022, month: 8, day: 5, hour: 10, minute: 5, second: 44, millisecond: 000)!,
                                                                               updatedAt: .init(year: 2022, month: 8, day: 5, hour: 10, minute: 5, second: 44, millisecond: 000)!,
                                                                               name: "Заметки безработного",
                                                                               description: "Авторский лейбл Андрея Апанасика"),
                                        .init(uid: "e2226abc-5ce6-416d-b289-4fdca91e3559",
                                                                               createdAt: .init(year: 2022, month: 8, day: 5, hour: 10, minute: 5, second: 44, millisecond: 000)!,
                                                                               updatedAt: .init(year: 2022, month: 8, day: 5, hour: 10, minute: 5, second: 44, millisecond: 000)!,
                                                                               name: "Релокейт",
                                                                               description: "Лейбл для историй про переезд"),
                                        .init(uid: "e2a2bd70-ad54-4178-b6c1-5a98209fd02d",
                                                                               createdAt: .init(year: 2022, month: 8, day: 1, hour: 16, minute: 2, second: 21, millisecond: 342)!,
                                                                               updatedAt: .init(year: 2022, month: 8, day: 1, hour: 16, minute: 2, second: 21, millisecond: 342)!,
                                                                               name: "Код",
                                                                               description: "Этот лейбл — для технических постов"),
                                        .init(uid: "9adac6e7-5bb8-46f2-b2de-cf37e562cc8b",
                                                                               createdAt: .init(year: 2022, month: 8, day: 2, hour: 18, minute: 6, second: 56, millisecond: 379)!,
                                                                               updatedAt: .init(year: 2022, month: 8, day: 2, hour: 18, minute: 6, second: 56, millisecond: 379)!,
                                                                               name: "Колонка Наташи",
                                                                               description: "У каждого колумниста \"Разрабов\" будет свой собственный лейбл, который будет добавляться к его поста"),
                                    ],
                                       status: "Public"))
    }
}
