import Foundation

class RazrabsApi {
    let scheme: String
    let host: String
    
    enum Error: Swift.Error {
        case responseIsNil
        case httpError(statusCode: Int)
        case dataIsNil
    }
    
    init(scheme: String, host: String) {
        self.scheme = scheme
        self.host = host
    }
    
    private func makeRequest<T: Codable>(urlRequest: URLRequest, callback: @escaping (_ result: Result<T, Swift.Error>) -> ()) {
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let fireCallback = { (_ result: Result<T, Swift.Error>) -> Void in
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
                let feedResponse = try jsonDecoder.decode(T.self, from: data)
                fireCallback(.success(feedResponse))
            } catch {
                fireCallback(.failure(error))
            }
        }
        task.resume()
    }
    
    func requestCurrentFrontPage(callback: @escaping (_ result: Result<CurrentFrontPageResponse, Swift.Error>) -> Void) {
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
            "query" : "{currentFrontPage {uid createdAt updatedAt title publicationDate endDate content {uid createdAt updatedAt postUid frontPageUid componentUid position {x y} post {uid createdAt updatedAt title previewUrl content description status} component {uid createdAt updatedAt name configuration {h w type}}}}}",
        ]
        guard let jsonData = try? JSONSerialization.data(withJSONObject: jsonDictionary, options: []) else {
            fatalError()
        }
        urlRequest.httpBody = jsonData
        makeRequest(urlRequest: urlRequest, callback: callback)
    }
    
    func requestFeed(callback: @escaping (_ result: Result<FeedResponse, Swift.Error>) -> Void) {
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
        makeRequest(urlRequest: urlRequest, callback: callback)
    }
}
