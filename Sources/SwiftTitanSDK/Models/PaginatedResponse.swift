//
//  PaginatedResponse.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 1/29/25.
//

public extension Models {
    struct PaginatedResponse<T: Codable>: Codable {
        public let page: Int32
        public let pageSize: Int32
        public let hasMode: Bool
        public let totalCount: Int32?
        public let data: [T]
    }
    struct ExportResponse<T: Codable>: Codable {
        public let hasMore: Bool
        public let continueFrom: String
        public let data: [T]
    }
}
