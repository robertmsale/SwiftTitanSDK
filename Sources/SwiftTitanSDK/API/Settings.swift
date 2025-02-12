//
//  Settings.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct Settings {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeeResponse: Codable, Identifiable {
            /// ID of the employee
            public var id: Int64
            /// ID of the user that belongs to the employee
            public var userId: Int64
            /// Employee's name
            public var name: String
            /// [DEPRECATED] Please, use field RoleIds> instead.
            /// Built in user role. Built in role is a template for creating user role.
            public var role: EmployeeUserRole
            /// IDs of the user roles assigned to the technician.
            public var roleIds: Int64?
            /// ID of business unit employee belongs to
            public var businessUnitId: Int64?
            /// When the employee was created
            public var createdOn: Date
            /// When the employee was modified
            public var modifiedOn: Date
            /// Email address of the employee
            public var email: String?
            /// Phone number of the employee
            public var phoneNumber: String?
            /// Login name of the employee
            public var loginName: String?
            /// Custom fields
            public var customFields: EmployeeCustomFieldResponse?
            /// Whether the employee is active
            public var active: Bool
            /// Azure Active Directory User Id
            public var aadUserId: String?
            /// List of the all availible permissions for this user.
            public var permissions: EmployeePermissionResponse?
        }
        public enum EmployeeUserRole: String, CaseIterable, Identifiable, Codable {
            case Unspecified, Technician, Dispatch, Accounting, FieldManager, DisplayUser, DisplayUserWithBillingAccess, SalesManager, CSR, GeneralOffice, TechnicianHelper, TechnicianMaintenance, TechnicianInstaller, Admin, TechnicianService, TechnicianSales, Owner, EmptyEmployee, EmptyTechnician
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeeCustomFieldResponse: Codable {
            
            public var typeId: Int64
            
            public var name: String?
            
            public var value: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeePermissionResponse: Codable, Identifiable {
            
            public var id: Int32
            
            public var value: String?
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeeCreateResponse: Codable, Identifiable {
            /// Employee Id
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeeCreateRequest: Codable {
            /// Employee name
            public var name: String
            /// Mobile phone
            public var mobilePhoneNumber: String?
            /// Office phone
            public var phoneNumber: String?
            /// Email
            public var email: String
            /// Login (Username)
            public var login: String?
            /// Password
            public var password: String?
            /// Account creation method
            public var accountCreationMethod: AccountCreationMethod
            /// Business unit Id
            public var businessUnitId: Int64?
            /// User role Id
            public var roleId: Int64
            /// List of company positions
            public var positions: EmployeePosition
            /// Azure Active Directory User Id
            public var aadUserId: String?
            /// List of employee's custom fields
            public var customFields: EmployeeCustomFieldCreateOrUpdateRequest?
        }
        public enum AccountCreationMethod: String, CaseIterable, Identifiable, Codable {
            case CreateLater, SendInvite, AssignLoginAndPassword
            public var id: String { rawValue }
        }
        public enum EmployeePosition: String, CaseIterable, Identifiable, Codable {
            case CSR, Dispatcher, CsrManager, DispatchManager, InstallProductionManager, ServiceManager, SalesManager, MarketingManager, Administrator, PayrollManager, Bookkeeper, PurchasingManager, WarehouseManager, OfficeManager, GeneralManager, BusinessOwner, AnsweringService, InsideSales, GeneralOfficeNonManagement
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeeCustomFieldCreateOrUpdateRequest: Codable {
            
            public var typeId: Int64
            
            public var value: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeeUpdateResponse: Codable, Identifiable {
            /// Employee Id
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeeUpdateRequest: Codable {
            /// Employee name
            public var name: String
            /// Mobile phone
            public var mobilePhoneNumber: String
            /// Office phone
            public var phoneNumber: String
            /// Email
            public var email: String
            /// Login (Username)
            public var login: String
            /// Business unit Id
            public var businessUnitId: Int64?
            /// User role Id
            public var roleId: Int64
            /// List of company positions
            public var positions: EmployeePosition
            /// Azure Active Directory User Id
            public var aadUserId: String
            /// List of employee's custom fields
            public var customFields: EmployeeCustomFieldCreateOrUpdateRequest
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AccountActionResponse: Codable {
            /// Status
            public var status: AccountActionStatus
        }
        public enum AccountActionStatus: String, CaseIterable, Identifiable, Codable {
            case Success
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AccountActionRequest: Codable {
            /// Action name
            public var action: AccountAction
        }
        public enum AccountAction: String, CaseIterable, Identifiable, Codable {
            case Activate, Deactivate, SendInvite, SendPasswordResetLink
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportEmployeeResponse: Codable, Identifiable {
            /// ID of the employee
            public var id: Int64
            /// ID of the user that belongs to the employee
            public var userId: Int64
            /// Employee's name
            public var name: String
            /// [DEPRECATED] Please, use field RoleIds> instead.
            /// Built in user role. Built in role is a template for creating user role.
            public var role: EmployeeUserRole
            /// IDs of the user roles assigned to the technician.
            public var roleIds: Int64?
            /// ID of business unit employee belongs to
            public var businessUnitId: Int64?
            /// When the employee was created
            public var createdOn: Date
            /// When the employee was modified
            public var modifiedOn: Date
            /// Email address of the employee
            public var email: String?
            /// Phone number of the employee
            public var phoneNumber: String?
            /// Login name of the employee
            public var loginName: String?
            /// Custom fields
            public var customFields: EmployeeCustomFieldResponse?
            /// Whether the employee is active
            public var active: Bool
            /// Azure Active Directory User Id
            public var aadUserId: String?
            /// List of the all availible permissions for this user.
            public var permissions: EmployeePermissionResponse?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportTechnicianResponse: Codable, Identifiable {
            /// ID of the technician
            public var id: Int64
            /// ID of the user that belongs to the technician
            public var userId: Int64
            /// Technician's name
            public var name: String
            /// IDs of the user roles assigned to the technician.
            public var roleIds: Int64?
            /// ID of business unit technician belongs to
            public var businessUnitId: Int64?
            /// ID of the main technician's zone
            public var mainZoneId: Int64?
            /// IDs of all technician's zones
            public var zoneIds: Int64?
            /// When the technician was created
            public var createdOn: Date
            /// When the technician was modified
            public var modifiedOn: Date
            /// Email address of the technician
            public var email: String?
            /// Phone number of the technician
            public var phoneNumber: String?
            /// Login name of the technician
            public var loginName: String?
            /// Technician's home address
            public var home: TechnicianAddressResponse?
            /// Technician's daily goal
            public var dailyGoal: Double
            /// Whether the technician is managed
            public var isManagedTech: Bool
            /// Custom fields
            public var customFields: TechnicianCustomFieldResponse?
            /// Whether the technician is active
            public var active: Bool
            /// Azure Active Directory User Id
            public var aadUserId: String?
            /// Technician's burden rate
            public var burdenRate: Double
            /// Team of the technician
            public var team: String?
            /// Job Filter of the technician
            public var jobFilter: JobFilter?
            /// List of the all availible permissions for this user.
            public var permissions: TechnicianPermissionResponse?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianAddressResponse: Codable {
            
            public var street: String?
            
            public var unit: String?
            
            public var country: String?
            
            public var city: String?
            
            public var state: String?
            
            public var zip: String?
            
            public var streetAddress: String?
            
            public var latitude: Double?
            
            public var longitude: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianCustomFieldResponse: Codable {
            
            public var typeId: Int64
            
            public var name: String?
            
            public var value: String?
        }
        public enum JobFilter: String, CaseIterable, Identifiable, Codable {
            case AllScheduledDispatchedWorking, NextScheduledDispatchedWorking, DispatchedWorking, NextScheduledDispatchedWorkingToday, AllScheduledDispatchedWorkingToday, AllScheduledDispatchedWorkingFiveDays, NextScheduledDispatchedWorkingTodayTomorrow, AllScheduledDispatchedWorkingTodayTomorrow, Next2ScheduledDispatchedWorkingToday
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianPermissionResponse: Codable, Identifiable {
            
            public var id: Int32
            
            public var value: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianResponse: Codable, Identifiable {
            /// ID of the technician
            public var id: Int64
            /// ID of the user that belongs to the technician
            public var userId: Int64
            /// Technician's name
            public var name: String
            /// IDs of the user roles assigned to the technician.
            public var roleIds: Int64?
            /// ID of business unit technician belongs to
            public var businessUnitId: Int64?
            /// ID of the main technician's zone
            public var mainZoneId: Int64?
            /// IDs of all technician's zones
            public var zoneIds: Int64?
            /// When the technician was created
            public var createdOn: Date
            /// When the technician was modified
            public var modifiedOn: Date
            /// Email address of the technician
            public var email: String?
            /// Phone number of the technician
            public var phoneNumber: String?
            /// Login name of the technician
            public var loginName: String?
            /// Technician's home address
            public var home: TechnicianAddressResponse?
            /// Technician's daily goal
            public var dailyGoal: Double
            /// Whether the technician is managed
            public var isManagedTech: Bool
            /// Custom fields
            public var customFields: TechnicianCustomFieldResponse?
            /// Whether the technician is active
            public var active: Bool
            /// Azure Active Directory User Id
            public var aadUserId: String?
            /// Technician's burden rate
            public var burdenRate: Double
            /// Team of the technician
            public var team: String?
            /// Job Filter of the technician
            public var jobFilter: JobFilter?
            /// List of the all availible permissions for this user.
            public var permissions: TechnicianPermissionResponse?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianCreateResponse: Codable, Identifiable {
            /// Technician Id
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianCreateRequest: Codable {
            /// Technician name
            public var name: String
            /// Technician's phone number
            public var phoneNumber: String?
            /// Email
            public var email: String?
            /// Login (Username)
            public var login: String?
            /// Password
            public var password: String?
            /// Account creation method
            public var accountCreationMethod: AccountCreationMethod
            /// Business unit Id
            public var businessUnitId: Int64?
            /// User role Id
            public var roleId: Int64
            /// List of company positions
            public var positions: TechnicianPosition
            /// Azure Active Directory User Id
            public var aadUserId: String?
            /// License type
            public var licenseType: LicenseType
            /// Team name
            public var team: String?
            /// Daily revenue goal
            public var dailyGoal: Double?
            /// Burden rate (hourly)
            public var burdenRate: Double?
            /// Biography
            public var bio: String?
            /// Memo
            public var memo: String?
            /// Upcoming appointment visibility
            public var jobFilter: JobFilter?
            /// Appointment history visibility
            public var jobHistoryDateFilter: JobHistoryDateFilter?
            /// Home address
            public var home: CreateOrUpdateAddressRequest?
            /// List of Technician's custom fields
            public var customFields: TechnicianCustomFieldCreateOrUpdateRequest?
        }
        public enum TechnicianPosition: String, CaseIterable, Identifiable, Codable {
            case Installer, Service, Sales, Maintenance, Helper, InstallProductionManager, ServiceManager, SalesManager, PartRunner, DummyTech
            public var id: String { rawValue }
        }
        public enum LicenseType: String, CaseIterable, Identifiable, Codable {
            case NonManagedTech, ManagedTech, ManagedInstaller
            public var id: String { rawValue }
        }
        public enum JobHistoryDateFilter: String, CaseIterable, Identifiable, Codable {
            case AllJobs, LastThreeDays, LastSevenDays, LastMonth
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateOrUpdateAddressRequest: Codable {
            
            public var unit: String?
            
            public var street: String
            
            public var city: String
            
            public var state: String?
            
            public var country: String?
            
            public var zip: String?
            
            public var latitude: Double?
            
            public var longitude: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianCustomFieldCreateOrUpdateRequest: Codable {
            
            public var typeId: Int64
            
            public var value: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianUpdateResponse: Codable, Identifiable {
            /// Technician Id
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianUpdateRequest: Codable {
            /// Technician name
            public var name: String
            /// Technician's phone number
            public var phoneNumber: String
            /// Email
            public var email: String
            /// Login (Username)
            public var login: String
            /// Business unit Id
            public var businessUnitId: Int64?
            /// User role Id
            public var roleId: Int64
            /// List of company positions
            public var positions: TechnicianPosition
            /// Azure Active Directory User Id
            public var aadUserId: String
            /// License type
            public var licenseType: LicenseType
            /// Team name
            public var team: String
            /// Daily revenue goal
            public var dailyGoal: Double?
            /// Burden rate (hourly)
            public var burdenRate: Double?
            /// Biography
            public var bio: String
            /// Memo
            public var memo: String
            /// Upcoming appointment visibility
            public var jobFilter: JobFilter?
            /// Appointment history visibility
            public var jobHistoryDateFilter: JobHistoryDateFilter?
            /// Home address
            public var home: CreateOrUpdateAddressRequest
            /// List of Technician's custom fields
            public var customFields: TechnicianCustomFieldCreateOrUpdateRequest
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianAccountActionRequest: Codable {
            /// Action name
            public var action: AccountAction
            /// License type to assign to a technician, it is required for AccountAction = Activate
            public var licenseType: TechnicianLicenseType?
            /// (Optional) Truck Id to assign to a technician.
            public var truckId: Int64?
        }
        public enum TechnicianLicenseType: String, CaseIterable, Identifiable, Codable {
            case NonManagedTechnician, ManagedTechnician, ManagedInstaller
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UserRoleResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var active: Bool
            
            public var name: String
            
            public var createdOn: Date
            
            public var employeeType: EmployeeType
        }
        public enum EmployeeType: String, CaseIterable, Identifiable, Codable {
            case Employee, Technician
            public var id: String { rawValue }
        }
        public enum RequestedEmployeeTypeArg: String, CaseIterable, Identifiable, Codable {
            case None, Employee, Technician, All
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BusinessUnitResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var active: Bool
            
            public var name: String
            
            public var officialName: String?
            
            public var email: String?
            
            public var currency: String?
            
            public var phoneNumber: String?
            
            public var invoiceHeader: String?
            
            public var invoiceMessage: String?
            
            public var defaultTaxRate: Double?
            
            public var authorizationParagraph: String?
            
            public var acknowledgementParagraph: String?
            
            public var address: BusinessUnitAddressResponse?
            
            public var materialSku: String?
            
            public var quickbooksClass: String?
            
            public var accountCode: String?
            
            public var franchiseId: String?
            
            public var conceptCode: String?
            
            public var corporateContractNumber: String?
            
            public var tenant: BusinessUnitTenantResponse?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
            /// Optional model that contains a list of external data items
            /// that should be attached to this business unit.
            public var externalData: ExternalDataModel?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BusinessUnitAddressResponse: Codable {
            
            public var street: String?
            
            public var unit: String?
            
            public var city: String?
            
            public var state: String?
            
            public var zip: String?
            
            public var country: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BusinessUnitTenantResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var accountCode: String?
            
            public var franchiseId: String?
            
            public var conceptCode: String?
            
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalDataModel: Codable {
            /// External data key.
            public var key: String
            /// External data value.
            public var value: String
        }
        /// Default response when creating object with a new ID, or updating object by specified ID.
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ModificationResponse: Codable, Identifiable {
            /// The ID of created/updated object
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateBusinessUnitRequest: Codable {
            /// Optional model that contains a list of external data items
            /// that should be attached to this business unit.
            public var externalData: ExternalDataUpdateRequest
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalDataUpdateRequest: Codable {
            /// External data patch mode.\
            /// "Replace" (default) replaces all existing keys with new values. If job A has custom data with keys X and Y and this field only contains an item
            /// with a key X, then custom data with a key Y on job A will be removed.\
            /// "Merge" will only replace key X in the example above. Keys with null value will be deleted.
            public var patchMode: ExternalDataPatchMode?
            /// Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided.
            public var applicationGuid: String
            /// External data list.
            public var externalData: ExternalDataUpdateModel
        }
        public enum ExternalDataPatchMode: String, CaseIterable, Identifiable, Codable {
            case Replace, Merge
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalDataUpdateModel: Codable {
            /// External data key.
            public var key: String
            /// External data value.
            public var value: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportBusinessUnitResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var active: Bool
            
            public var name: String
            
            public var officialName: String?
            
            public var email: String?
            
            public var currency: String?
            
            public var phoneNumber: String?
            
            public var invoiceHeader: String?
            
            public var invoiceMessage: String?
            
            public var defaultTaxRate: Double?
            
            public var authorizationParagraph: String?
            
            public var acknowledgementParagraph: String?
            
            public var address: BusinessUnitAddressResponse?
            
            public var materialSku: String?
            
            public var quickbooksClass: String?
            
            public var accountCode: String?
            
            public var franchiseId: String?
            
            public var conceptCode: String?
            
            public var corporateContractNumber: String?
            
            public var tenant: BusinessUnitTenantResponse?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
            /// Optional model that contains a list of external data items
            /// that should be attached to this business unit.
            public var externalData: ExternalDataModel?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportTagTypeResponse: Codable, Identifiable {
            /// ID of the tag type
            public var id: Int64
            /// Name of the tag type
            public var name: String
            /// Color hex string of the tag type
            public var color: String
            /// Code associated with the tag type
            public var code: String
            /// The TagImportance of the tag type
            public var importance: TagImportance?
            /// Indicates whether tags of this type should be considered as an opportunity
            public var isConversionOpportunity: Bool
            /// Whether the tag type is active
            public var active: Bool
            /// Date/time (in UTC) when the tag type was created
            public var createdOn: Date
            /// Date/time (in UTC) when the tag type was last modified
            public var modifiedOn: Date
        }
        public enum TagImportance: String, CaseIterable, Identifiable, Codable {
            case Medium, High
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TagTypeResponse: Codable, Identifiable {
            /// ID of the tag type
            public var id: Int64
            /// Name of the tag type
            public var name: String
            /// Color hex string of the tag type
            public var color: String
            /// Code associated with the tag type
            public var code: String
            /// The TagImportance of the tag type
            public var importance: TagImportance?
            /// Indicates whether tags of this type should be considered as an opportunity
            public var isConversionOpportunity: Bool
            /// Whether the tag type is active
            public var active: Bool
            /// Date/time (in UTC) when the tag type was created
            public var createdOn: Date
            /// Date/time (in UTC) when the tag type was last modified
            public var modifiedOn: Date
        }
    }
}
public extension APIs {
    class Settings: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "settings")
        }
        /// Query Parameters for func employeesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeesGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Perform lookup by multiple User Ids (maximum 50)
            public var userIds: String?
            /// Filters records by name (case-insensitive "contains" operation)
            public var name: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
        }
        public func employeesGetList(tenant: Int64, query: EmployeesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Settings.EmployeeResponse>, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/employees"
            return await getReq(Models.PaginatedResponse<Models.Settings.EmployeeResponse>.self, endpoint: endpoint, params: query)
        }
        public func employeesCreate(tenant: Int64, body: Models.Settings.EmployeeCreateRequest) async -> Result<Models.Settings.EmployeeCreateResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/employees"
            return await bodiedReq(Models.Settings.EmployeeCreateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func employeesGet(id: Int64, tenant: Int64) async -> Result<Models.Settings.EmployeeResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/employees/\(id)"
            return await getReq(Models.Settings.EmployeeResponse.self, endpoint: endpoint)
        }
        public func employeesUpdate(id: Int64, tenant: Int64, body: Models.Settings.EmployeeUpdateRequest) async -> Result<Models.Settings.EmployeeUpdateResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/employees/\(id)"
            return await bodiedReq(Models.Settings.EmployeeUpdateResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func employeesAccountActions(id: Int64, tenant: Int64, body: Models.Settings.AccountActionRequest) async -> Result<Models.Settings.AccountActionResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/employees/\(id)/account-actions"
            return await bodiedReq(Models.Settings.AccountActionResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func exportEmployees
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportEmployeesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportEmployees(tenant: Int64, query: ExportEmployeesQuery? = nil) async -> Result<Models.Settings.ExportEmployeeResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/export/employees"
            return await getReq(Models.Settings.ExportEmployeeResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportTechnicians
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportTechniciansQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportTechnicians(tenant: Int64, query: ExportTechniciansQuery? = nil) async -> Result<Models.Settings.ExportTechnicianResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/export/technicians"
            return await getReq(Models.Settings.ExportTechnicianResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func techniciansGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechniciansGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Perform lookup by multiple User Ids (maximum 50)
            public var userIds: String?
            /// Filters records by name (case-insensitive "contains" operation)
            public var name: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
        }
        public func techniciansGetList(tenant: Int64, query: TechniciansGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Settings.TechnicianResponse>, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/technicians"
            return await getReq(Models.PaginatedResponse<Models.Settings.TechnicianResponse>.self, endpoint: endpoint, params: query)
        }
        public func techniciansCreate(tenant: Int64, body: Models.Settings.TechnicianCreateRequest) async -> Result<Models.Settings.TechnicianCreateResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/technicians"
            return await bodiedReq(Models.Settings.TechnicianCreateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func techniciansGet(id: Int64, tenant: Int64) async -> Result<Models.Settings.TechnicianResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/technicians/\(id)"
            return await getReq(Models.Settings.TechnicianResponse.self, endpoint: endpoint)
        }
        public func techniciansUpdate(id: Int64, tenant: Int64, body: Models.Settings.TechnicianUpdateRequest) async -> Result<Models.Settings.TechnicianUpdateResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/technicians/\(id)"
            return await bodiedReq(Models.Settings.TechnicianUpdateResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func techniciansAccountActions(id: Int64, tenant: Int64, body: Models.Settings.TechnicianAccountActionRequest) async -> Result<Models.Settings.AccountActionResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/technicians/\(id)/account-actions"
            return await bodiedReq(Models.Settings.AccountActionResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func userRolesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UserRolesGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filters records by name (case-insensitive "contains" operation)
            public var name: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Filter roles by employee type\
            /// Values: [None, Employee, Technician, All]
            public var employeeType: String?
        }
        public func userRolesGetList(tenant: Int64, query: UserRolesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Settings.UserRoleResponse>, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/user-roles"
            return await getReq(Models.PaginatedResponse<Models.Settings.UserRoleResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func businessUnitsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BusinessUnitsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filters records by name (case-insensitive "contains" operation)
            public var name: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
        }
        public func businessUnitsGetList(tenant: Int64, query: BusinessUnitsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Settings.BusinessUnitResponse>, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/business-units"
            return await getReq(Models.PaginatedResponse<Models.Settings.BusinessUnitResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func businessUnitsGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BusinessUnitsGetQuery: URLQueryConvertible {
            /// Format - guid.
            public var externalDataApplicationGuid: String?
        }
        public func businessUnitsGet(id: Int64, tenant: Int64, query: BusinessUnitsGetQuery? = nil) async -> Result<Models.Settings.BusinessUnitResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/business-units/\(id)"
            return await getReq(Models.Settings.BusinessUnitResponse.self, endpoint: endpoint, params: query)
        }
        public func businessUnitsUpdate(id: Int64, tenant: Int64, body: Models.Settings.UpdateBusinessUnitRequest) async -> Result<Models.Settings.ModificationResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/business-units/\(id)"
            return await bodiedReq(Models.Settings.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func exportBusinessUnits
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportBusinessUnitsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportBusinessUnits(tenant: Int64, query: ExportBusinessUnitsQuery? = nil) async -> Result<Models.Settings.ExportBusinessUnitResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/export/business-units"
            return await getReq(Models.Settings.ExportBusinessUnitResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportTagTypes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportTagTypesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportTagTypes(tenant: Int64, query: ExportTagTypesQuery? = nil) async -> Result<Models.Settings.ExportTagTypeResponse, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/export/tag-types"
            return await getReq(Models.Settings.ExportTagTypeResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func tagTypesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TagTypesGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// What kind of items should be returned (only active items will be returned by default)\
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
            public var sort: String?
        }
        public func tagTypesGetList(tenant: Int64, query: TagTypesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Settings.TagTypeResponse>, APIError> {
            let endpoint = "/settings/v2/tenant/\(tenant)/tag-types"
            return await getReq(Models.PaginatedResponse<Models.Settings.TagTypeResponse>.self, endpoint: endpoint, params: query)
        }
    }
}
