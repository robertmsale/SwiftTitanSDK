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

actor AuthManager {
    public static let authURL = URL(string: "https://auth.servicetitan.io/connect/token")!
    public static let authIntegrationURL = URL(string: "https://auth-integration.servicetitan.io/connect/token")!
    private var _latestTokenResponse: AccessTokenResponse
    private var _validUntil: Date
    private let _urlSession: URLSession
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
    private func getToken(_ url: URL, clientId: String, clientSecret: String) async -> String? {
        if Date().compare(_validUntil) == .orderedAscending {
            return _latestTokenResponse.access_token
        }
        let decoder = JSONDecoder()
        let body = "grant_type=client_credentials&client_id=\(clientId)&client_secret=\(clientSecret)".data(using: .utf8)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        guard let (data, _) = try? await _urlSession.data(for: request),
              let decoded = try? decoder.decode(AccessTokenResponse.self, from: data) else {
            return nil
        }
        _latestTokenResponse = decoded
        _validUntil = Date(timeIntervalSinceNow: Double(_latestTokenResponse.expires_in) - 10.0)
        return _latestTokenResponse.access_token
    }
    public func getAuthToken(clientId: String, clientSecret: String) async -> String? {
        return await getToken(authURL, clientId: clientId, clientSecret: clientSecret)
    }
    public func setIntegrationMode(to: Bool) async {
        integrationMode = to
    }
}
