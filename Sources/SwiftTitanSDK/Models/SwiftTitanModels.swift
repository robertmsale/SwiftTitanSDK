//
//  Models.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 1/29/25.
//

import Foundation

public protocol URLQueryConvertible: Codable {
    func toQueryItems() throws -> [URLQueryItem]?
}

extension URLQueryConvertible {
    public func toQueryItems() throws -> [URLQueryItem]? {
        let encoder = JSONEncoder()
        let data = try encoder.encode(self)
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
        
        guard let dictionary = jsonObject as? [String: Any?] else {
            throw URLError(.badURL)
        }
        
        let queryItems = dictionary.compactMap { (key, value) -> URLQueryItem? in
            guard let v = value else { return nil }
            if let array = v as? [Any] {
                return URLQueryItem(name: key, value: array.map { "\($0)" }.joined(separator: ","))
            } else {
                return URLQueryItem(name: key, value: "\(v)")
            }
        }.compactMap { $0 }
        return queryItems.isEmpty ? nil : queryItems
    }
}
public struct Models {}

