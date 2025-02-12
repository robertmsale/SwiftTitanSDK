import Testing
import Foundation
import SwiftTitanSDK

func environErr(_ name: String) -> String {
    return "Environment not loaded: \(name) is missing. Make sure a .env file with this variable is present in the root project folder."
}

class SwiftTitanSDKTests {
    var sdk: SwiftTitanSDK
    init() async throws {
        EnvLoader.load()
        let tenant = try #require(EnvLoader.tenant, .init(rawValue: environErr("ST_TENANT")))
        let appKey = try #require(EnvLoader.appKey, .init(rawValue: environErr("ST_APPKEY")))
        let clientId = try #require(EnvLoader.clientId, .init(rawValue: environErr("ST_CLIENTID")))
        let clientSecret = try #require(EnvLoader.clientSecret, .init(rawValue: environErr("ST_CLIENTSECRET")))
        sdk = SwiftTitanSDK(appKey: appKey, tenant: Int64(tenant)!, clientId: clientId, clientSecret: clientSecret)
    }

    @Test func auth() async throws {
        let mysteryToken = await sdk.getAuthToken()
        switch mysteryToken {
        case .failure(let err): Issue.record(err, .init(rawValue: err.message))
        case .success(let token): #expect(!token.isEmpty)
        }
    }
    
    @Test func getAPCredits() async throws {
        let result = await sdk.accounting.apCreditsGetList(tenant: sdk.tenant)
        switch result {
        case .failure(let err): Issue.record(err)
        case .success(let data):
            return
        }
        var q = APIs.Accounting.ApCreditsGetListQuery(ids: "")
        q.createdBefore = Date(timeIntervalSince1970: 0)
        q.createdOnOrAfter = Date(timeIntervalSince1970: 0)
        q.includeTotal = false
        q.pageSize = 12
        
        let resultFromQuery = await sdk.accounting.apCreditsGetList(
            tenant: sdk.tenant,
            query: q
        )
        switch resultFromQuery {
        case .failure(let err): Issue.record(err)
        case .success(let data):
            return
        }
    }
}
