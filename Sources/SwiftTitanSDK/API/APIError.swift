//
//  APIError.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/9/25.
//
import Foundation

public extension APIs {
    enum APIError: Error {
        case RequestFailed(String)
        case HTTPError(Int, String)
        case DecodingError(String)
        case EncodingError(String)
        
        var message: String {
            switch self {
            case .RequestFailed(let m): return m
            case .HTTPError(_, let m): return m
            case .DecodingError(let m): return m
            case .EncodingError(let m): return m
            }
        }
        var statusCode: Int? {
            switch self {
            case .HTTPError(let c, _): return c
            default: return nil
            }
        }
        
        static func isError(_ response: HTTPURLResponse) -> APIError? {
            if (200...299).contains(response.statusCode) {
                return nil
            }
            return .HTTPError(response.statusCode, "\(response.url?.absoluteString ?? ""): \(HTTPURLResponse.localizedString(forStatusCode: response.statusCode))")
        }
    }
}
