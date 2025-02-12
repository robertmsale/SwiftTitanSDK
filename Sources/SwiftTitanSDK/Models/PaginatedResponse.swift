//
//  PaginatedResponse.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 1/29/25.
//

public extension Models {
    struct PaginatedResponse<T: Codable>: Codable {
        public var page: Int32
        public var pageSize: Int32
        public var hasMore: Bool
        public var totalCount: Int32?
        public var data: [T]
    }
    struct ExportResponse<T: Codable>: Codable {
        public var hasMore: Bool
        public var continueFrom: String
        public var data: [T]
    }
}
