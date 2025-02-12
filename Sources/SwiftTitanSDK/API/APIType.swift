//
//  APIType.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/8/25.
//

import Foundation

public extension APIs {
    protocol APIType {
        var tenant: Int64 { get }
        var appKey: String { get }
        var apiName: String { get }
    }
    
    
    class APIBase: APIType {
        public var tenant: Int64 { sdk.tenant }
        public var appKey: String { sdk.appKey }
        let _apiName: String
        public var apiName: String { _apiName }
        public unowned let sdk: SwiftTitanSDK
        public init(_ sdk: SwiftTitanSDK, apiName: String) {
            self.sdk = sdk
            self._apiName = apiName
        }
        
        func prepComponents(endpoint: String, params: (any URLQueryConvertible)? = nil) -> URLComponents {
            var components = URLComponents()
            components.scheme = "https"
            components.host = sdk.host
            components.path = endpoint
            if let queryItems = try? params?.toQueryItems() {
                components.queryItems = queryItems
            }
            return components
        }
        
        func getReq<T: Codable>(_ type: T.Type, endpoint: String, params: (any URLQueryConvertible)? = nil) async -> Result<T, APIError> {
            let result = await getRawReq(endpoint: endpoint, params: params)
            switch result {
            case .success(let data):
                guard let decoded = try? sdk.decoder.decode(type.self, from: data) else {
                    return .failure(.DecodingError("GET: \(endpoint) - Decoding Error"))
                }
                return .success(decoded)
            case .failure(let v): return .failure(v)
            }
        }
        func getRawReq(endpoint: String, params: (any URLQueryConvertible)? = nil) async -> Result<Data, APIError> {
            let components = prepComponents(endpoint: endpoint, params: params)
            let errorPreamble = "GET: " + components.path
            let tokenResult = await sdk.getAuthToken()
            var token: String!
            switch tokenResult {
            case .failure(let err): return .failure(.AuthError(err))
            case .success(let tok): token = tok
            }
            var request = URLRequest(url: components.url!)
            request.url = components.url!
            request.httpMethod = "GET"
            request.setValue(sdk.appKey, forHTTPHeaderField: "ST-App-Key")
            request.setValue(token, forHTTPHeaderField: "Authorization")
            guard let (data, res) = try? await sdk.session.data(for: request) else {
                return .failure(.RequestFailed(errorPreamble))
            }
            let response = res as! HTTPURLResponse
            if let err = APIError.isError(response) {
                return .failure(err)
            }
            return .success(data)
        }
        
        func delReq(endpoint: String) async -> APIError? {
            let components = prepComponents(endpoint: endpoint, params: nil)
            let errorPreamble = "DEL: " + components.path
            let tokenResult = await sdk.getAuthToken()
            var token: String!
            switch tokenResult {
            case .failure(let err): return .AuthError(err)
            case .success(let tok): token = tok
            }
            var request = URLRequest(url: components.url!)
            request.url = components.url!
            request.httpMethod = "DEL"
            request.setValue(sdk.appKey, forHTTPHeaderField: "ST-App-Key")
            request.setValue(token, forHTTPHeaderField: "Authorization")
            guard let (_, res) = try? await sdk.session.data(for: request) else {
                return .RequestFailed(errorPreamble)
            }
            let response = res as! HTTPURLResponse
            if let err = APIError.isError(response) {
                return err
            }
            return nil
        }
        
        func bodiedRawRequest(endpoint: String, body: Data, method: String) async -> Result<Data, APIError> {
            let components = prepComponents(endpoint: endpoint, params: nil)
            let errorPreamble = "\(method): \(components.path)"
            let tokenResult = await sdk.getAuthToken()
            var token: String!
            switch tokenResult {
            case .failure(let err): return .failure(.AuthError(err))
            case .success(let tok): token = tok
            }
            var request = URLRequest(url: components.url!)
            request.url = components.url!
            request.httpMethod = method
            request.setValue(sdk.appKey, forHTTPHeaderField: "ST-App-Key")
            request.setValue(token, forHTTPHeaderField: "Authorization")
            request.httpBody = body
            guard let (data, res) = try? await sdk.session.data(for: request) else {
                return .failure(.RequestFailed(errorPreamble))
            }
            let response = res as! HTTPURLResponse
            if let err = APIError.isError(response) {
                return .failure(err)
            }
            
            return .success(data)
        }
        
        func bodiedReq<Res: Codable>(_ type: Res.Type, endpoint: String, body: (any Codable), method: String) async -> Result<Res, APIError> {
            guard let encoded = try? sdk.encoder.encode(body) else {
                return .failure(.EncodingError(""))
            }
            let res = await bodiedRawRequest(endpoint: endpoint, body: encoded, method: method)
            switch res {
            case .success(let data):
                guard let decoded = try? sdk.decoder.decode(type.self, from: data) else {
                    return .failure(.DecodingError("\(method): \(endpoint) - Decoding Error"))
                }
                return .success(decoded)
            case .failure(let err): return .failure(err)
            }
        }
        func bodiedRawReqNoResponse(endpoint: String, body: Data, method: String) async -> APIError? {
            let components = prepComponents(endpoint: endpoint, params: nil)
            let errorPreamble = "\(method): \(components.path)"
            let tokenResult = await sdk.getAuthToken()
            var token: String!
            switch tokenResult {
            case .failure(let err): return .AuthError(err)
            case .success(let tok): token = tok
            }
            var request = URLRequest(url: components.url!)
            request.url = components.url!
            request.httpMethod = method
            request.setValue(sdk.appKey, forHTTPHeaderField: "ST-App-Key")
            request.setValue(token, forHTTPHeaderField: "Authorization")
            request.httpBody = body
            guard let (_, res) = try? await sdk.session.data(for: request) else {
                return .RequestFailed(errorPreamble)
            }
            let response = res as! HTTPURLResponse
            if let err = APIError.isError(response) {
                return err
            }
            return nil
        }
        func bodiedReqNoResponse<Req: Codable>(endpoint: String, body: Req, method: String) async -> APIError? {
            guard let encoded = try? sdk.encoder.encode(body) else {
                return .EncodingError("")
            }
            return await bodiedRawReqNoResponse(endpoint: endpoint, body: encoded, method: method)
        }
    }
}

public class APIType {
    
}

public extension APIs.APIType {
    var basePath: String {
        return "/\(apiName)/v2/tenant/\(tenant)"
    }
    var baseIntegrationPath: String {
        return "/\(apiName)/v2/tenant/\(tenant)"
    }
    func constructURL(basePath: String, endpointPath: String, queryParams: [URLQueryItem] = []) -> URL {
        var components = URLComponents(string: basePath + endpointPath)!
        guard !queryParams.isEmpty else { return components.url! }
        components.queryItems = queryParams
        return components.url!
    }
    var id: String { apiName }
}
