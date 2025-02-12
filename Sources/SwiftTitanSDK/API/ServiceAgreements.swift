//
//  ServiceAgreements.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
public extension Models {
    struct ServiceAgreements {
        
        public struct ExportServiceAgreementResponse: Codable, Identifiable {
            /// Service agreement ID
            public var id: Int64
            /// Service agreement name
            public var name: String
            /// When the service agreement was created
            public var createdOn: Date
            /// ID of the user that created this agreement
            public var createdById: Int64?
            /// When the service agreement was last modified
            public var modifiedOn: Date
            /// ID of the user that modified this agreement
            public var modifiedById: Int64?
            /// Data fields that were populated from the template
            public var templateFields: ServiceAgreementTemplateFieldsResponse
            /// Customer ID of the agreement
            public var customerId: Int64
            /// Business unit ID to which this agreement is assigned
            public var businessUnitId: Int64
            /// Current status of the agreement
            public var status: AgreementStatus
            /// Location IDs covered by the agreement
            public var locationIds: Int64
            /// The method used to create the agreement
            public var origin: AgreementOrigin
            /// Optional text summary of the agreement
            public var summary: String?
            /// Internal import ID label
            public var importId: String?
            /// Imported amount already billed for this agreement
            public var importedDeferredAmount: Double
            /// Imported amount of recognized revenue for this agreement
            public var importedRecognizedAmount: Double
            /// Duration of the agreement in months (can be absent when the agreement is still being built)
            public var durationMonths: Int32?
            /// Determines if the agreement automatically renews or expires on its end date
            public var autoRenew: Bool
            /// Indicates the next agreement ID that renews the current agreement (null means the agreement was not renewed)
            public var renewalAgreementId: Int64?
            /// The start date of the agreement (can be absent when the agreement is still being built)
            public var startDate: String?
            /// The end date of the agreement (can be absent when the agreement is still being built)
            public var endDate: String?
            /// The billing schedule of the agreement (can be absent when the agreement is still being built)
            public var billingSchedule: BillingScheduleType?
            /// ID of the payment terms of the agreement (can be absent when the agreement is still being built)
            public var paymentTermId: Int64?
            /// ID of the payment method of the agreement (can be absent when the agreement is still being built).
            /// Note there is a special hardcoded value of -1 that means "Cash or Check".
            public var paymentMethodId: Int64?
            /// The dollar amount of estimated travel cost for all visits (can be absent when the agreement is still being built)
            public var estimatedTravelCost: Double?
            /// The dollar amount of estimated labor cost for all visits (can be absent when the agreement is still being built)
            public var estimatedLaborCost: Double?
            /// The dollar amount of estimated material cost for all visits (can be absent when the agreement is still being built)
            public var estimatedMaterialCost: Double?
            /// The markup percentage applied to labor cost of the agreement (can be absent when the agreement is still being built)
            public var laborMarkupPercentage: Double?
            /// The markup percentage applied to material cost of the agreement (can be absent when the agreement is still being built)
            public var materialMarkupPercentage: Double?
            /// The dollar amount added to labor cost of the agreement
            public var laborSurcharge: Double
            /// The dollar amount added to material cost of the agreement
            public var materialSurcharge: Double
            /// The total price of the agreement (can be absent when the agreement is still being built)
            public var totalAgreementPrice: Double?
            /// The estimated gross margin in dollars for the agreement (can be absent when the agreement is still being built)
            public var estimatedGrossMarginAmount: Double?
            /// The estimated gross margin as a percentage of the Total Agreement Price (can be absent when the agreement is still being built)
            public var estimatedGrossMarginPercentage: Double?
            /// ID of a rate sheet (Client-Specific Pricing Rule) assigned to the service agreement
            public var rateSheetId: Int64?
            /// ID of the employee assigned to the agreement
            public var accountManagerId: Int64?
            /// Whether this agreement still exists, or was deleted already.
            public var active: Bool
        }
        
        public struct ServiceAgreementTemplateFieldsResponse: Codable {
            /// ID of the template originally used to create this service agreement.
            /// Note that the content of the original template may have changed since the agreement's creation.
            /// The template fields in this object represent the current state of the service agreement, as they were captured at the time of creation.
            public var originalTemplateId: Int64
            /// Revenue recognition mode to be used for a new service agreement
            public var revenueRecognitionMode: RevenueRecognitionMode
            /// General ledger account that will hold funds until recognition
            /// (this is only used for the Deferred revenue recognition)
            public var generalLedgerAccountId: Int64?
            /// How to resolve the difference with the customer when service agreement is cancelled
            /// (this is only used for the Deferred revenue recognition)
            public var invoiceCancellationMode: CancellationInvoiceMode?
            /// Used for both revenue recognition modes:
            /// when Immediate, the service will be displayed in customer-facing invoices;
            /// when Deferred, the service is tied to the general ledger account chosen for this agreement.
            public var billingServiceId: Int64
            /// Negative liability services draw money from liability account when services are delivered
            /// (this is only used for the Deferred revenue recognition)
            public var negativeLiabilityServiceId: Int64?
            /// Positive income services transfer money into the income account when services are delivered
            /// (this is only used for the Deferred revenue recognition)
            public var positiveIncomeServiceId: Int64?
            /// The default labor cost / hour to be used in the UI when adding service agreement visits
            public var defaultLaborCostPerHour: Double?
            /// The default extra travel cost / hour to be used in the UI when adding service agreement locations
            public var defaultExtraTravelCostPerHour: Double?
            /// The default percentage value of the labor markup to be used in the UI when creating a service agreement
            public var defaultLaborMarkupPercentage: Double?
            /// The default percentage value of the material markup to be used in the UI when creating a service agreement
            public var defaultMaterialMarkupPercentage: Double?
            /// The default labor surcharge amount to be used in the UI when creating a service agreement
            public var defaultLaborSurcharge: Double?
            /// The default material surcharge amount to be used in the UI when creating a service agreement
            public var defaultMaterialSurcharge: Double?
            /// The default rate sheet ID (Client-Specific Pricing Rule) to be used in the UI when creating a service agreement
            public var defaultRateSheetId: Int64?
            /// The ID of the marketing campaign to be used by default when booking jobs for service agreement visits
            public var defaultCampaignId: Int64?
        }
        public enum RevenueRecognitionMode: String, CaseIterable, Identifiable, Codable {
            case Immediate, Deferred, DeferredStraightLine
            public var id: String { rawValue }
        }
        public enum CancellationInvoiceMode: String, CaseIterable, Identifiable, Codable {
            case AskToCreateInvoice, AlwaysCreateInvoice, NeverCreateInvoice
            public var id: String { rawValue }
        }
        public enum AgreementStatus: String, CaseIterable, Identifiable, Codable {
            case Draft, Sent, Rejected, Accepted, Activated, Canceled, Expired, AutoRenew
            public var id: String { rawValue }
        }
        public enum AgreementOrigin: String, CaseIterable, Identifiable, Codable {
            case Initial, AutoRenew, ManualRenew
            public var id: String { rawValue }
        }
        public enum BillingScheduleType: String, CaseIterable, Identifiable, Codable {
            case Upfront, Monthly, EveryOtherMonth, Quarterly, Biannual, Annual, TimeOfService
            public var id: String { rawValue }
        }
        
        public struct ServiceAgreementResponse: Codable, Identifiable {
            /// Service agreement ID
            public var id: Int64
            /// Service agreement name
            public var name: String
            /// When the service agreement was created
            public var createdOn: Date
            /// ID of the user that created this agreement
            public var createdById: Int64?
            /// When the service agreement was last modified
            public var modifiedOn: Date
            /// ID of the user that modified this agreement
            public var modifiedById: Int64?
            /// Data fields that were populated from the template
            public var templateFields: ServiceAgreementTemplateFieldsResponse
            /// Customer ID of the agreement
            public var customerId: Int64
            /// Business unit ID to which this agreement is assigned
            public var businessUnitId: Int64
            /// Current status of the agreement
            public var status: AgreementStatus
            /// Location IDs covered by the agreement
            public var locationIds: Int64
            /// The method used to create the agreement
            public var origin: AgreementOrigin
            /// Optional text summary of the agreement
            public var summary: String?
            /// Internal import ID label
            public var importId: String?
            /// Imported amount already billed for this agreement
            public var importedDeferredAmount: Double
            /// Imported amount of recognized revenue for this agreement
            public var importedRecognizedAmount: Double
            /// Duration of the agreement in months (can be absent when the agreement is still being built)
            public var durationMonths: Int32?
            /// Determines if the agreement automatically renews or expires on its end date
            public var autoRenew: Bool
            /// Indicates the next agreement ID that renews the current agreement (null means the agreement was not renewed)
            public var renewalAgreementId: Int64?
            /// The start date of the agreement (can be absent when the agreement is still being built)
            public var startDate: String?
            /// The end date of the agreement (can be absent when the agreement is still being built)
            public var endDate: String?
            /// The billing schedule of the agreement (can be absent when the agreement is still being built)
            public var billingSchedule: BillingScheduleType?
            /// ID of the payment terms of the agreement (can be absent when the agreement is still being built)
            public var paymentTermId: Int64?
            /// ID of the payment method of the agreement (can be absent when the agreement is still being built).
            /// Note there is a special hardcoded value of -1 that means "Cash or Check".
            public var paymentMethodId: Int64?
            /// The dollar amount of estimated travel cost for all visits (can be absent when the agreement is still being built)
            public var estimatedTravelCost: Double?
            /// The dollar amount of estimated labor cost for all visits (can be absent when the agreement is still being built)
            public var estimatedLaborCost: Double?
            /// The dollar amount of estimated material cost for all visits (can be absent when the agreement is still being built)
            public var estimatedMaterialCost: Double?
            /// The markup percentage applied to labor cost of the agreement (can be absent when the agreement is still being built)
            public var laborMarkupPercentage: Double?
            /// The markup percentage applied to material cost of the agreement (can be absent when the agreement is still being built)
            public var materialMarkupPercentage: Double?
            /// The dollar amount added to labor cost of the agreement
            public var laborSurcharge: Double
            /// The dollar amount added to material cost of the agreement
            public var materialSurcharge: Double
            /// The total price of the agreement (can be absent when the agreement is still being built)
            public var totalAgreementPrice: Double?
            /// The estimated gross margin in dollars for the agreement (can be absent when the agreement is still being built)
            public var estimatedGrossMarginAmount: Double?
            /// The estimated gross margin as a percentage of the Total Agreement Price (can be absent when the agreement is still being built)
            public var estimatedGrossMarginPercentage: Double?
            /// ID of a rate sheet (Client-Specific Pricing Rule) assigned to the service agreement
            public var rateSheetId: Int64?
            /// ID of the employee assigned to the agreement
            public var accountManagerId: Int64?
        }
    }
}
public extension APIs {
    class ServiceAgreements: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "service-agreements")
        }
        /// Query Parameters for func exportServiceAgreements
        public struct ExportServiceAgreementsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportServiceAgreements(tenant: Int64, query: ExportServiceAgreementsQuery? = nil) async -> Result<Models.ServiceAgreements.ExportServiceAgreementResponse, APIError> {
            let endpoint = "/service-agreements/v2/tenant/\(tenant)/export/service-agreements"
            return await getReq(Models.ServiceAgreements.ExportServiceAgreementResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func serviceAgreementsGetList
        public struct ServiceAgreementsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filters by customer IDs
            public var customerIds: String?
            /// Filters by business unit IDs
            public var businessUnitIds: String?
            /// Filters by service agreement status\
            /// Values: [Draft, Sent, Rejected, Accepted, Activated, Canceled, Expired, AutoRenew]
            public var status: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, Name, CreatedOn, ModifiedOn, StartDate, EndDate
            public var sort: String?
        }
        public func serviceAgreementsGetList(tenant: Int64, query: ServiceAgreementsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.ServiceAgreements.ServiceAgreementResponse>, APIError> {
            let endpoint = "/service-agreements/v2/tenant/\(tenant)/service-agreements"
            return await getReq(Models.PaginatedResponse<Models.ServiceAgreements.ServiceAgreementResponse>.self, endpoint: endpoint, params: query)
        }
        public func serviceAgreementsGet(id: Int64, tenant: Int64) async -> Result<Models.ServiceAgreements.ServiceAgreementResponse, APIError> {
            let endpoint = "/service-agreements/v2/tenant/\(tenant)/service-agreements/\(id)"
            return await getReq(Models.ServiceAgreements.ServiceAgreementResponse.self, endpoint: endpoint)
        }
    }
}
