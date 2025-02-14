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
        case .success(_):
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
        case .success(_):
            return
        }
    }
    
    @Test func getPricebookCategories() async throws {
        let result = await sdk.pricebook.categoriesGetList(tenant: sdk.tenant)
        switch result {
        case .failure(let err): Issue.record(err)
        case .success(let data):
            print("\(data.data.first { $0.name == "HVAC" }?.id ?? -1)")
            return
        }
    }
    
    @Test func updatePricebookCategory() async throws {
        let idString = try #require(ProcessInfo.processInfo.environment["ST_TEST_UPDATE_PRICEBOOK_CATEGORY_ID"], .init(rawValue: environErr("ST_TEST_UPDATE_PRICEBOOK_CATEGORY_ID")))
        let id = try #require(Int64(idString), .init(rawValue: "ST_TEST_UPDATE_PRICEBOOK_CATEGORY_ID not parseable to Int64"))
        let description = try  #require(ProcessInfo.processInfo.environment["ST_TEST_UPDATE_PRICEBOOK_CATEGORY_DESC"], .init(rawValue: environErr("ST_TEST_UPDATE_PRICEBOOK_CATEGORY_DESC")))
        let result = await sdk.pricebook.categoriesGet(id: id, tenant: sdk.tenant)
        switch result {
        case .failure(let err): Issue.record(err)
        case .success(let data):
            let updateResult = await sdk.pricebook.categoriesUpdate(id: id, tenant: sdk.tenant, body: .init(
                name: data.name,
                active: data.active,
                description: description,
                position: data.position,
                image: data.image!,
                categoryType: data.categoryType,
                businessUnitIds: data.businessUnitIds ?? [],
                skuImages: data.skuImages ?? [],
                skuVideos: data.skuVideos ?? []
            ))
            switch updateResult {
            case .failure(let err): Issue.record(err)
            case .success(_):
                let finalCheck = await sdk.pricebook.categoriesGet(id: id, tenant: sdk.tenant)
                switch finalCheck {
                case .failure(let err): Issue.record(err)
                case .success(let updatedCategory):
                    #expect(updatedCategory.description == description)
                }
                return
            }
        }
    }
}
