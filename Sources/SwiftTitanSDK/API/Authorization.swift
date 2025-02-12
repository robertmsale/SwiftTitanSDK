//
//  Authorization.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/2/25.
//

import Foundation

struct AccessTokenResponse: Codable {
    public var access_token: String
    public var expires_in: Int64
    public var token_type: String
    public var scope: String
}

public actor AuthManager {
    public static let authURL = URL(string: "https://auth.servicetitan.io/connect/token")!
    public static let authIntegrationURL = URL(string: "https://auth-integration.servicetitan.io/connect/token")!
    private var _latestTokenResponse: AccessTokenResponse
    private var _validUntil: Date
    private let _urlSession: URLSession
    public struct AuthError: Error {
        public enum ErrorKind: String, Sendable {
            case InvalidClient = "Invalid Client. Check ClientID and ClientSecret."
            case EmptyResponse = "Empty Response. Server responded with no data."
            case NonJsonResponse = "Non-JSON Response. Response could not be deserialized. No token or error message could be recovered."
            case PayloadCreationError = "Payload creation error. x-www-form-urlencoded request body may have contained data that could not be enterpreted as utf-8 encoded."
            case TaskCompletionError = "Task completion error. After requesting a token, an error occurred within the URLSession data task."
            case TokenDecodingError = "Token decoding error. Response was not decodable to AccessTokenResponse."
        }
        let errorKind: ErrorKind
        public var message: String {
            let preamble = "Authorization Error: "
            return preamble + errorKind.rawValue
        }
        static func checkResult(_ data: Data) -> AuthError? {
            guard let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) else {
                return AuthError(errorKind: .EmptyResponse)
            }
            guard let dictionary = jsonObject as? [String: Any?] else {
                return AuthError(errorKind: .NonJsonResponse)
            }
            if (dictionary["error"] as? String == "invalid_client") {
                return AuthError(errorKind: .InvalidClient)
            }
            return nil
        }
    }
    var integrationMode: Bool = false {
        didSet {
            _validUntil = Date(timeIntervalSince1970: 0)
        }
    }
    var authURL: URL {
        if integrationMode {
            return AuthManager.authIntegrationURL
        }
        return AuthManager.authURL
    }
    public init() {
        _urlSession = URLSession.init(configuration: .default)
        _urlSession.configuration.httpAdditionalHeaders = [
            "Content-Type": "application/x-www-form-urlencoded"
        ]
        _validUntil = Date(timeIntervalSince1970: 0)
        _latestTokenResponse = .init(access_token: "", expires_in: 0, token_type: "", scope: "")
    }
    private func getToken(_ url: URL, clientId: String, clientSecret: String) async -> Result<String, AuthError> {
        if Date().compare(_validUntil) == .orderedAscending {
            return .success(_latestTokenResponse.access_token)
        }
        let decoder = JSONDecoder()
        var components = URLComponents()
        components.queryItems = [
            .init(name: "grant_type", value: "client_credentials"),
            .init(name: "client_id", value: clientId),
            .init(name: "client_secret", value: clientSecret)
        ]
        guard let payloadString = components.string,
              let payloadStringWithoutQuestion = Optional(String(payloadString.suffix(payloadString.count-1))),
              let payload = payloadStringWithoutQuestion.data(using: .utf8) else {
            return .failure(.init(errorKind: .PayloadCreationError))
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = payload
        guard let (data, res) = try? await _urlSession.data(for: request) else {
            return .failure(.init(errorKind: .TaskCompletionError))
        }
        #if DEBUG
        // Populates autos for debugging. Not necessary in production.
        let testDataString = String(data: data, encoding: .utf8)
        let status = (res as! HTTPURLResponse).statusCode
        #endif
        guard let decoded = try? decoder.decode(AccessTokenResponse.self, from: data) else {
            if let foundReason = AuthError.checkResult(data) {
                return .failure(foundReason)
            }
            return .failure(.init(errorKind: .TokenDecodingError))
        }
        _latestTokenResponse = decoded
        _validUntil = Date(timeIntervalSinceNow: Double(_latestTokenResponse.expires_in) - 10.0)
        return .success(_latestTokenResponse.access_token)
    }
    public func getAuthToken(clientId: String, clientSecret: String) async -> Result<String, AuthError> {
        return await getToken(authURL, clientId: clientId, clientSecret: clientSecret)
    }
    public func setIntegrationMode(to: Bool) async {
        integrationMode = to
    }
}
