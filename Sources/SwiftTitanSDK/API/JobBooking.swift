//
//  JobBooking.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
public extension Models {
    struct JobBooking {
        
        public struct CallReasonResponse: Codable, Identifiable {
            /// Call reason ID
            public var id: Int64
            /// Call reason name
            public var name: String
            /// Indicates that the call is a lead
            public var isLead: Bool
            /// Whether the call reason is active
            public var active: Bool
            /// Date/time (in UTC) when the job was created
            public var createdOn: Date
            /// Date/time (in UTC) when job was last modified
            public var modifiedOn: Date
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
    }
}
public extension APIs {
    class JobBooking: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "jbce")
        }
        /// Query Parameters for func callReasonsGet
        public struct CallReasonsGetQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func callReasonsGet(tenant: Int64, query: CallReasonsGetQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobBooking.CallReasonResponse>, APIError> {
            let endpoint = "/jbce/v2/tenant/\(tenant)/call-reasons"
            return await getReq(Models.PaginatedResponse<Models.JobBooking.CallReasonResponse>.self, endpoint: endpoint, params: query)
        }
    }
}
