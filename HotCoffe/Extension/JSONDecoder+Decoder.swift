//
//  Decoder.swift
//  GoodNews
//
//  Created by Steve JobsOne on 12/21/20.
//

import Foundation


extension JSONDecoder{
    
    static func decodeData<T:Decodable>(model: T.Type,_ data: Data?,completion: @escaping(Result<T, Error>)->Void){
        let decoder = JSONDecoder()
        do {
            let data = try decoder.decode(model, from: data!)
            completion(.success(data))
        } catch {
            completion(.failure(error))
        }
    }
}
