//
//  Forms.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct Forms {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var active: Bool
            
            public var name: String?
            
            public var published: Bool
            
            public var hasConditionalLogic: Bool
            
            public var hasTriggers: Bool
            
            public var createdById: Int64
            
            public var createdOn: Date
            
            public var modifiedOn: Date
        }
        public enum StatusField: String, CaseIterable, Identifiable, Codable {
            case any="Any", Published, Unpublished
            public var id: String { rawValue }
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormSubmissionResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var formId: Int64
            
            public var formName: String?
            
            public var submittedOn: Date
            
            public var createdById: Int64
            
            public var status: SubmissionStatus
            
            public var owners: FormOwner?
            
//            public var units: ??
        }
        public enum SubmissionStatus: String, CaseIterable, Identifiable, Codable {
            case Started, Completed, any="Any"
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormOwner: Codable, Identifiable {
            
            public var type: OwnerType
            
            public var id: Int64
        }
        public enum OwnerType: String, CaseIterable, Identifiable, Codable {
            case Job, Call, Customer, Location, Equipment, Technician, JobAppointment, Membership, Truck, Project, ServiceAgreement
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormUnitApiDto: Codable, Identifiable {
            
            public var id: String
            
            public var name: String
            
            public var type: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormSectionApiDto: Codable, Identifiable {
            
            public var id: String
            
            public var name: String
            
            public var type: String
            
            public var description: String
            
//            public var units:
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormFieldApiDto: Codable, Identifiable {
            
            public var id: String
            
            public var name: String
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormAttachment: Codable {
            
            public var fileName: String
            
            public var createdFrom: String
            
            public var originalFileName: String
            
            public var thumbnail: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DropdownFieldApiDto: Codable, Identifiable {
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
            
            public var id: String
            
            public var name: String
            
            public var options: String
            
            public var value: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NumberFieldApiDto: Codable, Identifiable {
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
            
            public var id: String
            
            public var name: String
            
            public var value: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TextFieldApiDto: Codable, Identifiable {
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
            
            public var id: String
            
            public var name: String
            
            public var value: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CheckboxFieldApiDto: Codable, Identifiable {
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
            
            public var id: String
            
            public var name: String
            
            public var values: String
            
            public var options: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DateFieldApiDto: Codable, Identifiable {
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
            
            public var id: String
            
            public var name: String
            
            public var value: Date?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PictureFieldApiDto: Codable, Identifiable {
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
            
            public var id: String
            
            public var name: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct RadioFieldApiDto: Codable, Identifiable {
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
            
            public var id: String
            
            public var name: String
            
            public var options: String
            
            public var value: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SignatureFieldApiDto: Codable, Identifiable {
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
            
            public var id: String
            
            public var name: String
            
            public var value: String
            
            public var isRefused: Bool
            
            public var refusalReason: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct StoplightFieldApiDto: Codable, Identifiable {
            
            public var type: String
            
            public var comment: String
            
            public var attachments: FormAttachment
            
            public var id: String
            
            public var name: String
            
            public var value: StoplightValue?
        }
        public enum StoplightValue: String, CaseIterable, Identifiable, Codable {
            case Red, Yellow, Green
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormStaticElementApiDto: Codable, Identifiable {
            
            public var id: String
            
            public var name: String
            
            public var type: String
        }
        public enum FormOwnerType: String, CaseIterable, Identifiable, Codable {
            case Job, Call, Customer, Location, Equipment, Technician, JobAppointment, Membership, Truck
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AttachmentResponse: Codable {
            /// Original filename
            public var fileName: String
        }
    }
}
public extension APIs {
    class Forms: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "forms")
        }
        /// Query Parameters for func formGetForms
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormGetFormsQuery: URLQueryConvertible {
            public var hasConditionalLogic: Bool?
            public var hasTriggers: Bool?
            public var name: String?
            /// Values: [Any, Published, Unpublished]
            public var status: String?
            public var ids: String?
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - date-time (as date-time in RFC3339).
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var modifiedOnOrAfter: Date?
            /// Format - int32.
            public var page: Int32?
            /// Format - int32.
            public var pageSize: Int32?
            public var includeTotal: Bool?
            public var sort: String?
        }
        public func formGetForms(tenant: Int64, query: FormGetFormsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Forms.FormResponse>, APIError> {
            let endpoint = "/forms/v2/tenant/\(tenant)/forms"
            return await getReq(Models.PaginatedResponse<Models.Forms.FormResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func formSubmissionGetFormSubmissions
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FormSubmissionGetFormSubmissionsQuery: URLQueryConvertible {
            /// Form Ids (comma separated Ids)
            public var formIds: String?
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - int64. Creator user Id
            public var createdById: Int64?
            /// Values: [Started, Completed, Any]
            public var status: String?
            /// Format - date-time (as date-time in RFC3339). Submission modified date on or after
            public var submittedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Submission modified date before
            public var submittedBefore: Date?
            /// Values: [Job, Call, Customer, Location, Equipment, Technician, JobAppointment, Membership, Truck]
            public var ownerType: String?
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
            /// Available fields are: Id, SubmittedOn, CreatedBy.
            public var sort: String?
        }
        public func formSubmissionGetFormSubmissions(tenant: Int64, query: FormSubmissionGetFormSubmissionsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Forms.FormSubmissionResponse>, APIError> {
            let endpoint = "/forms/v2/tenant/\(tenant)/submissions"
            return await getReq(Models.PaginatedResponse<Models.Forms.FormSubmissionResponse>.self, endpoint: endpoint, params: query)
        }
//        public func jobsCreateAttachment(id: Int64, tenant: Int64, body: Models.Forms.) async -> Result<Models.Forms.AttachmentResponse, APIError> {
//            let endpoint = "/forms/v2/tenant/\(tenant)/jobs/\(id)/attachments"
//            return await bodiedReq(Models.Forms.AttachmentResponse.self, endpoint: endpoint, body: body, method: "POST")
//        }
        /// Query Parameters for func jobsGetJobAttachments
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobsGetJobAttachmentsQuery: URLQueryConvertible {
            /// Format - date-time (as date-time in RFC3339).
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var createdOnOrAfter: Date?
            public var sort: String?
            /// Format - int32.
            public var page: Int32?
            /// Format - int32.
            public var pageSize: Int32?
            public var includeTotal: Bool?
        }
//        public func jobsGetJobAttachments(jobId: Int64, tenant: Int64, query: JobsGetJobAttachmentsQuery? = nil) async -> APIError? {
//            let endpoint = "/forms/v2/tenant/\(tenant)/jobs/\(jobId)/attachments"
//            return await getReq(endpoint: endpoint, params: query)
//        }
//        public func jobsGet(id: Int64, tenant: Int64) async -> APIError? {
//            let endpoint = "/forms/v2/tenant/\(tenant)/jobs/attachment/\(id)"
//            return await getReq(endpoint: endpoint)
//        }
    }
}
