//
//  WebService.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/23/20.
//

import Foundation

enum NetworkError: Error {
    case decodingError
    case domainError
    case urlError
}

enum Result<T,H> {
    case success(T)
    case failure(H)
}

typealias HandlerResult = Result<Decodable,NetworkError>

struct Resource<T:Decodable> {
    
    let url: URL
}

class WebService {
    
    func load<T:Decodable>(resource:Resource<T>,completion:@escaping(Result<T,NetworkError>)->Void )  {
        
        URLSession.shared.dataTask(with: resource.url) {(data, reponse, error) in
            
            guard let data = data, error == nil else {
                completion(.failure(.domainError))
                return
            }
            JSONDecoder.decodeData(model: T.self, data) {(result) in
                
                switch result{
                case.success(let data):
                    completion(.success(data))
                    break
                case .failure(let error):
                    completion(.failure(.decodingError))
                    print(error.localizedDescription)
                    break
                }
            }
            
        }.resume()
    }
}



