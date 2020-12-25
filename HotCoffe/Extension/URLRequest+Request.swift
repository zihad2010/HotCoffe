//
//  URLRequest+Request.swift
//  HotCoffe
//
//  Created by Steve JobsOne on 12/26/20.
//

import Foundation

extension URLRequest{
    
    static func requestWith<T:Codable>(resource:Resource<T>)-> URLRequest{
        var request = URLRequest(url: resource.url)
        request.httpMethod = resource.httpMethod.rawValue
        request.httpBody = resource.body
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}
