//
//  SchedulingPro.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
public extension Models {
    struct SchedulingPro {
        
        public struct SchedulerResponse: Codable, Identifiable {
            /// Scheduler ID
            public var id: String
            /// Scheduler name
            public var name: String
            /// Company Name
            public var companyName: String
            /// When this scheduler was created
            public var createdOn: Date
            /// When this scheduler was last modified
            public var modifiedOn: Date
            /// Scheduler Status
            public var schedulerStatus: String
            /// Scheduler Data API Key used for embedding the Scheduler
            public var dataApiKey: String
            /// Denotes if this is the default scheduler
            public var isDefault: Bool
        }
        
        public struct SchedulerSessionResponse: Codable, Identifiable {
            /// Session ID
            public var id: String
            /// When this session was created
            public var createdOn: Date
            /// When this session was last modified
            public var modifiedOn: Date
            /// When the customer last interacted with the session
            public var lastCheckinDate: Date
            /// The outcome of the session
            public var sessionOutcome: String?
            /// Job ID if a job was created from this session
            public var jobId: Int64?
            /// Booking ID if a booking was created from this session
            public var bookingId: Int64?
            /// Timeslot start
            public var timeslotStart: Date?
            /// Timeslot end
            public var timeslotEnd: Date?
            /// Category of the job
            public var category: String?
            /// Job type ID
            public var jobTypeId: Int64?
            /// Business unit ID
            public var businessUnitId: Int64?
            /// Customer information
            public var customer: Customer
            /// Zone ID
            public var zoneId: Int64?
            /// Customer Responses
            public var customerResponses: String?
            /// Customer customer
            public var notes: String?
            /// Source tracking information
            public var sourceTracking: SourceTracking
        }
        
        public struct Customer: Codable {
            /// Whether this is a new customer
            public var isNewCustomer: Bool
            /// Customer ID
            public var id: Int64?
            /// Customer first name
            public var firstName: String?
            /// Customer last name
            public var lastName: String?
            /// Customer email
            public var email: String?
            /// Customer phone
            public var phone: String?
            /// Whether this is a new Location
            public var isNewLocation: Bool
            /// Customer Address Information
            public var address: Address
        }
        
        public struct Address: Codable {
            /// Street
            public var street: String?
            /// Unit
            public var unit: String?
            /// City
            public var city: String?
            /// State
            public var state: String?
            /// Zip
            public var zip: String?
            /// Country
            public var country: String?
        }
        
        public struct SourceTracking: Codable {
            /// Whether the session came from Reserve with Google
            public var isRWGSession: Bool?
            /// Campaign ID
            public var campaignId: String?
            /// Campaign Name
            public var landingPageUrl: String?
            /// Google Click ID
            public var gclid: String?
            /// Facebook Click ID
            public var fbclid: String?
            /// Microsoft Click ID
            public var msclkid: String?
            /// UTM Source
            public var utmSource: String?
            /// UTM Medium
            public var utmMedium: String?
            /// UTM Campaign
            public var utmCampaign: String?
            /// UTM Content
            public var utmAdgroup: String?
            /// UTM Term
            public var utmTerm: String?
            /// UTM Content
            public var utmContent: String?
            /// Google Analytics Client ID
            public var googleAnalyticsClientId: String?
        }
    }
}
public extension APIs {
    class SchedulingPro: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "schedulingpro")
        }
        /// Query Parameters for func schedulerSchedulers
        public struct SchedulerSchedulersQuery: URLQueryConvertible {
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
        }
        public func schedulerSchedulers(tenant: Int64, query: SchedulerSchedulersQuery? = nil) async -> Result<Models.PaginatedResponse<Models.SchedulingPro.SchedulerResponse>, APIError> {
            let endpoint = "/schedulingpro/v2/tenant/\(tenant)/schedulers"
            return await getReq(Models.PaginatedResponse<Models.SchedulingPro.SchedulerResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func schedulerSchedulerSessions
        public struct SchedulerSchedulerSessionsQuery: URLQueryConvertible {
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
        }
        public func schedulerSchedulerSessions(tenant: Int64, id: String, query: SchedulerSchedulerSessionsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.SchedulingPro.SchedulerSessionResponse>, APIError> {
            let endpoint = "/schedulingpro/v2/tenant/\(tenant)/schedulers/\(id)/sessions"
            return await getReq(Models.PaginatedResponse<Models.SchedulingPro.SchedulerSessionResponse>.self, endpoint: endpoint, params: query)
        }
    }
}
