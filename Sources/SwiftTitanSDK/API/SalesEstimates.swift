//
//  SalesEstimates.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct SalesEstimates {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EstimateResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var jobId: Int64?
            
            public var projectId: Int64?
            
            public var locationId: Int64?
            
            public var customerId: Int64?
            
            public var name: String?
            
            public var jobNumber: String?
            
            public var status: EstimateStatusModel?
            
            public var reviewStatus: EstimateReviewStatus
            
            public var summary: String?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
            
            public var soldOn: Date?
            
            public var soldBy: Int64?
            
            public var active: Bool
            
            public var items: EstimateItemResponse?
            
            public var externalLinks: ExternalLinkResponse?
            
            public var subtotal: Double
            
            public var tax: Double
            
            public var businessUnitId: Int64?
            
            public var businessUnitName: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EstimateStatusModel: Codable {
            
            public var value: Int32
            
            public var name: String
        }
        public enum EstimateReviewStatus: String, CaseIterable, Identifiable, Codable {
            case None, NeedsApproval, Approved, NotApproved
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EstimateItemResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var sku: SkuModel
            
            public var skuAccount: String
            
            public var description: String
            
            public var membershipTypeId: Int64?
            
            public var qty: Double
            
            public var unitRate: Double
            
            public var total: Double
            
            public var unitCost: Double
            
            public var totalCost: Double
            
            public var itemGroupName: String
            
            public var itemGroupRootId: Int64?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
            
            public var chargeable: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var displayName: String
            
            public var type: String
            
            public var soldHours: Double
            
            public var generalLedgerAccountId: Int64
            
            public var generalLedgerAccountName: String
            
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalLinkResponse: Codable {
            
            public var name: String
            
            public var url: String
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateEstimateRequest: Codable {
            
            public var name: String?
            
            public var summary: String?
            
            public var tax: Double?
            
            public var status: EstimateStatus?
            
            public var reviewStatus: EstimateReviewStatus?
            
            public var soldBy: Int64?
            
            public var items: EstimateItemCreateUpdateRequest?
            
            public var externalLinks: ExternalLinkInModel?
            
            public var useDefaultProjectLabels: Bool?
            
            public var jobId: Int64?
            
            public var projectId: Int64?
            
            public var locationId: Int64?
        }
        public enum EstimateStatus: String, CaseIterable, Identifiable, Codable {
            case Open, Sold, Dismissed
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EstimateItemCreateUpdateRequest: Codable {
            
            public var id: Int64?
            
            public var skuId: Int64?
            
            public var skuName: String?
            
            public var parentItemId: Int64?
            
            public var description: String?
            
            public var isAddOn: Bool?
            
            public var quantity: Double?
            
            public var unitPrice: Double?
            
            public var skipUpdatingMembershipPrices: Bool?
            
            public var itemGroupName: String?
            
            public var itemGroupRootId: Int64?
            
            public var chargeable: Bool?
            
            public var useDefaultProjectLabels: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalLinkInModel: Codable {
            
            public var name: String?
            
            public var url: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateEstimateRequest: Codable {
            
            public var name: String?
            
            public var summary: String?
            
            public var tax: Double?
            
            public var status: EstimateStatus?
            
            public var reviewStatus: EstimateReviewStatus?
            
            public var soldBy: Int64?
            
            public var items: EstimateItemCreateUpdateRequest?
            
            public var externalLinks: ExternalLinkInModel?
            
            public var useDefaultProjectLabels: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SellRequest: Codable {
            
            public var soldBy: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EstimateItemUpdateResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var sku: SkuModel
            
            public var skuAccount: String
            
            public var description: String
            
            public var membershipTypeId: Int64?
            
            public var qty: Double
            
            public var unitRate: Double
            
            public var total: Double
            
            public var unitCost: Double
            
            public var totalCost: Double
            
            public var itemGroupName: String
            
            public var itemGroupRootId: Int64?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
            
            public var chargeable: Bool?
            
            public var estimateId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportEstimatesResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var jobId: Int64?
            
            public var projectId: Int64?
            
            public var locationId: Int64?
            
            public var customerId: Int64?
            
            public var name: String?
            
            public var jobNumber: String?
            
            public var status: EstimateStatusModel?
            
            public var reviewStatus: EstimateReviewStatus
            
            public var summary: String?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
            
            public var soldOn: Date?
            
            public var soldBy: Int64?
            
            public var active: Bool
            
            public var items: EstimateItemResponse?
            
            public var externalLinks: ExternalLinkResponse?
            
            public var subtotal: Double
            
            public var tax: Double
            
            public var businessUnitId: Int64?
            
            public var businessUnitName: String?
        }
    }
}
public extension APIs {
    class SalesEstimates: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "sales")
        }
        public func estimatesGet(id: Int64, tenant: Int64) async -> Result<Models.SalesEstimates.EstimateResponse, APIError> {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates/\(id)"
            return await getReq(Models.SalesEstimates.EstimateResponse.self, endpoint: endpoint)
        }
        public func estimatesUpdate(id: Int64, tenant: Int64, body: Models.SalesEstimates.UpdateEstimateRequest) async -> Result<Models.SalesEstimates.EstimateResponse, APIError> {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates/\(id)"
            return await bodiedReq(Models.SalesEstimates.EstimateResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        /// Query Parameters for func estimatesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EstimatesGetListQuery: URLQueryConvertible {
            /// Format - int64.
            public var jobId: Int64?
            /// Format - int64.
            public var projectId: Int64?
            public var jobNumber: String?
            /// Format - decimal.
            public var totalGreater: Double?
            /// Format - decimal.
            public var totalLess: Double?
            /// Format - int64.
            public var soldById: Int64?
            /// Format - int64.
            public var soldByEmployeeId: Int64?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339).
            public var soldAfter: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var soldBefore: Date?
            public var status: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            public var orderBy: String?
            public var orderByDirection: String?
            /// Format - date-time (as date-time in RFC3339).
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - int64.
            public var locationId: Int64?
        }
        public func estimatesGetList(tenant: Int64, query: EstimatesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.SalesEstimates.EstimateResponse>, APIError> {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates"
            return await getReq(Models.PaginatedResponse<Models.SalesEstimates.EstimateResponse>.self, endpoint: endpoint, params: query)
        }
        public func estimatesCreate(tenant: Int64, body: Models.SalesEstimates.CreateEstimateRequest) async -> Result<Models.SalesEstimates.EstimateResponse, APIError> {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates"
            return await bodiedReq(Models.SalesEstimates.EstimateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func estimatesGetItems
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EstimatesGetItemsQuery: URLQueryConvertible {
            /// Format - int64.
            public var estimateId: Int64?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func estimatesGetItems(tenant: Int64, query: EstimatesGetItemsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.SalesEstimates.EstimateItemResponse>, APIError> {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates/items"
            return await getReq(Models.PaginatedResponse<Models.SalesEstimates.EstimateItemResponse>.self, endpoint: endpoint, params: query)
        }
        public func estimatesSell(id: Int64, tenant: Int64, body: Models.SalesEstimates.SellRequest) async -> Result<Models.SalesEstimates.EstimateResponse, APIError> {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates/\(id)/sell"
            return await bodiedReq(Models.SalesEstimates.EstimateResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func estimatesUnsell(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates/\(id)/unsell"
            return await bodiedRawReqNoResponse(endpoint: endpoint, body: Data(), method: "PUT")
        }
        public func estimatesDismiss(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates/\(id)/dismiss"
            return await bodiedRawReqNoResponse(endpoint: endpoint, body: Data(), method: "PUT")
        }
        public func estimatesPutItem(id: Int64, tenant: Int64, body: Models.SalesEstimates.EstimateItemCreateUpdateRequest) async -> Result<Models.SalesEstimates.EstimateItemUpdateResponse, APIError> {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates/\(id)/items"
            return await bodiedReq(Models.SalesEstimates.EstimateItemUpdateResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func estimatesDeleteItem(id: Int64, itemId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates/\(id)/items/\(itemId)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func estimatesExportEstimates
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EstimatesExportEstimatesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func estimatesExportEstimates(tenant: Int64, query: EstimatesExportEstimatesQuery? = nil) async -> Result<Models.SalesEstimates.ExportEstimatesResponse, APIError> {
            let endpoint = "/sales/v2/tenant/\(tenant)/estimates/export"
            return await getReq(Models.SalesEstimates.ExportEstimatesResponse.self, endpoint: endpoint, params: query)
        }
    }
}
