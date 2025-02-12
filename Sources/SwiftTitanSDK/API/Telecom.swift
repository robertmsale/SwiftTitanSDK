//
//  Telecom.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct Telecom {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CallResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var jobNumber: String
            
            public var projectId: Int64
            
            public var businessUnit: NamedModel
            
            public var type: JobTypeModel
            
            public var leadCall: CallModelResponse
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CallModelResponse: Codable, Identifiable {
            
            public var createdOn: Date
            
            public var active: Bool
            
            public var id: Int64
            
            public var receivedOn: Date
            
            public var duration: String
            
            public var from: String
            
            public var to: String
            
            public var direction: CallDirection
            
            public var callType: CallType?
            
            public var reason: CallReasonModel
            
            public var recordingUrl: String
            
            public var voiceMailUrl: String
            
            public var createdBy: NamedModel
            
            public var customer: NamedModel
            
            public var campaign: NamedModel
            
            public var modifiedOn: Date
            
            public var agent: CallAgentModel
        }
        
        
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        /// List of opt-outs
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct OptOutListResponse: Codable {
            /// The list of opt-out responses.
            public var data: OptOutResponse
        }
        /// Single contact number opt-out status
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct OptOutResponse: Codable {
            /// Contact number in E.164 format
            public var contactNumber: String
            /// Opt-out type
            public var optOutType: OptOutType
        }
        public enum OptOutType: String, CaseIterable, Identifiable, Codable {
            case Unknown, Global, Marketing, Other
            public var id: String { rawValue }
        }
        /// List of phone numbers to get opt-out status for
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GetOptOutListRequest: Codable {
            /// Contact numbers (must be valid parseable phone numbers, E.164 format is recommended)
            public var contactNumbers: String
        }
        /// Result of creating the opt-outs
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateOptOutListResponse: Codable {
            /// Individual results for each number
            public var data: CreateOptOutResponse
        }
        /// Result of creating a single opt-out
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateOptOutResponse: Codable {
            /// Contact number in E.164 format
            public var contactNumber: String
            /// Result of opt-out creation
            public var status: CreateOptOutStatus
        }
        public enum CreateOptOutStatus: String, CaseIterable, Identifiable, Codable {
            case Ok, RetryableError, LogicalError
            public var id: String { rawValue }
        }
        /// List of phone numbers to create the opt-out status for
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateOptOutListRequest: Codable {
            /// Type of opt-out to create
            public var optOutType: OptOutType
            /// Contact numbers (must be valid parseable phone numbers, E.164 format is recommended)
            public var contactNumbers: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DetailedBundleCallModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var jobNumber: String
            
            public var projectId: Int64
            
            public var businessUnit: BusinessUnitModel
            
            public var type: JobTypeModel
            
            public var leadCall: DetailedCallModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BusinessUnitModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var active: Bool
            
            public var name: String
            
            public var officialName: String
            
            public var email: String
            
            public var currency: String
            
            public var phoneNumber: String
            
            public var invoiceHeader: String
            
            public var invoiceMessage: String
            
            public var defaultTaxRate: Double
            
            public var authorizationParagraph: String
            
            public var acknowledgementParagraph: String
            
            public var address: BusinessUnitAddressModel
            
            public var materialSku: String
            
            public var quickbooksClass: String
            
            public var accountCode: String
            
            public var franchiseId: String
            
            public var conceptCode: String
            
            public var corporateContractNumber: String
            
            public var tenant: BusinessUnitTenantModel
            
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BusinessUnitAddressModel: Codable {
            
            public var street: String
            
            public var unit: String
            
            public var city: String
            
            public var state: String
            
            public var zip: String
            
            public var country: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BusinessUnitTenantModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var quickbooksClass: String
            
            public var accountCode: String
            
            public var franchiseId: String
            
            public var conceptCode: String
            
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobTypeModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DetailedCallModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var receivedOn: Date
            
            public var duration: String
            
            public var from: String
            
            public var to: String
            
            public var direction: CallDirection
            
            public var callType: CallType?
            
            public var reason: CallReasonModel
            
            public var recordingUrl: String
            
            public var voiceMailUrl: String
            
            public var createdBy: NamedModel
            
            public var customer: CustomerModel
            
            public var campaign: CampaignModel
            
            public var modifiedOn: Date
            
            public var agent: CallAgentModel
        }
        public enum CallDirection: String, CaseIterable, Identifiable, Codable {
            case Inbound, Outbound
            public var id: String { rawValue }
        }
        public enum CallType: String, CaseIterable, Identifiable, Codable {
            case Abandoned, Unbooked, Excused, Booked, NotLead
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CallReasonModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var lead: Bool
            
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NamedModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var active: Bool
            
            public var name: String
            
            public var email: String
            
            public var balance: Double?
            
            public var doNotMail: Bool
            
            public var address: AddressOutput
            
            public var importId: String
            
            public var doNotService: Bool
            
            public var type: CustomerType
            
            public var contacts: ContactOutputModel
            
            public var mergedToId: Int64?
            
            public var modifiedOn: Date
            
            public var memberships: MembershipModel
            
            public var hasActiveMembership: Bool?
            
            public var customFields: CustomFieldApiModel
            
            public var createdOn: Date
            
            public var createdBy: Int64?
            
            public var phoneSettings: CustomerPhoneModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AddressOutput: Codable {
            
            public var street: String
            
            public var unit: String
            
            public var country: String
            
            public var city: String
            
            public var state: String
            
            public var zip: String
            
            public var streetAddress: String
            
            public var latitude: Double?
            
            public var longitude: Double?
        }
        public enum CustomerType: String, CaseIterable, Identifiable, Codable {
            case Residential, Commercial
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactOutputModel: Codable {
            
            public var id: Int64?
            
            public var type: String
            
            public var value: String
            
            public var memo: String
            
            public var active: Bool
            
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var active: Bool
            
            public var type: MembershipTypeModel
            
            public var status: String
            
            public var from: Date?
            
            public var to: Date?
            
            public var locationId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipTypeModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var active: Bool
            
            public var name: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldApiModel: Codable {
            
            public var typeId: Int64
            
            public var name: String
            
            public var value: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerPhoneModel: Codable {
            
            public var phoneNumber: String
            
            public var doNotText: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var modifiedOn: Date
            
            public var createdOn: Date
            
            public var active: Bool
            
            public var category: CampaignCategoryModel?
            
            public var source: String?
            
            public var otherSource: String?
            
            public var businessUnit: String?
            
            public var medium: String?
            
            public var otherMedium: String?
            
            public var dnis: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CampaignCategoryModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CallAgentModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var externalId: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BundleCallModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var jobNumber: String
            
            public var projectId: Int64
            
            public var businessUnit: BusinessUnitModel
            
            public var type: JobTypeModel
            
            public var leadCall: CallModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CallModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var receivedOn: Date
            
            public var duration: String
            
            public var from: String
            
            public var to: String
            
            public var direction: CallDirection
            
            public var callType: CallType?
            
            public var reason: CallReasonModel
            
            public var recordingUrl: String
            
            public var voiceMailUrl: String
            
            public var createdBy: NamedModel
            
            public var customer: CustomerModel
            
            public var campaign: CampaignModel
            
            public var modifiedOn: Date
            
            public var agent: CallAgentModel
            
            public var createdOn: Date
            
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CallInUpdateModelV2: Codable {
            
            public var callId: Int64?
            
            public var callType: CallType?
            
            public var excuseMemo: String
            
            public var campaignId: Int64?
            
            public var jobId: Int64?
            
            public var agentId: Int64?
            
            public var reason: ReasonInModel
            
            public var customer: CustomerInModel
            
            public var location: LocationInModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ReasonInModel: Codable {
            
            public var name: String
            
            public var lead: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerInModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var address: AddressInput
            
            public var contacts: ContactInputModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AddressInput: Codable {
            
            public var street: String
            
            public var unit: String
            
            public var country: String
            
            public var city: String
            
            public var state: String
            
            public var zip: String
            
            public var latitude: Double?
            
            public var longitude: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactInputModel: Codable {
            
            public var id: Int64?
            
            public var type: String
            
            public var value: String
            
            public var memo: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationInModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var address: AddressInput
            
            public var contacts: ContactInputModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportCallResponse: Codable, Identifiable {
            /// The ID of the call
            public var id: Int64
            /// The duration of the call
            public var duration: String
            /// The caller's phone
            public var from: String
            /// The called party's phone
            public var to: String
            /// The direction of the call
            public var direction: CallDirection
            /// The current status of the call
            public var status: CallStatus
            /// The type (classification) of the call. Null if the inbound call was not classified yet or this is
            ///             an outbound call
            public var type: CallType?
            /// The URL for call recording. Can be null if the call hasn't a recording
            public var recordingUrl: String?
            /// The URL for call voicemail. Can be null if the call hasn't a voicemail. This field may have value only for
            /// Phones Pro tenants
            public var voiceMailPath: String?
            /// The time the call was created (i.e. inbound call was received or outbound call was initiated)
            ///
            public var createdOn: Date
            /// The last time the call properties were updated
            public var modifiedOn: Date
            /// The info about the call reason linked to the call
            public var reason: NamedModel?
            /// The info about the customer linked to the call
            public var customer: NamedModel?
            /// The info about the location linked to the call
            public var location: NamedModel?
            /// The info about the phone advertising campaign linked to the call
            public var campaign: NamedModel?
            /// The info about the job linked to the call
            public var job: JobModel?
            /// The info about the user agent who was assigned to the call. For inbound calls this is the user who
            ///             clicked the call bubble last time, or outbound calls this is a user who initiated the call. For Phones Pro,
            ///             this may differ to CreatedBy for outbound calls if the outbound call was transferred between users
            ///
            public var agent: NamedModel?
            /// The info about the user who created the outbound call
            public var createdBy: NamedModel?
            /// Gets or sets whether the entity is active.
            public var active: Bool
        }
        public enum CallStatus: String, CaseIterable, Identifiable, Codable {
            case Ringing, Answered, Completed, Initiated
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobModel: Codable, Identifiable {
            /// The ID of the job
            public var id: Int64
            /// Human readable number of the job
            public var number: String
        }
    }
}
public extension APIs {
    class Telecom: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "telecom")
        }
        /// Query Parameters for func callsCalls
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CallsCallsQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
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
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - date-time (as date-time in RFC3339). Return items created after certain date/time (in UTC)
            public var createdAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified after certain date/time (in UTC)
            public var modifiedAfter: Date?
            /// Format - int64. Campaign ID
            public var campaignId: Int64?
            /// Format - int64. Agent ID (number)
            public var agentId: Int64?
            /// Format - int32. Minimum call duration (number of seconds)
            public var minDuration: Int32?
            /// The phone number that was called (string)
            public var phoneNumberCalled: String?
            /// The caller's phone number (string)
            public var callerPhoneNumber: String?
            /// Agent name (string)
            public var agentName: String?
            /// Is agent external flag (boolean)
            public var agentIsExternal: Bool?
            /// Format - int64. Agent external ID (number)
            public var agentExternalId: Int64?
            /// The Sorting field, possible values: Id, CreatedOn, ModifiedOn.
            /// The Sorting is ascending by default, add the '-' character to use descending (for example -Id)
            public var sort: String?
        }
        public func callsCalls(tenant: Int64, query: CallsCallsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Telecom.CallResponse>, APIError> {
            let endpoint = "/telecom/v3/tenant/\(tenant)/calls"
            return await getReq(Models.PaginatedResponse<Models.Telecom.CallResponse>.self, endpoint: endpoint, params: query)
        }
        public func optInOutGetAllOptOuts(tenant: Int64) async -> Result<Models.Telecom.OptOutListResponse, APIError> {
            let endpoint = "/telecom/v3/tenant/\(tenant)/optinouts/optouts"
            return await getReq(Models.Telecom.OptOutListResponse.self, endpoint: endpoint)
        }
        public func optInOutCreateOptOutList(tenant: Int64, body: Models.Telecom.CreateOptOutListRequest) async -> Result<Models.Telecom.CreateOptOutListResponse, APIError> {
            let endpoint = "/telecom/v3/tenant/\(tenant)/optinouts/optouts"
            return await bodiedReq(Models.Telecom.CreateOptOutListResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func optInOutGetOptOutList(tenant: Int64, body: Models.Telecom.GetOptOutListRequest) async -> Result<Models.Telecom.OptOutListResponse, APIError> {
            let endpoint = "/telecom/v3/tenant/\(tenant)/optinouts/optouts/getlist"
            return await bodiedReq(Models.Telecom.OptOutListResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func callsGetDetails(id: Int64, tenant: Int64) async -> Result<Models.Telecom.DetailedBundleCallModel, APIError> {
            let endpoint = "/telecom/v2/tenant/\(tenant)/calls/\(id)"
            return await getReq(Models.Telecom.DetailedBundleCallModel.self, endpoint: endpoint)
        }
        public func callsUpdate(id: Int64, tenant: Int64, body: Models.Telecom.CallInUpdateModelV2) async -> Result<Models.Telecom.DetailedCallModel, APIError> {
            let endpoint = "/telecom/v2/tenant/\(tenant)/calls/\(id)"
            return await bodiedReq(Models.Telecom.DetailedCallModel.self, endpoint: endpoint, body: body, method: "PUT")
        }
        /// Query Parameters for func callsGetCalls
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CallsGetCallsQuery: URLQueryConvertible {
            /// Format - date-time (as date-time in RFC3339). Modified before a certain date/time (as date-time in RFC3339), not inclusive
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Modified on or after a certain date/time (as date-time in RFC3339), inclusive
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Created on or after a certain date/time (as date-time in RFC3339), inclusive
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Modified after a certain date/time (as date-time in RFC3339), not inclusive
            public var modifiedAfter: Date?
            /// Format - int32. Minimum call duration (number)
            public var minDuration: Int32?
            /// The phone number that was called (string)
            public var phoneNumberCalled: String
            /// Format - int64. Campaign ID
            public var campaignId: Int64?
            /// Format - int64. Agent ID (number)
            public var agentId: Int64?
            /// Agent name (string)
            public var agentName: String
            /// Is agent external flag (boolean)
            public var agentIsExternal: Bool?
            /// Format - int64. Agent external ID (number)
            public var agentExternalId: Int64?
            /// Sorting (string with possible values "Id" (default), "createdOn", or "modifiedOn")
            public var orderBy: String
            /// Sorting direction (string with possible values "asc" (default) or "desc")
            public var orderByDirection: String
            public var activeOnly: Bool
            /// Format - date-time (as date-time in RFC3339).
            public var createdAfter: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var createdBefore: Date?
            /// Format - int32.
            public var page: Int32?
            /// Format - int32.
            public var pageSize: Int32?
        }
        public func callsGetCalls(tenant: Int64, query: CallsGetCallsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Telecom.BundleCallModel>, APIError> {
            let endpoint = "/telecom/v2/tenant/\(tenant)/calls"
            return await getReq(Models.PaginatedResponse<Models.Telecom.BundleCallModel>.self, endpoint: endpoint, params: query)
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmptyQuery: URLQueryConvertible {}
        public func callsGetRecording(id: Int64, tenant: Int64) async -> Result<Data, APIError> {
            let endpoint = "/telecom/v2/tenant/\(tenant)/calls/\(id)/recording"
            return await getRawReq(endpoint: endpoint, params: EmptyQuery())
        }
        public func callsGetVoiceMail(id: Int64, tenant: Int64) async -> Result<Data, APIError> {
            let endpoint = "/telecom/v2/tenant/\(tenant)/calls/\(id)/voicemail"
            return await getRawReq(endpoint: endpoint, params: EmptyQuery())
        }
        /// Query Parameters for func exportCalls
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportCallsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportCalls(tenant: Int64, query: ExportCallsQuery? = nil) async -> Result<Models.Telecom.ExportCallResponse, APIError> {
            let endpoint = "/telecom/v2/tenant/\(tenant)/export/calls"
            return await getReq(Models.Telecom.ExportCallResponse.self, endpoint: endpoint, params: query)
        }
    }
}
