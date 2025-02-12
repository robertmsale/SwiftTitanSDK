//
//  Marketing.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct Marketing {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignCategoryResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var active: Bool
            
            public var type: CampaignCategoryType
            
            public var createdOn: Date
        }
        public enum CampaignCategoryType: String, CaseIterable, Identifiable, Codable {
            case Regular, GoogleHomeServices
            public var id: String { rawValue }
        }
        /// Default response when creating object with a new ID, or updating object by specified ID.
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ModificationResponse: Codable, Identifiable {
            /// The ID of created/updated object
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignCategoryUpdateRequest: Codable {
            
            public var name: String
            
            public var active: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignCategoryCreateRequest: Codable {
            
            public var name: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignCostResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var year: Int32
            
            public var month: Int32
            
            public var dailyCost: Double
            
            public var campaignId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateCampaignCostRequest: Codable {
            
            public var campaignId: Int64
            
            public var year: Int32
            
            public var month: Int32
            
            public var dailyCost: Double
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateCampaignCostRequest: Codable {
            
            public var dailyCost: Double
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var modifiedOn: Date
            
            public var createdOn: Date
            
            public var active: Bool
            
            public var category: CampaignResponseCategory?
            
            public var source: String?
            
            public var otherSource: String?
            
            public var businessUnit: String?
            
            public var medium: String?
            
            public var otherMedium: String?
            
            public var campaignPhoneNumbers: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignResponseCategory: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var active: Bool
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignUpsertRequest: Codable {
            
            public var name: String
            
            public var businessUnitId: Int64
            
            public var dnis: String?
            
            public var categoryId: Int64
            
            public var active: Bool
            
            public var source: String?
            
            public var medium: String?
            
            public var otherSource: String?
            
            public var otherMedium: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SuppressionResponse: Codable {
            
            public var email: String
            
            public var reason: SuppressionType?
        }
        public enum SuppressionType: String, CaseIterable, Identifiable, Codable {
            case Unsubscribe, Bounce, SpamReport, ManualUnsubscribe, NeverEmail
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct RemoveSuppressionsRequest: Codable {
            /// Email addresses to remove from the suppression list, max items: 1000
            public var emails: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AddSuppressionsRequest: Codable {
            /// Email addresses to add to the suppression list, max items: 1000
            public var emails: String
            
            public var reason: SuppressionType
        }
    }
}
public extension APIs {
    class Marketing: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "marketing")
        }
        /// Query Parameters for func campaignCategoriesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignCategoriesGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, CreatedOn, Name
            public var sort: String?
        }
        public func campaignCategoriesGetList(tenant: Int64, query: CampaignCategoriesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Marketing.CampaignCategoryResponse>, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/categories"
            return await getReq(Models.PaginatedResponse<Models.Marketing.CampaignCategoryResponse>.self, endpoint: endpoint, params: query)
        }
        public func campaignCategoriesCreate(tenant: Int64, body: Models.Marketing.CampaignCategoryCreateRequest) async -> Result<Models.Marketing.ModificationResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/categories"
            return await bodiedReq(Models.Marketing.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func campaignCategoriesGet(id: Int64, tenant: Int64) async -> Result<Models.Marketing.CampaignCategoryResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/categories/\(id)"
            return await getReq(Models.Marketing.CampaignCategoryResponse.self, endpoint: endpoint)
        }
        public func campaignCategoriesUpdate(id: Int64, tenant: Int64, body: Models.Marketing.CampaignCategoryUpdateRequest) async -> Result<Models.Marketing.ModificationResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/categories/\(id)"
            return await bodiedReq(Models.Marketing.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func campaignCostsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignCostsGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - int32. Year
            public var year: Int32?
            /// Format - int32. Month
            public var month: Int32?
            /// Format - int64. Campaign ID
            public var campaignId: Int64?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, Date (Year + Month)
            public var sort: String?
        }
        public func campaignCostsGetList(tenant: Int64, query: CampaignCostsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Marketing.CampaignCostResponse>, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/costs"
            return await getReq(Models.PaginatedResponse<Models.Marketing.CampaignCostResponse>.self, endpoint: endpoint, params: query)
        }
        public func campaignCostsCreate(tenant: Int64, body: Models.Marketing.CreateCampaignCostRequest) async -> Result<Models.Marketing.CampaignCostResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/costs"
            return await bodiedReq(Models.Marketing.CampaignCostResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func campaignCostsGet(id: Int64, tenant: Int64) async -> Result<Models.Marketing.CampaignCostResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/costs/\(id)"
            return await getReq(Models.Marketing.CampaignCostResponse.self, endpoint: endpoint)
        }
        public func campaignCostsUpdate(id: Int64, tenant: Int64, body: Models.Marketing.UpdateCampaignCostRequest) async -> Result<Models.Marketing.ModificationResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/costs/\(id)"
            return await bodiedReq(Models.Marketing.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func campaignsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignsGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filters records by name (case-insensitive "contains" operation)
            public var name: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Filters campaigns by phone number (as string).
            public var campaignPhoneNumber: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, Name, CreatedOn, ModifiedOn
            public var sort: String?
        }
        public func campaignsGetList(tenant: Int64, query: CampaignsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Marketing.CampaignResponse>, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/campaigns"
            return await getReq(Models.PaginatedResponse<Models.Marketing.CampaignResponse>.self, endpoint: endpoint, params: query)
        }
        public func campaignsCreate(tenant: Int64, body: Models.Marketing.CampaignUpsertRequest) async -> Result<Models.Marketing.CampaignResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/campaigns"
            return await bodiedReq(Models.Marketing.CampaignResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func campaignsGet(id: Int64, tenant: Int64) async -> Result<Models.Marketing.CampaignResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/campaigns/\(id)"
            return await getReq(Models.Marketing.CampaignResponse.self, endpoint: endpoint)
        }
        public func campaignsUpdate(id: Int64, tenant: Int64, body: Models.Marketing.CampaignUpsertRequest) async -> Result<Models.Marketing.CampaignResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/campaigns/\(id)"
            return await bodiedReq(Models.Marketing.CampaignResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func campaignsGetCosts
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignsGetCostsQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - int32.
            public var year: Int32?
            /// Format - int32.
            public var month: Int32?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, Date (Year + Month)
            public var sort: String?
        }
        public func campaignsGetCosts(id: Int64, tenant: Int64, query: CampaignsGetCostsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Marketing.CampaignCostResponse>, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/campaigns/\(id)/costs"
            return await getReq(Models.PaginatedResponse<Models.Marketing.CampaignCostResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func suppressionsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SuppressionsGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func suppressionsGetList(tenant: Int64, query: SuppressionsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Marketing.SuppressionResponse>, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/suppressions"
            return await getReq(Models.PaginatedResponse<Models.Marketing.SuppressionResponse>.self, endpoint: endpoint, params: query)
        }
        public func suppressionsGet(email: String, tenant: Int64) async -> Result<Models.Marketing.SuppressionResponse, APIError> {
            let endpoint = "/marketing/v2/tenant/\(tenant)/suppressions/\(email)"
            return await getReq(Models.Marketing.SuppressionResponse.self, endpoint: endpoint)
        }
        public func suppressionsRemove(tenant: Int64, body: Models.Marketing.RemoveSuppressionsRequest) async -> APIError? {
            let endpoint = "/marketing/v2/tenant/\(tenant)/suppressions/unsuppress"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        public func suppressionsAdd(tenant: Int64, body: Models.Marketing.AddSuppressionsRequest) async -> APIError? {
            let endpoint = "/marketing/v2/tenant/\(tenant)/suppressions/suppress"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
    }
}
