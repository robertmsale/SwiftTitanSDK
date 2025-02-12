//
//  PaginatedResponse.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 1/29/25.
//

public extension Models {
    struct PaginatedResponse<T: Codable>: Codable {
        let page: Int32
        let pageSize: Int32
        let hasMode: Bool
        let totalCount: Int32?
        let data: [T]
    }
    struct ExportResponse<T: Codable>: Codable {
        let hasMore: Bool
        let continueFrom: String
        let data: [T]
    }
}
