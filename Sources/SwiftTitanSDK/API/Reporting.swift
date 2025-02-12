////
////  Reporting.swift
////  SwiftTitanSDK
////
////  Created by Robert Sale on 2/11/25.
////
// TODO: Figure out elegant way to handle dynamic data sets
//import Foundation
//public extension Models {
//    struct Reporting {
//        /// Rows of corresponding standard dynamic set. Types of columns are generally arbitrary
//        /// and defined by the dynamic set (may be number or string etc)
//        public struct DynamicSetResponse<T: Codable>: Codable {
//            /// From which page this output has started
//            public var page: Int32
//            /// Page size for this query (i.e. how many records were requested to return)
//            public var pageSize: Int32
//            /// True if there are more records in the query than returned in this result
//            public var hasMore: Bool
//            /// Total count of records for this query (can optionally be populated)
//            public var totalCount: Int32?
//            /// The collection of result items, will never have more than PageSize items
//            public var data: [T]
//            /// Describes header row of data
//            public var fields: HeaderField
//        }
//        
//        public struct HeaderField: Codable {
//            /// Unique name of the field
//            public var name: String
//            /// Display name of the field
//            public var label: String
//        }
//        
//        public struct ReportCategoryListItem: Codable, Identifiable {
//            /// ID of report catogory for safe use in report endpoints
//            public var id: String
//            /// Display name of the report category
//            public var name: String
//        }
//        
//        public struct ReportListItem: Codable, Identifiable {
//            /// Report unique identifier.
//            /// Use this value to request detailed report information, the actual data, etc.
//            /// Once the report is created the ID cannot be changed
//            public var id: Int64
//            /// Display name of the report.
//            /// Do not use the name as the report identifier because it can be modified
//            /// and any references based on the old value would stop working
//            public var name: String
//            /// Description about the report
//            public var description: String?
//        }
//        
//        public struct ReportResponse: Codable, Identifiable {
//            /// Report unique identifier
//            public var id: Int64
//            /// Display name of the report
//            public var name: String
//            /// Description about the report
//            public var description: String?
//            /// Time when the report structure was changed
//            public var modifiedOn: Date
//            /// Defines the parameters that the report expects when requesting data
//            public var parameters: ReportParameter
//            /// Describes fields/columns returned by the report when requesting data
//            public var fields: ReportField
//        }
//        
//        public struct ReportParameter: Codable {
//            /// Unique name
//            public var name: String
//            /// Display name
//            public var label: String
//            /// Data type of element for the parameter
//            public var dataType: DataType
//            /// Determines whether the filter expects array of elements
//            public var isArray: Bool
//            /// Indicater if the parameter has to be specified of not
//            public var isRequired: Bool
//            /// If the filter accepts only certain values as the input this object defines what those values should be
//            public var acceptValues: ParameterPossibleValues?
//        }
//        public enum DataType: String, CaseIterable, Identifiable, Codable {
//            case String, Number, Boolean, Date, Time
//            public var id: String { rawValue }
//        }
//        
//        public struct ParameterPossibleValues: Codable {
//            /// Describes key column and then value column of possible value rows
//            public var fields: HeaderField
//            /// If values are based on a dynamic list (e.g. a list of the existing Business Units or Technicians)
//            /// then this object defines identifier of the value set to get from the corresponding endpoint
//            public var dynamicSetId: String?
//            /// A predefined list of the values accepted
//            public var values: Array?
//        }
//        
//        public struct ReportField: Codable {
//            /// Field unique identifier
//            public var name: String
//            /// Display name of the field. This is the same label that is displayed in the reporting UI
//            public var label: String
//            /// Value data type for the field/column
//            public var dataType: DataType
//        }
//        /// Rows of the requested report. Types of columns are defined by the report fields' definition.
//        public struct ReportDataResponse<T: Codable>: Codable {
//            /// From which page this output has started
//            public var page: Int32
//            /// Page size for this query (i.e. how many records were requested to return)
//            public var pageSize: Int32
//            /// True if there are more records in the query than returned in this result
//            public var hasMore: Bool
//            /// Total count of records for this query (can optionally be populated)
//            public var totalCount: Int32?
//            /// The collection of result items, will never have more than PageSize items
//            public var data: [T]
//            /// Describes row headers/columns of returned rows
//            public var fields: HeaderField
//        }
//        
//        public struct ReportDataRequest<T: Codable>: Codable {
//            /// List of name/value for input parameters of the report
//            public var parameters: ReportDataParameter<T>
//        }
//        
//        public struct ReportDataParameter<T: Codable>: Codable {
//            /// Parameter name
//            public var name: String
//            /// Value of the parameter based of its descrition (data type etc.)
//            public var value: T?
//        }
//    }
//}
//public extension APIs {
//    class Reporting: APIBase {
//        init(_ sdk: SwiftTitanSDK) {
//            super.init(sdk, apiName: "reporting")
//        }
//        /// Query Parameters for func dynamicValueSetsGetDynamicSet
//        public struct DynamicValueSetsGetDynamicSetQuery: URLQueryConvertible {
//            /// Format - int32. The logical number of page to return, starting from 1
//            public var page: Int32?
//            /// Format - int32. How many records to return (50 by default)
//            public var pageSize: Int32?
//            /// Whether total count should be returned
//            public var includeTotal: Bool?
//        }
//        public func dynamicValueSetsGetDynamicSet<T: Codable>(dynamicSetId: String, tenant: Int64, query: DynamicValueSetsGetDynamicSetQuery? = nil) async -> Result<Models.Reporting.DynamicSetResponse, APIError> {
//            let endpoint = "/reporting/v2/tenant/\(tenant)/dynamic-value-sets/\(dynamicSetId)"
//            return await getReq(Models.Reporting.DynamicSetResponse.self, endpoint: endpoint, params: query)
//        }
//        /// Query Parameters for func reportCategoriesGetCategories
//        public struct ReportCategoriesGetCategoriesQuery: URLQueryConvertible {
//            /// Format - int32. The logical number of page to return, starting from 1
//            public var page: Int32?
//            /// Format - int32. How many records to return (50 by default)
//            public var pageSize: Int32?
//            /// Whether total count should be returned
//            public var includeTotal: Bool?
//        }
//        public func reportCategoriesGetCategories(tenant: Int64, query: ReportCategoriesGetCategoriesQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Reporting.ReportCategoryListItem>, APIError> {
//            let endpoint = "/reporting/v2/tenant/\(tenant)/report-categories"
//            return await getReq(Models.PaginatedResponse<Models.Reporting.ReportCategoryListItem>.self, endpoint: endpoint, params: query)
//        }
//        /// Query Parameters for func reportCategoryReportsGetReports
//        public struct ReportCategoryReportsGetReportsQuery: URLQueryConvertible {
//            /// Format - int32. The logical number of page to return, starting from 1
//            public var page: Int32?
//            /// Format - int32. How many records to return (50 by default)
//            public var pageSize: Int32?
//            /// Whether total count should be returned
//            public var includeTotal: Bool?
//        }
//        public func reportCategoryReportsGetReports(report_category: String, tenant: Int64, query: ReportCategoryReportsGetReportsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Reporting.ReportListItem>, APIError> {
//            let endpoint = "/reporting/v2/tenant/\(tenant)/report-category/\(report_category)/reports"
//            return await getReq(Models.PaginatedResponse<Models.Reporting.ReportListItem>.self, endpoint: endpoint, params: query)
//        }
//        public func reportCategoryReportsGet(report_category: String, reportId: Int64, tenant: Int64) async -> Result<Models.Reporting.ReportResponse, APIError> {
//            let endpoint = "/reporting/v2/tenant/\(tenant)/report-category/\(report_category)/reports/\(reportId)"
//            return await getReq(Models.Reporting.ReportResponse.self, endpoint: endpoint)
//        }
//        /// Query Parameters for func reportCategoryReportsGetData
//        public struct ReportCategoryReportsGetDataQuery: URLQueryConvertible {
//            /// Format - int32. The logical number of page to return, starting from 1
//            public var page: Int32?
//            /// Format - int32. How many records to return (1000 by default)
//            public var pageSize: Int32?
//            /// Whether total count should be returned
//            public var includeTotal: Bool?
//        }
//        public func reportCategoryReportsGetData(report_category: String, reportId: Int64, tenant: Int64, query: ReportCategoryReportsGetDataQuery? = nil, body: Models.Reporting.ReportDataRequest) async -> Result<Models.Reporting.ReportDataResponse, APIError> {
//            let endpoint = "/reporting/v2/tenant/\(tenant)/report-category/\(report_category)/reports/\(reportId)/data"
//            return await bodiedReq(Models.Reporting.ReportDataResponse.self, endpoint: endpoint, body: body, method: "POST")
//        }
//    }
//}
