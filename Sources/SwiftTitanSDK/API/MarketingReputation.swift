//
//  MarketingReputation.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct MarketingReputation {
        public enum JobStatus: Int32, CaseIterable, Identifiable, Codable {
            case zero, two, three, four, five
            public var id: Int32 { rawValue }
        }
        public enum PulledReviewRecommendationStatus: Int32, CaseIterable, Identifiable, Codable {
            case zero, one
            public var id: Int32 { rawValue }
        }
        public enum ResponseType: Int32, CaseIterable, Identifiable, Codable {
            case zero, one, two
            public var id: Int32 { rawValue }
        }
        public enum ReviewMatchConfidenceLevel: Int32, CaseIterable, Identifiable, Codable {
            case zero, one, two, three, four, five, six
            public var id: Int32 { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ReviewReport: Codable {
            
            public var address: String?
            
            public var platform: String?
            
            public var authorEmail: String?
            
            public var authorName: String?
            
            public var review: String?
            
            public var reviewResponse: String?
            
            public var publishDate: Date
            
            public var rating: Double?
            
            public var recommendationStatus: PulledReviewRecommendationStatus
            
            public var verificationStatus: Bool
            
            public var jobId: Int64?
            
            public var verifiedByUserId: Int64?
            
            public var verifiedOn: Date?
            
            public var isAutoVerified: Bool?
            
            public var businessUnitId: Int64?
            
            public var completedDate: Date?
            
            public var customerName: String?
            
            public var customerId: Int64?
            
            public var dispatchedDate: Date?
            
            public var jobStatus: JobStatus
            
            public var jobTypeName: String?
            
            public var technicianFullName: String?
            
            public var technicianId: Int64?
        }
        public enum ReviewsReportType: Int32, CaseIterable, Identifiable, Codable {
            case zero, one, two
            public var id: Int32 { rawValue }
        }
    }
}
public extension APIs {
    class MarketingReputation: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "marketingreputation")
        }
        /// Query Parameters for func reviews
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ReviewsQuery: URLQueryConvertible {
            /// Format - int32.
            public var page: Int32?
            /// Format - int32.
            public var pageSize: Int32?
            public var includeTotal: Bool?
            public var search: String?
            /// Format - int32.
            public var reportType: Int32?
            public var sort: String?
            /// Format - date-time (as date-time in RFC3339).
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var fromDate: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var toDate: Date?
            /// Format - float.
            public var fromRating: Double?
            /// Format - float.
            public var toRating: Double?
            public var includeReviewsWithoutLocation: Bool?
            public var includeReviewsWithoutCampaign: Bool?
            public var includeReviewsWithoutTechnician: Bool?
        }
        public func reviews(tenant: String, query: ReviewsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.MarketingReputation.ReviewReport>, APIError> {
            let endpoint = "/marketingreputation/v2/tenant/\(tenant)/reviews"
            return await getReq(Models.PaginatedResponse<Models.MarketingReputation.ReviewReport>.self, endpoint: endpoint, params: query)
        }
    }
}
