//
//  EquipmentSystems.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
public extension Models {
    struct EquipmentSystems {
        
        public struct InstalledEquipmentResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var equipmentId: Int64?
            
            public var locationId: Int64
            
            public var customerId: Int64
            
            public var invoiceItemId: Int64?
            
            public var name: String
            
            public var installedOn: Date?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
            
            public var serialNumber: String
            
            public var barcodeId: String?
            
            public var memo: String
            
            public var manufacturer: String
            
            public var model: String
            
            public var cost: Double
            
            public var manufacturerWarrantyStart: Date?
            
            public var manufacturerWarrantyEnd: Date?
            
            public var serviceProviderWarrantyStart: Date?
            
            public var serviceProviderWarrantyEnd: Date?
            
            public var tags: TagResponseModel?
            
            public var actualReplacementDate: String?
            
            public var predictedReplacementMonths: Int32?
            
            public var predictedReplacementDate: String?
        }
        
        public struct TagResponseModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var ownerId: Int64
            
            public var typeId: Int64
            
            public var typeName: String?
            
            public var memo: String?
            
            public var color: String?
            
            public var textColor: String?
            
            public var code: String?
        }
        
        public struct InstalledEquipmentDetailedResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var equipmentId: Int64?
            
            public var locationId: Int64
            
            public var customerId: Int64
            
            public var invoiceItemId: Int64?
            
            public var name: String
            
            public var installedOn: Date?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
            
            public var serialNumber: String
            
            public var barcodeId: String?
            
            public var memo: String
            
            public var manufacturer: String
            
            public var model: String
            
            public var cost: Double
            
            public var manufacturerWarrantyStart: Date?
            
            public var manufacturerWarrantyEnd: Date?
            
            public var serviceProviderWarrantyStart: Date?
            
            public var serviceProviderWarrantyEnd: Date?
            
            public var tags: TagResponseModel?
            
            public var actualReplacementDate: String?
            
            public var predictedReplacementMonths: Int32?
            
            public var predictedReplacementDate: String?
            
            public var customFields: CustomFieldResponseModel?
            
            public var attachments: AttachmentApiModel?
        }
        
        public struct CustomFieldResponseModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var typeId: Int64
            
            public var name: String?
            
            public var value: String?
        }
        
        public struct AttachmentApiModel: Codable {
            /// Attachment Alias
            public var alias: String?
            /// Attachment file name when downloaded
            public var fileName: String?
            /// Attachment type - Image, Video, Document, or Video Link
            public var type: AttachmentAssetType
            
            public var url: String
        }
        public enum AttachmentAssetType: String, CaseIterable, Identifiable, Codable {
            case Other, Image, VideoFile, VideoLink, Document
            public var id: String { rawValue }
        }
        
        public struct InstalledEquipmentCreateRequest: Codable {
            
            public var locationId: Int64
            
            public var name: String?
            
            public var installedOn: Date?
            
            public var actualReplacementDate: String?
            
            public var serialNumber: String?
            
            public var barcodeId: String?
            
            public var memo: String?
            
            public var manufacturer: String?
            
            public var model: String?
            
            public var cost: Double?
            
            public var manufacturerWarrantyStart: Date?
            
            public var manufacturerWarrantyEnd: Date?
            
            public var serviceProviderWarrantyStart: Date?
            
            public var serviceProviderWarrantyEnd: Date?
            
            public var customFields: CustomFieldRequestModel?
            
            public var attachments: AttachmentApiModel?
            
            public var tagTypeIds: Int64?
        }
        
        public struct CustomFieldRequestModel: Codable {
            
            public var id: Int64?
            
            public var typeId: Int64?
            
            public var value: String?
        }
        
        public struct InstalledEquipmentUpdateRequest: Codable {
            
            public var name: String
            
            public var installedOn: Date?
            
            public var actualReplacementDate: String?
            
            public var serialNumber: String
            
            public var barcodeId: String
            
            public var memo: String
            
            public var manufacturer: String
            
            public var model: String
            
            public var cost: Double?
            
            public var manufacturerWarrantyStart: Date?
            
            public var manufacturerWarrantyEnd: Date?
            
            public var serviceProviderWarrantyStart: Date?
            
            public var serviceProviderWarrantyEnd: Date?
            
            public var customFields: [CustomFieldRequestModel]?
            
            public var attachments: [AttachmentApiModel]
            
            public var tagTypeIds: Int64
        }
        
        public struct AttachmentUploadResponse: Codable {
            public var path: String
        }
        
        public struct AttachmentUploadRequest: Codable {
            public var file: String
        }
    }
}
public extension APIs {
    class EquipmentSystems: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "equipmentsystems")
        }
        /// Query Parameters for func installedEquipmentGetList
        public struct InstalledEquipmentGetListQuery: URLQueryConvertible {
            public var locationIds: String?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
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
            /// Available fields are: Id, CreatedOn, ModifiedOn.
            public var sort: String?
        }
        public func installedEquipmentGetList(tenant: Int64, query: InstalledEquipmentGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.EquipmentSystems.InstalledEquipmentResponse>, APIError> {
            let endpoint = "/equipmentsystems/v2/tenant/\(tenant)/installed-equipment"
            return await getReq(Models.PaginatedResponse<Models.EquipmentSystems.InstalledEquipmentResponse>.self, endpoint: endpoint, params: query)
        }
        public func installedEquipmentCreate(tenant: Int64, body: Models.EquipmentSystems.InstalledEquipmentCreateRequest) async -> Result<Models.EquipmentSystems.InstalledEquipmentDetailedResponse, APIError> {
            let endpoint = "/equipmentsystems/v2/tenant/\(tenant)/installed-equipment"
            return await bodiedReq(Models.EquipmentSystems.InstalledEquipmentDetailedResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func installedEquipmentGet(id: Int64, tenant: Int64) async -> Result<Models.EquipmentSystems.InstalledEquipmentDetailedResponse, APIError> {
            let endpoint = "/equipmentsystems/v2/tenant/\(tenant)/installed-equipment/\(id)"
            return await getReq(Models.EquipmentSystems.InstalledEquipmentDetailedResponse.self, endpoint: endpoint)
        }
        public func installedEquipmentUpdate(id: Int64, tenant: Int64, body: Models.EquipmentSystems.InstalledEquipmentUpdateRequest) async -> Result<Models.EquipmentSystems.InstalledEquipmentDetailedResponse, APIError> {
            let endpoint = "/equipmentsystems/v2/tenant/\(tenant)/installed-equipment/\(id)"
            return await bodiedReq(Models.EquipmentSystems.InstalledEquipmentDetailedResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func installedEquipmentPostAttachment(tenant: Int64, body: Models.EquipmentSystems.AttachmentUploadRequest) async -> Result<Models.EquipmentSystems.AttachmentUploadResponse, APIError> {
            let endpoint = "/equipmentsystems/v2/tenant/\(tenant)/installed-equipment/attachments"
            return await bodiedReq(Models.EquipmentSystems.AttachmentUploadResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func installedEquipmentGet2
        public struct InstalledEquipmentGet2Query: URLQueryConvertible {
            public var path: String
        }
        public func installedEquipmentGet2(tenant: Int64, query: InstalledEquipmentGet2Query? = nil) async -> Result<Data, APIError> {
            let endpoint = "/equipmentsystems/v2/tenant/\(tenant)/installed-equipment/attachments"
            return await getReq(Data.self, endpoint: endpoint, params: query)
        }
    }
}
