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
        
        func getReq<T: Codable, Query: URLQueryConvertible>(_ type: T.Type, endpoint: String, params: Query?) async -> Result<T, APIError> {
            var components = URLComponents()
            components.scheme = "https"
            components.host = sdk.host
            components.path = endpoint
            let errorPreamble = "GET: " + components.path
            if let queryItems = try? params?.toQueryItems() {
                components.queryItems = queryItems
            }
            let token = await sdk.getAuthToken()
            var request = sdk.requestBuilder()
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
            guard let decoded = try? sdk.decoder.decode(type.self, from: data) else {
                return .failure(.DecodingError(errorPreamble))
            }
            return .success(decoded)
        }
        func getRawReq<Query: URLQueryConvertible>(endpoint: String, params: Query?) async -> Result<Data, APIError> {
            var components = URLComponents()
            components.scheme = "https"
            components.host = sdk.host
            components.path = endpoint
            let errorPreamble = "GET: " + components.path
            if let queryItems = try? params?.toQueryItems() {
                components.queryItems = queryItems
            }
            let token = await sdk.getAuthToken()
            var request = sdk.requestBuilder()
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
        func getReq<T: Codable>(_ type: T.Type, endpoint: String) async -> Result<T, APIError> {
            var components = URLComponents()
            components.scheme = "https"
            components.host = sdk.host
            components.path = endpoint
            let errorPreamble = "GET: " + components.path
            let token = await sdk.getAuthToken()
            var request = sdk.requestBuilder()
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
            guard let decoded = try? sdk.decoder.decode(type.self, from: data) else {
                return .failure(.DecodingError(errorPreamble))
            }
            return .success(decoded)
        }
        
        func delReq(endpoint: String) async -> APIError? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = sdk.host
            components.path = endpoint
            let errorPreamble = "DEL: " + components.path
            let token = await sdk.getAuthToken()
            var request = sdk.requestBuilder()
            request.url = components.url!
            request.httpMethod = "DEL"
            request.setValue(sdk.appKey, forHTTPHeaderField: "ST-App-Key")
            request.setValue(token, forHTTPHeaderField: "Authorization")
            guard let (data, res) = try? await sdk.session.data(for: request) else {
                return .RequestFailed(errorPreamble)
            }
            let response = res as! HTTPURLResponse
            if let err = APIError.isError(response) {
                return err
            }
            return nil
        }
        
        func bodiedRawRequest<Res: Codable>(_ type: Res.Type, endpoint: String, body: Data, method: String) async -> Result<Res, APIError> {
            var components = URLComponents()
            components.scheme = "https"
            components.host = sdk.host
            components.path = endpoint
            let errorPreamble = "\(method): \(components.path)"
            let token = await sdk.getAuthToken()
            var request = sdk.requestBuilder()
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
            guard let decoded = try? sdk.decoder.decode(type.self, from: data) else {
                return .failure(.DecodingError(errorPreamble))
            }
            return .success(decoded)
        }
        
        func bodiedReq<Req: Codable, Res: Codable>(_ type: Res.Type, endpoint: String, body: Req, method: String) async -> Result<Res, APIError> {
            guard let encoded = try? sdk.encoder.encode(body) else {
                return .failure(.EncodingError(""))
            }
            return await bodiedRawRequest(type.self, endpoint: endpoint, body: encoded, method: method)
        }
        func bodiedRawReqNoResponse(endpoint: String, body: Data, method: String) async -> APIError? {
            var components = URLComponents()
            components.scheme = "https"
            components.host = sdk.host
            components.path = endpoint
            let errorPreamble = "\(method): \(components.path)"
            let token = await sdk.getAuthToken()
            var request = sdk.requestBuilder()
            request.url = components.url!
            request.httpMethod = method
            request.setValue(sdk.appKey, forHTTPHeaderField: "ST-App-Key")
            request.setValue(token, forHTTPHeaderField: "Authorization")
            request.httpBody = body
            guard let (data, res) = try? await sdk.session.data(for: request) else {
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
