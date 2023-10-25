//
//  NetworkManager.swift
//  test1
//
//  Created by Rajesh  on 25/10/23.
//

import Foundation
import Alamofire

struct URLConstants {
    static let urlFormat = "https://api.spaceflightnewsapi.net/v4/articles/?has_event=true&has_launch=true&limit=%@&offset=5"
}

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    func makeGetRequest<T: Decodable>(url: String, responseType: T.Type, completion: @escaping (Result<T, Error>) -> Void) {
        
        AF.request(url, method: .get).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data)) // Successful response
            case .failure(let error):
                completion(.failure(error)) // Error response
            }
        }
        
    }
}
