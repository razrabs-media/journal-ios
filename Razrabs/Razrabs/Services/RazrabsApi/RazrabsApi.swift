import Foundation

final class RazrabsApi: PRazrabsApi {
    private let scheme: String
    private let host: String
    
    enum Error: Swift.Error {
        case responseIsNil
        case httpError(statusCode: Int)
        case dataIsNil
    }
    
    init(scheme: String, host: String) {
        self.scheme = scheme
        self.host = host
    }
    
    func requestFeed(callback: @escaping (_ result: Result<FeedResponse, Swift.Error>) -> ()) {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        urlComponents.path = "/gql"
        guard let url = urlComponents.url else {
            fatalError()
        }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("1", forHTTPHeaderField: "DNT")
        urlRequest.addValue("https://api.razrabs.ru", forHTTPHeaderField: "Origin")
        urlRequest.httpMethod = "POST"
        let jsonDictionary = [
            "query" : "query GetFeeds {feeds {uid name createdAt updatedAt tags {uid createdAt updatedAt name description} status}}",
        ]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary, options: []) else {
            fatalError()
        }
        urlRequest.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let fireCallback = { (_ result: Result<FeedResponse, Swift.Error>) -> Void in
                DispatchQueue.main.async {
                    callback(result)
                }
            }
            if let error = error {
                fireCallback(.failure(error))
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                fireCallback(.failure(Error.responseIsNil))
                return
            }
            let statusCode = httpResponse.statusCode
            guard statusCode == 200 else {
                fireCallback(.failure(Error.httpError(statusCode: statusCode)))
                return
            }
            guard let data = data else {
                fireCallback(.failure(Error.dataIsNil))
                return
            }
            do {
                let jsonDecoder = JSONDecoder.dataModelDecoder()
                let feedResponse = try jsonDecoder.decode(FeedResponse.self, from: data)
                fireCallback(.success(feedResponse))
            } catch {
                fireCallback(.failure(error))
            }
        }
        task.resume()
    }
}
