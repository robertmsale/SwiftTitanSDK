import Testing
import Foundation
import SwiftTitanSDK

func environErr(_ name: String) -> String {
    return "Environment not loaded: \(name) is missing. Make sure a .env file with this variable is present in the root project folder."
}

actor SwiftTitanSDKTests {
    var sdk: SwiftTitanSDK
    init() async throws {
        EnvLoader.load()
        let tenant = try #require(EnvLoader.tenant, .init(rawValue: environErr("ST_TENANT")))
        let appKey = try #require(EnvLoader.appKey, .init(rawValue: environErr("ST_APPKEY")))
        let clientId = try #require(EnvLoader.clientId, .init(rawValue: environErr("ST_CLIENTID")))
        let clientSecret = try #require(EnvLoader.clientSecret, .init(rawValue: environErr("ST_CLIENTSECRET")))
        sdk = SwiftTitanSDK(appKey: appKey, tenant: Int64(tenant)!, clientId: clientId, clientSecret: clientSecret, requestBuilder: {return URLRequest()})
    }

    @Test func environment() async throws {
    }
}
