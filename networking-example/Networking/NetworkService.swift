//
//  NetworkService.swift
//  networking-example
//
//  Created by akin on 5.06.2023.
//

import UIKit

class NetworkService {
    func fetchQuotes(completion: @escaping (Result<[QuoteResponse], Error>) -> ()) {
        request(router: Router.getQuotes, completion: completion)
    }
}

private extension NetworkService {
    func request<T: Codable>(router: Router, completion: @escaping (Result<T, Error>) -> ()) {

        let components = makeUrlComponents(router: router)
        guard let url = components.url else {
            return
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = router.method

        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            if let err = error {
                completion(.failure(err))
                print(err.localizedDescription)
                return
            }

            guard let _ = response, let data = data else {
                return
            }

            do {
                let responseObject = try JSONDecoder().decode(T.self, from: data)
                
                DispatchQueue.main.async {
                    completion(.success(responseObject))
                }
            } catch {
                print("json decode error")
            }
        }

        dataTask.resume()
    }

    func makeUrlComponents(router: Router) -> URLComponents {
        var components = URLComponents()
        components.scheme = router.scheme
        components.host = router.host
        components.path = router.path
        components.queryItems = router.parameters
        return components
    }
}
