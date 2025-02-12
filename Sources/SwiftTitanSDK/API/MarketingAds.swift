//
//  MarketingAds.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
public extension Models {
    struct MarketingAds {
        
        public struct GetAttributedLeadsResponse: Codable {
            
            public var dateTime: Date
            
            public var leadType: LeadType
            
            public var attribution: Attribution
            
            public var job: Job
            
            public var customer: Customer
            
            public var call: Call
            
            public var leadForm: LeadForm
            
            public var booking: Booking
        }
        public enum LeadType: String, CaseIterable, Identifiable, Codable {
            case Call, WebBooking, WebLeadForm, ManualJob
            public var id: String { rawValue }
        }
        
        public struct Attribution: Codable {
            
            public var utmSource: String
            
            public var utmMedium: String
            
            public var utmCampaign: String
            
            public var landingPageUrl: String
            
            public var referrerUrl: String
            
            public var clickId: String
            
            public var stCampaignId: Int64?
            
            public var originalCampaign: String
            
            public var attributionOverwriteType: EntityType?
            
            public var attributionOverwriteId: Int64?
            
            public var overwrittenBookingJobId: Int64?
            
            public var adGroupId: String
            
            public var adGroupName: String
            
            public var keywordId: String
            
            public var keywordName: String
        }
        public enum EntityType: String, CaseIterable, Identifiable, Codable {
            case Call, Booking, Lead
            public var id: String { rawValue }
        }
        
        public struct Job: Codable {
            
            public var id: Int64?
            
            public var name: String
        }
        
        public struct Customer: Codable {
            
            public var id: Int64?
            
            public var name: String
        }
        
        public struct Call: Codable {
            
            public var duration: String
            
            public var id: Int64?
            
            public var type: String
            
            public var source: String
            
            public var callerNumber: String
            
            public var trackingNumber: String
            
            public var excusedReason: String
        }
        
        public struct LeadForm: Codable {
            
            public var leadNumber: Int64?
            
            public var leadStatus: String
            
            public var notes: String
        }
        
        public struct Booking: Codable {
            
            public var id: Int64?
        }
        
        public struct CapacityAwarenessWarningQueryResult: Codable {
            
            public var tenantId: Int64
            
            public var tenantName: String
            
            public var totalCount: Int32
            
            public var data: CapacityAwarenessWarning
        }
        
        public struct CapacityAwarenessWarning: Codable {
            
            public var campaignName: String
            
            public var warningType: String
            
            public var businessUnits: String
            
            public var lookaheadWindow: Int32
            
            public var thresholdValue: Int32
        }
        
        public struct CreateExternalCallAttributionRequest: Codable {
            /// The web session that the entity should be attributed to
            public var webSessionData: WebSessionData
            /// The external call.
            public var externalCallData: ExternalCallData
        }
        /// Data from the web session used by the attribution system to determine the marketing campaign that
        /// led the user to this particular web session.
        public struct WebSessionData: Codable {
            /// The url of the web page that the user first landed on
            public var landingPageUrl: String
            /// The url of the web page that referred to the website
            public var referrerUrl: String
            /// Google Click Identifier
            public var gclid: String?
            /// Facebook Click Identifier
            public var fbclid: String?
            /// Microsoft Click ID
            public var msclkid: String?
            /// UTM source
            public var utmSource: String?
            /// UTM medium
            public var utmMedium: String?
            /// UTM campaign
            public var utmCampaign: String?
            /// UTM ad group
            public var utmAdgroup: String?
            /// UTM term
            public var utmTerm: String?
            /// UTM content
            public var utmContent: String?
            /// An id used by Google Analytics to track unique visitors
            public var googleAnalyticsClientId: String?
        }
        
        public struct ExternalCallData: Codable {
            /// The phone number of the customer
            public var customerPhoneNumber: String
            /// The ServiceTitan phone number that the external call tracking service will forward to
            public var forwardingPhoneNumber: String
            /// The tracking phone number that the external call tracking service will display to the customer
            public var trackingPhoneNumber: String
            /// Call start time in Utc
            public var callStartedOnUtc: Date
        }
        
        public struct GetPerformanceResponse: Codable {
            
            public var campaign: Campaign
            
            public var adGroup: AdGroup
            
            public var keyword: Keyword
            
            public var digitalStats: DigitalStats
            
            public var leadStats: LeadStats
            
            public var returnOnInvestment: Double?
        }
        
        public struct Campaign: Codable {
            
            public var id: Int64?
            
            public var name: String
            
            public var category: String
            
            public var launchDate: String
            
            public var status: Status
        }
        public enum Status: String, CaseIterable, Identifiable, Codable {
            case None, Live, Stopped
            public var id: String { rawValue }
        }
        
        public struct AdGroup: Codable, Identifiable {
            
            public var id: String
            
            public var name: String
            
            public var status: Status?
        }
        
        public struct Keyword: Codable, Identifiable {
            
            public var id: String
            
            public var name: String
            
            public var status: Status?
        }
        
        public struct DigitalStats: Codable {
            
            public var impressionShare: Double?
            
            public var impressions: Int64
            
            public var clicks: Int64
            
            public var averageCPC: Double
            
            public var conversions: Int64
            
            public var allConversions: Double?
            
            public var cost: Double
            
            public var clickRate: Double?
            
            public var costPerConversion: Double?
            
            public var conversionRate: Double?
        }
        
        public struct LeadStats: Codable {
            
            public var leads: Int32
            
            public var leadCalls: Int32
            
            public var onlineBooking: Int32
            
            public var manualBooking: Int32
            
            public var bookedJobs: Int32
            
            public var ranJobs: Int32
            
            public var soldJobs: Int32
            
            public var revenue: Double
            
            public var bookingRate: Double?
            
            public var avgTicket: Double?
        }
        public enum PerformanceSegmentationType: String, CaseIterable, Identifiable, Codable {
            case Campaign, AdGroup, Keyword
            public var id: String { rawValue }
        }
        
        public struct CreateScheduledJobAttributionRequest: Codable {
            /// The web session that the entity should be attributed to
            public var webSessionData: WebSessionData
            /// The id of the booking entity in ServiceTitan.
            public var jobId: Int64
        }
        
        public struct CreateWebBookingAttributionRequest: Codable {
            /// The web session that the entity should be attributed to
            public var webSessionData: WebSessionData
            /// The id of the booking entity in ServiceTitan.
            public var bookingId: Int64
        }
        
        public struct CreateWebLeadFormAttributionRequest: Codable {
            /// The web session that the entity should be attributed to
            public var webSessionData: WebSessionData
            /// The id of the lead entity (captured from a web form) in ServiceTitan.
            public var leadId: Int64
        }
    }
}
public extension APIs {
    class MarketingAds: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "marketingads")
        }
        /// Query Parameters for func attributedLeadsGet
        public struct AttributedLeadsGetQuery: URLQueryConvertible {
            /// Format - date-time (as date-time in RFC3339). Gets or sets the start date and time in UTC for the filtering period.
            public var fromUtc: Date
            /// Format - date-time (as date-time in RFC3339). Gets or sets the end date and time in UTC for the filtering period.
            public var toUtc: Date
            /// Gets or sets the type of lead for filtering purposes. Possible values are:
            ///
            /// LeadType.Call
            /// LeadType.WebBooking
            /// LeadType.WebLeadForm
            /// LeadType.ManualJob
            ///
            /// If null, data for all lead types is returned.\
            /// Values: [Call, WebBooking, WebLeadForm, ManualJob]
            public var leadType: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func attributedLeadsGet(tenant: Int64, query: AttributedLeadsGetQuery? = nil) async -> Result<Models.PaginatedResponse<Models.MarketingAds.GetAttributedLeadsResponse>, APIError> {
            let endpoint = "/marketingads/v2/tenant/\(tenant)/attributed-leads"
            return await getReq(Models.PaginatedResponse<Models.MarketingAds.GetAttributedLeadsResponse>.self, endpoint: endpoint, params: query)
        }
        public func capacityAwarenessWarningGet(tenant: Int64) async -> Result<Models.MarketingAds.CapacityAwarenessWarningQueryResult, APIError> {
            let endpoint = "/marketingads/v2/tenant/\(tenant)/capacity-warnings"
            return await getReq(Models.MarketingAds.CapacityAwarenessWarningQueryResult.self, endpoint: endpoint)
        }
        public func externalCallAttributionsCreate(tenant: Int64, body: Models.MarketingAds.CreateExternalCallAttributionRequest) async -> APIError? {
            let endpoint = "/marketingads/v2/tenant/\(tenant)/external-call-attributions"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func performanceGet
        public struct PerformanceGetQuery: URLQueryConvertible {
            /// Format - date-time (as date-time in RFC3339). Gets or sets the start date and time in UTC for the filtering period.
            public var fromUtc: Date
            /// Format - date-time (as date-time in RFC3339). Gets or sets the end date and time in UTC for the filtering period.
            public var toUtc: Date
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func performanceGet(tenant: Int64, query: PerformanceGetQuery? = nil) async -> Result<Models.PaginatedResponse<Models.MarketingAds.GetPerformanceResponse>, APIError> {
            let endpoint = "/marketingads/v2/tenant/\(tenant)/performance"
            return await getReq(Models.PaginatedResponse<Models.MarketingAds.GetPerformanceResponse>.self, endpoint: endpoint, params: query)
        }
        public func scheduledJobAttributionsCreate(tenant: Int64, body: Models.MarketingAds.CreateScheduledJobAttributionRequest) async -> APIError? {
            let endpoint = "/marketingads/v2/tenant/\(tenant)/job-attributions"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        public func webBookingAttributionsCreate(tenant: Int64, body: Models.MarketingAds.CreateWebBookingAttributionRequest) async -> APIError? {
            let endpoint = "/marketingads/v2/tenant/\(tenant)/web-booking-attributions"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        public func webLeadFormAttributionsCreate(tenant: Int64, body: Models.MarketingAds.CreateWebLeadFormAttributionRequest) async -> APIError? {
            let endpoint = "/marketingads/v2/tenant/\(tenant)/web-lead-form-attributions"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
    }
}
