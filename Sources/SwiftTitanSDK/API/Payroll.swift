//
//  Payroll.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
public extension Models {
    struct Payroll {
        
        public struct JobSplitExportResponse: Codable, Identifiable {
            /// The job split ID
            public var id: Int64
            /// Job ID
            public var jobId: Int64
            /// Technician ID
            public var technicianId: Int64
            /// The split
            public var split: Double
            /// The job split creation date/time (on UTC)
            public var createdOn: Date
            /// Date/time (on UTC) when the job split was modified
            public var modifiedOn: Date
            /// Whether job split is active
            public var active: Bool
        }
        
        public struct PayrollAdjustmentExportResponse: Codable, Identifiable {
            /// ID of the payroll adjustment
            public var id: Int64
            /// Employee type of the payroll adjustment
            public var employeeType: EmployeeType
            /// Employee ID of the payroll adjustment
            public var employeeId: Int64
            /// Posted date/time (UTC) of the payroll adjustment
            public var postedOn: Date
            /// Amount of the payroll adjustment
            public var amount: Double
            /// Memo of the payroll adjustment
            public var memo: String?
            /// Activity code ID of the payroll adjustment
            public var activityCodeId: Int64?
            /// ID of the payroll adjustment invoice
            public var invoiceId: Int64?
            /// Hours of the payroll adjustment
            public var hours: Double?
            /// Rate of the payroll adjustment
            public var rate: Double?
            /// Date/time (on UTC) when the payroll adjustment was modified
            public var modifiedOn: Date
            /// Whether payroll adjustment is active
            public var active: Bool
        }
        public enum EmployeeType: String, CaseIterable, Identifiable, Codable {
            case Technician, Employee
            public var id: String { rawValue }
        }
        
        public struct JobTimesheetExportResponse: Codable, Identifiable {
            /// The timesheet ID
            public var id: Int64
            /// The job ID
            public var jobId: Int64
            /// The appointment ID
            public var appointmentId: Int64
            /// The technician ID
            public var technicianId: Int64
            /// the dispatch date/time (in UTC)
            public var dispatchedOn: Date?
            /// The arrive date/time (in UTC)
            public var arrivedOn: Date?
            /// The cancel date/time (in UTC)
            public var canceledOn: Date?
            /// The done date/time (in UTC)
            public var doneOn: Date?
            /// The created date/time (in UTC)
            public var createdOn: Date
            /// The modified date/time (in UTC)
            public var modifiedOn: Date
            /// Whether job timesheet is active
            public var active: Bool
        }
        
        public struct PayrollActivityCodeExportResponse: Codable, Identifiable {
            /// ID of the payroll activity code
            public var id: Int64
            /// Name of the payroll activity code
            public var name: String
            /// Code of the payroll activity code
            public var code: String
            /// Earning category of the payroll activity code
            public var earningCategory: PayrollEarningCategory
            /// Date/time (on UTC) when the activity code was modified
            public var modifiedOn: Date
            /// Whether payroll activity code is active
            public var active: Bool
        }
        public enum PayrollEarningCategory: String, CaseIterable, Identifiable, Codable {
            case Timesheet, Commission, Reimbursement
            public var id: String { rawValue }
        }
        
        public struct TimesheetCodeExportResponse: Codable, Identifiable {
            /// ID of the timesheet code
            public var id: Int64
            /// Code of the timesheet code
            public var code: String
            /// Description of the timesheet code
            public var description: String?
            /// Type of the timesheet code
            public var type: TimesheetCodeType
            /// Application employee type of the timesheet code
            public var applicableEmployeeType: TimesheetCodeEmployeeType
            /// Rate info of the timesheet code
            public var rateInfo: TimesheetCodeRateInfoResponse
            /// The date when the timesheet code was created (in UTC)
            public var createdOn: Date
            /// The last date when the timesheet code was modified (in UTC)
            public var modifiedOn: Date
            /// Indicates whether the timesheet code is active or not
            public var active: Bool
        }
        public enum TimesheetCodeType: String, CaseIterable, Identifiable, Codable {
            case Unpaid, Paid, ClockInOut, PaidTimeOff
            public var id: String { rawValue }
        }
        public enum TimesheetCodeEmployeeType: String, CaseIterable, Identifiable, Codable {
            case Technician, Employee, All
            public var id: String { rawValue }
        }
        
        public struct TimesheetCodeRateInfoResponse: Codable {
            /// The hourly rate
            public var hourlyRate: TimesheetHourlyRateType
            /// The custom hourly rate
            public var customHourlyRate: Double?
            /// The rate multiplier
            public var rateMultiplier: Double
        }
        public enum TimesheetHourlyRateType: String, CaseIterable, Identifiable, Codable {
            case EmployeeHourlyRate, CustomHourlyRate
            public var id: String { rawValue }
        }
        
        public struct GrossPayItemExportResponse: Codable {
            /// The gross pay item ID
            public var id: Int64?
            /// The employee/technician ID
            public var employeeId: Int64?
            /// The employee type
            public var employeeType: EmployeeType?
            /// The business unit name
            public var businessUnitName: String?
            /// The payroll ID
            public var payrollId: Int64
            /// Employee/Technician payroll ID
            public var employeePayrollId: String?
            /// The date (UTC) of the gross pay item
            public var date: Date
            /// The activity
            public var activity: String?
            /// The payroll activity code ID
            public var activityCodeId: Int64?
            /// The payroll activity code name
            public var activityCode: String?
            /// The amount
            public var amount: Double
            /// The amount adjustment
            public var amountAdjustment: Double?
            /// The payout business unit name
            public var payoutBusinessUnitName: String?
            /// Type of the gross pay item
            public var grossPayItemType: GrossPayItemType
            /// The start time (UTC)
            public var startedOn: Date?
            /// The end time (UTC)
            public var endedOn: Date?
            /// The paid duration in hours
            public var paidDurationHours: Double?
            /// Type of the paid time
            public var paidTimeType: PaidTimeType?
            /// The job ID
            public var jobId: Int64
            /// The job number
            public var jobNumber: String?
            /// Name of the job type
            public var jobTypeName: String?
            /// The project number
            public var projectNumber: String?
            /// The project ID
            public var projectId: Int64?
            /// The invoice ID
            public var invoiceId: Int64?
            /// The invoice number
            public var invoiceNumber: String?
            /// The invoice item ID
            public var invoiceItemId: Int64?
            /// The customer ID
            public var customerId: Int64?
            /// The customer name
            public var customerName: String?
            /// The location ID
            public var locationId: Int64?
            /// The location name
            public var locationName: String?
            /// The location address
            public var locationAddress: String?
            /// The location zip
            public var locationZip: String?
            /// The zone name
            public var zoneName: String?
            /// The tax zone name
            public var taxZoneName: String?
            /// ID of the labor type
            public var laborTypeId: Int64?
            /// Code of the labor type
            public var laborTypeCode: String?
            /// Defines whether it's a prevailing wage job
            public var isPrevailingWageJob: Bool?
            /// Date/time (on UTC) when the gross pay item was created
            public var createdOn: Date
            /// Date/time (on UTC) when the gross pay item was modified
            public var modifiedOn: Date
            /// Whether gross pay item is active
            public var active: Bool
        }
        public enum GrossPayItemType: String, CaseIterable, Identifiable, Codable {
            case InvoiceRelatedBonus, TimesheetTime, CustomBonus, Salary, Reimbursement
            public var id: String { rawValue }
        }
        public enum PaidTimeType: String, CaseIterable, Identifiable, Codable {
            case Regular, Overtime, DoubleOvertime, PaidTimeOff
            public var id: String { rawValue }
        }
        
        public struct PayrollSettingsExportResponse: Codable {
            /// The employee ID
            public var employeeId: Int64
            /// The type of employee
            public var employeeType: EmployeeType
            /// The external payroll ID
            public var externalPayrollId: String?
            /// The hourly rate
            public var hourlyRate: Double
            /// The ID of the manager
            public var managerId: Int64?
            /// The hire date
            public var hireDate: Date?
            /// The date the record was created
            public var createdOn: Date
            /// The date the record was last modified
            public var modifiedOn: Date
            /// The active status of the record
            public var active: Bool
        }
        /// Default response when creating object with a new ID, or updating object by specified ID.
        public struct ModificationResponse: Codable, Identifiable {
            /// The ID of created/updated object
            public var id: Int64
        }
        
        public struct GrossPayItemCreateRequest: Codable {
            /// The payroll ID
            public var payrollId: Int64
            /// Amount of the gross pay item
            public var amount: Double
            /// The ID of the activity code
            public var activityCodeId: Int64
            /// Date of the gross pay item
            public var date: Date
            /// The invoice ID
            public var invoiceId: Int64?
        }
        
        public struct GrossPayItemUpdateRequest: Codable {
            /// The payroll ID
            public var payrollId: Int64
            /// Amount of the gross pay item
            public var amount: Double
            /// The ID of the activity code
            public var activityCodeId: Int64
            /// Date of the gross pay item
            public var date: Date
            /// The invoice ID
            public var invoiceId: Int64?
        }
        
        public struct GrossPayItemResponse: Codable {
            /// The gross pay item ID
            public var id: Int64?
            /// The employee/technician ID
            public var employeeId: Int64?
            /// The employee type
            public var employeeType: EmployeeType?
            /// The business unit name
            public var businessUnitName: String?
            /// The payroll ID
            public var payrollId: Int64
            /// Employee/Technician payroll ID
            public var employeePayrollId: String?
            /// The date (UTC) of the gross pay item
            public var date: Date
            /// The activity
            public var activity: String?
            /// The payroll activity code ID
            public var activityCodeId: Int64?
            /// The payroll activity code name
            public var activityCode: String?
            /// The amount
            public var amount: Double
            /// The amount adjustment
            public var amountAdjustment: Double?
            /// The payout business unit name
            public var payoutBusinessUnitName: String?
            /// Type of the gross pay item
            public var grossPayItemType: GrossPayItemType
            /// The start time (UTC)
            public var startedOn: Date?
            /// The end time (UTC)
            public var endedOn: Date?
            /// The paid duration in hours
            public var paidDurationHours: Double?
            /// Type of the paid time
            public var paidTimeType: PaidTimeType?
            /// The job ID
            public var jobId: Int64
            /// The job number
            public var jobNumber: String?
            /// Name of the job type
            public var jobTypeName: String?
            /// The project number
            public var projectNumber: String?
            /// The project ID
            public var projectId: Int64?
            /// The invoice ID
            public var invoiceId: Int64?
            /// The invoice number
            public var invoiceNumber: String?
            /// The invoice item ID
            public var invoiceItemId: Int64?
            /// The customer ID
            public var customerId: Int64?
            /// The customer name
            public var customerName: String?
            /// The location ID
            public var locationId: Int64?
            /// The location name
            public var locationName: String?
            /// The location address
            public var locationAddress: String?
            /// The location zip
            public var locationZip: String?
            /// The zone name
            public var zoneName: String?
            /// The tax zone name
            public var taxZoneName: String?
            /// ID of the labor type
            public var laborTypeId: Int64?
            /// Code of the labor type
            public var laborTypeCode: String?
            /// Defines whether it's a prevailing wage job
            public var isPrevailingWageJob: Bool?
        }
        
        public struct JobSplitResponse: Codable, Identifiable {
            /// The job split ID
            public var id: Int64
            /// Job ID
            public var jobId: Int64
            /// Technician ID
            public var technicianId: Int64
            /// The split
            public var split: Double
            /// The job split creation date/time (on UTC)
            public var createdOn: Date
            /// Date/time (on UTC) when the job split was modified
            public var modifiedOn: Date
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        public struct LocationLaborTypeResponse: Codable {
            /// Location ID
            public var locationId: Int64
            /// The hourly rate of the location
            public var hourlyRate: Double
            /// The labor type name of the location
            public var laborTypeName: String
            /// The labor type code of the location
            public var laborTypeCode: String
            /// The location rate creation date/time (on UTC)
            public var createdOn: Date
            /// Whether the location rate is active
            public var active: Bool
        }
        
        public struct PayrollActivityCodeResponse: Codable, Identifiable {
            /// ID of the payroll activity code
            public var id: Int64
            /// Name of the payroll activity code
            public var name: String
            /// Code of the payroll activity code
            public var code: String
            /// Earning category of the payroll activity code
            public var earningCategory: PayrollEarningCategory
        }
        
        public struct PayrollAdjustmentCreateRequest: Codable {
            /// The employee type
            public var employeeType: EmployeeType
            /// ID of the employee
            public var employeeId: Int64
            /// The posted on date/time (in UTC)
            public var postedOn: Date
            /// The payroll adjustment amount
            public var amount: Double?
            /// Memo of the payroll adjustment
            public var memo: String?
            /// ID of the payroll adjustment activity code
            public var activityCodeId: Int64?
            /// ID of the payroll adjustment invoice
            public var invoiceId: Int64?
            /// Hours of the payroll adjustment
            public var hours: Double?
            /// Rate of the payroll adjustment
            public var rate: Double?
        }
        
        public struct PayrollAdjustmentResponse: Codable, Identifiable {
            /// ID of the payroll adjustment
            public var id: Int64
            /// Employee type of the payroll adjustment
            public var employeeType: EmployeeType
            /// Employee ID of the payroll adjustment
            public var employeeId: Int64
            /// Posted date/time (UTC) of the payroll adjustment
            public var postedOn: Date
            /// Amount of the payroll adjustment
            public var amount: Double
            /// Memo of the payroll adjustment
            public var memo: String?
            /// Activity code ID of the payroll adjustment
            public var activityCodeId: Int64?
            /// ID of the payroll adjustment invoice
            public var invoiceId: Int64?
            /// Hours of the payroll adjustment
            public var hours: Double?
            /// Rate of the payroll adjustment
            public var rate: Double?
        }
        
        public struct PayrollResponse: Codable, Identifiable {
            /// ID of the payroll
            public var id: Int64
            /// Started on date (UTC) of the payroll
            public var startedOn: Date
            /// Ended on date (UTC) of the payroll
            public var endedOn: Date
            /// Employee ID of the payroll
            public var employeeId: Int64
            /// Employee type of the payroll
            public var employeeType: EmployeeType
            /// Status of the payroll
            public var status: PayrollStatus
            /// Burden rate of employee
            public var burdenRate: Double?
            /// Date/time (on UTC) when the payroll was modified
            public var modifiedOn: Date
            /// Date/time (on UTC) when the payroll was approved
            public var managerApprovedOn: Date?
        }
        public enum PayrollStatus: String, CaseIterable, Identifiable, Codable {
            case Pending, Expired, Approved, Paid
            public var id: String { rawValue }
        }
        
        public struct PayrollSettingsListResponse: Codable {
            /// The employee ID
            public var employeeId: Int64
            /// The type of employee
            public var employeeType: EmployeeType
            /// The external payroll ID
            public var externalPayrollId: String?
            /// The hourly rate
            public var hourlyRate: Double
            /// The ID of the manager
            public var managerId: Int64?
            /// The hire date
            public var hireDate: Date?
            /// The date the record was created
            public var createdOn: Date
            /// The date the record was last modified
            public var modifiedOn: Date
            /// The active status of the record
            public var active: Bool
        }
        
        public struct PayrollSettingsResponse: Codable {
            /// The employee ID
            public var employeeId: Int64
            /// The type of employee
            public var employeeType: EmployeeType
            /// The external payroll ID
            public var externalPayrollId: String?
            /// The hourly rate
            public var hourlyRate: Double
            /// The ID of the manager
            public var managerId: Int64?
            /// The hire date
            public var hireDate: Date?
            /// The date the record was created
            public var createdOn: Date
            /// The date the record was last modified
            public var modifiedOn: Date
            /// The active status of the record
            public var active: Bool
        }
        
        public struct PayrollSettingsUpdateResponse: Codable {
            /// The employee ID
            public var employeeId: Int64
        }
        
        public struct PayrollSettingsUpdateRequest: Codable {
            /// The external payroll ID
            public var externalPayrollId: String?
            /// The hourly rate
            public var hourlyRate: Double
            /// The ID of the manager
            public var managerId: Int64?
            /// The hire date
            public var hireDate: Date?
        }
        
        public struct TimesheetCodeResponse: Codable, Identifiable {
            /// ID of the timesheet code
            public var id: Int64
            /// Code of the timesheet code
            public var code: String
            /// Description of the timesheet code
            public var description: String?
            /// Type of the timesheet code
            public var type: TimesheetCodeType
            /// Application employee type of the timesheet code
            public var applicableEmployeeType: TimesheetCodeEmployeeType
            /// Rate info of the timesheet code
            public var rateInfo: TimesheetCodeRateInfoResponse
            /// The date when the timesheet code was created (in UTC)
            public var createdOn: Date
            /// The last date when the timesheet code was modified (in UTC)
            public var modifiedOn: Date
            /// Indicates whether the timesheet code is active or not
            public var active: Bool
        }
        
        public struct JobTimesheetResponse: Codable, Identifiable {
            /// The timesheet ID
            public var id: Int64
            /// The job ID
            public var jobId: Int64
            /// The appointment ID
            public var appointmentId: Int64
            /// The technician ID
            public var technicianId: Int64
            /// the dispatch date/time (in UTC)
            public var dispatchedOn: Date?
            /// The arrive date/time (in UTC)
            public var arrivedOn: Date?
            /// The cancel date/time (in UTC)
            public var canceledOn: Date?
            /// The done date/time (in UTC)
            public var doneOn: Date?
            /// The created date/time (in UTC)
            public var createdOn: Date
            /// The modified date/time (in UTC)
            public var modifiedOn: Date
        }
        
        public struct NonJobTimesheetResponse: Codable, Identifiable {
            /// The timesheet ID
            public var id: Int64
            /// The employee/technician ID
            public var employeeId: Int64
            /// The type of the employee
            public var employeeType: EmployeeType
            /// The timesheet code ID
            public var timesheetCodeId: Int64
            /// The start time of the timesheet (in UTC)
            public var startedOn: Date
            /// The end time of the timesheet (in UTC)
            public var endedOn: Date?
            /// The created date/time (in UTC)
            public var createdOn: Date
            /// The modified date/time (in UTC)
            public var modifiedOn: Date
            /// Indicates whether the timesheet is active or not
            public var active: Bool
        }
        
        public struct JobTimesheetCreateRequest: Codable {
            /// The appointment ID
            public var appointmentId: Int64
            /// The technician ID
            public var technicianId: Int64
            /// the dispatch date/time (in UTC)
            public var dispatchedOn: Date
            /// The arrive date/time (in UTC)
            public var arrivedOn: Date
            /// The cancel date/time (in UTC)
            public var canceledOn: Date?
            /// The done date/time (in UTC)
            public var doneOn: Date?
        }
        
        public struct JobTimesheetUpdateRequest: Codable {
            /// The appointment ID
            public var appointmentId: Int64
            /// The technician ID
            public var technicianId: Int64
            /// the dispatch date/time (in UTC)
            public var dispatchedOn: Date
            /// The arrive date/time (in UTC)
            public var arrivedOn: Date
            /// The cancel date/time (in UTC)
            public var canceledOn: Date?
            /// The done date/time (in UTC)
            public var doneOn: Date?
        }
    }
}
public extension APIs {
    class Payroll: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "payroll")
        }
        /// Query Parameters for func exportJobSplits
        public struct ExportJobSplitsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportJobSplits(tenant: Int64, query: ExportJobSplitsQuery? = nil) async -> Result<Models.Payroll.JobSplitExportResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/export/jobs/splits"
            return await getReq(Models.Payroll.JobSplitExportResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportPayrollAdjustments
        public struct ExportPayrollAdjustmentsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportPayrollAdjustments(tenant: Int64, query: ExportPayrollAdjustmentsQuery? = nil) async -> Result<Models.Payroll.PayrollAdjustmentExportResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/export/payroll-adjustments"
            return await getReq(Models.Payroll.PayrollAdjustmentExportResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportTimesheets
        public struct ExportTimesheetsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportTimesheets(tenant: Int64, query: ExportTimesheetsQuery? = nil) async -> Result<Models.Payroll.JobTimesheetExportResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/export/jobs/timesheets"
            return await getReq(Models.Payroll.JobTimesheetExportResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportActivityCodes
        public struct ExportActivityCodesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportActivityCodes(tenant: Int64, query: ExportActivityCodesQuery? = nil) async -> Result<Models.Payroll.PayrollActivityCodeExportResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/export/activity-codes"
            return await getReq(Models.Payroll.PayrollActivityCodeExportResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportTimesheetCodes
        public struct ExportTimesheetCodesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportTimesheetCodes(tenant: Int64, query: ExportTimesheetCodesQuery? = nil) async -> Result<Models.Payroll.TimesheetCodeExportResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/export/timesheet-codes"
            return await getReq(Models.Payroll.TimesheetCodeExportResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportGrossPayItems
        public struct ExportGrossPayItemsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportGrossPayItems(tenant: Int64, query: ExportGrossPayItemsQuery? = nil) async -> Result<Models.Payroll.GrossPayItemExportResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/export/gross-pay-items"
            return await getReq(Models.Payroll.GrossPayItemExportResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportPayrollSettings
        public struct ExportPayrollSettingsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportPayrollSettings(tenant: Int64, query: ExportPayrollSettingsQuery? = nil) async -> Result<Models.Payroll.PayrollSettingsExportResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/export/payroll-settings"
            return await getReq(Models.Payroll.PayrollSettingsExportResponse.self, endpoint: endpoint, params: query)
        }
        public func grossPayItemsCreate(tenant: Int64, body: Models.Payroll.GrossPayItemCreateRequest) async -> Result<Models.Payroll.ModificationResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/gross-pay-items"
            return await bodiedReq(Models.Payroll.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func grossPayItemsGetList
        public struct GrossPayItemsGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// The type of employee\
            /// Values: [Technician, Employee]
            public var employeeType: String?
            /// Format - int64. The Employee ID
            public var employeeId: Int64?
            /// The payroll ID
            public var payrollIds: String?
            /// Format - date-time (as date-time in RFC3339). Return items having date after certain date/time (in UTC)
            public var dateOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items having date before certain date/time (in UTC)
            public var dateOnOrBefore: Date?
        }
        public func grossPayItemsGetList(tenant: Int64, query: GrossPayItemsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.GrossPayItemResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/gross-pay-items"
            return await getReq(Models.PaginatedResponse<Models.Payroll.GrossPayItemResponse>.self, endpoint: endpoint, params: query)
        }
        public func grossPayItemsUpdate(id: Int64, tenant: Int64, body: Models.Payroll.GrossPayItemUpdateRequest) async -> Result<Models.Payroll.ModificationResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/gross-pay-items/\(id)"
            return await bodiedReq(Models.Payroll.ModificationResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func grossPayItemsDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/payroll/v2/tenant/\(tenant)/gross-pay-items/\(id)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func jobSplitsGetList
        public struct JobSplitsGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Returns job split created on or after a certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return job splits created before a certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns job split modified on or after a certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Returns job split modified before a certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Returns job split by active status\
            /// Values: [True, Any, False]
            public var active: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func jobSplitsGetList(job: Int64, tenant: Int64, query: JobSplitsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.JobSplitResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/jobs/\(job)/splits"
            return await getReq(Models.PaginatedResponse<Models.Payroll.JobSplitResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func jobSplitsGetListByJobs
        public struct JobSplitsGetListByJobsQuery: URLQueryConvertible {
            public var jobIds: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Returns job split created on or after a certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return job splits created before a certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns job split modified on or after a certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Returns job split modified before a certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Returns job split by active status\
            /// Values: [True, Any, False]
            public var active: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func jobSplitsGetListByJobs(tenant: Int64, query: JobSplitsGetListByJobsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.JobSplitResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/jobs/splits"
            return await getReq(Models.PaginatedResponse<Models.Payroll.JobSplitResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func locationLaborTypeGetListByLocations
        public struct LocationLaborTypeGetListByLocationsQuery: URLQueryConvertible {
            /// Returns location rates for the specified location IDs
            public var locationIds: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Location (sorts by locations Id), CreatedOn.
            public var sort: String?
        }
        public func locationLaborTypeGetListByLocations(tenant: Int64, query: LocationLaborTypeGetListByLocationsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.LocationLaborTypeResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/locations/rates"
            return await getReq(Models.PaginatedResponse<Models.Payroll.LocationLaborTypeResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func activityCodesGetList
        public struct ActivityCodesGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func activityCodesGetList(tenant: Int64, query: ActivityCodesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.PayrollActivityCodeResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/activity-codes"
            return await getReq(Models.PaginatedResponse<Models.Payroll.PayrollActivityCodeResponse>.self, endpoint: endpoint, params: query)
        }
        public func activityCodesGet(id: Int64, tenant: Int64) async -> Result<Models.Payroll.PayrollActivityCodeResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/activity-codes/\(id)"
            return await getReq(Models.Payroll.PayrollActivityCodeResponse.self, endpoint: endpoint)
        }
        public func payrollAdjustmentsCreate(tenant: Int64, body: Models.Payroll.PayrollAdjustmentCreateRequest) async -> Result<Models.Payroll.ModificationResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/payroll-adjustments"
            return await bodiedReq(Models.Payroll.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func payrollAdjustmentsGetList
        public struct PayrollAdjustmentsGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// The comma separated list of employee IDs
            public var employeeIds: String?
            /// Format - date-time (as date-time in RFC3339). Return payroll adjustments posted on or after certain date/time (in UTC)
            public var postedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return payroll adjustments posted on or before certain date/time (in UTC)
            public var postedOnOrBefore: Date?
        }
        public func payrollAdjustmentsGetList(tenant: Int64, query: PayrollAdjustmentsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.PayrollAdjustmentResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/payroll-adjustments"
            return await getReq(Models.PaginatedResponse<Models.Payroll.PayrollAdjustmentResponse>.self, endpoint: endpoint, params: query)
        }
        public enum EmployeeType: String, CaseIterable, Identifiable, Codable {
            case Technician, Employee
            public var id: String { rawValue }
        }
        /// Query Parameters for func payrollAdjustmentsGet
        public struct PayrollAdjustmentsGetQuery: URLQueryConvertible {
            /// The employee type\
            /// Values: [Technician, Employee]
            public var employeeType: EmployeeType
        }
        public func payrollAdjustmentsGet(id: Int64, tenant: Int64, query: PayrollAdjustmentsGetQuery? = nil) async -> Result<Models.Payroll.PayrollAdjustmentResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/payroll-adjustments/\(id)"
            return await getReq(Models.Payroll.PayrollAdjustmentResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func payrollsGetList
        public struct PayrollsGetListQuery: URLQueryConvertible {
            /// The type of employee\
            /// Values: [Technician, Employee]
            public var employeeType: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items having start date after certain date/time (in UTC)
            public var startedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items having end date before certain date/time (in UTC)
            public var endedOnOrBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items approved on or after certain date/time (in UTC)
            public var approvedOnOrAfter: Date?
            /// Return items of the specified payroll status\
            /// Values: [Pending, Expired, Approved, Paid]
            public var status: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
        }
        public func payrollsGetList(tenant: Int64, query: PayrollsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.PayrollResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/payrolls"
            return await getReq(Models.PaginatedResponse<Models.Payroll.PayrollResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func payrollsGetTechnicianPayrolls
        public struct PayrollsGetTechnicianPayrollsQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items having start date after certain date/time (in UTC)
            public var startedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items having end date before certain date/time (in UTC)
            public var endedOnOrBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items approved on or after certain date/time (in UTC)
            public var approvedOnOrAfter: Date?
            /// Return items of the specified payroll status\
            /// Values: [Pending, Expired, Approved, Paid]
            public var status: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
        }
        public func payrollsGetTechnicianPayrolls(technician: Int64, tenant: Int64, query: PayrollsGetTechnicianPayrollsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.PayrollResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/technicians/\(technician)/payrolls"
            return await getReq(Models.PaginatedResponse<Models.Payroll.PayrollResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func payrollsGetEmployeePayrolls
        public struct PayrollsGetEmployeePayrollsQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items having start date after certain date/time (in UTC)
            public var startedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items having end date before certain date/time (in UTC)
            public var endedOnOrBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items approved on or after certain date/time (in UTC)
            public var approvedOnOrAfter: Date?
            /// Return items of the specified payroll status\
            /// Values: [Pending, Expired, Approved, Paid]
            public var status: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
        }
        public func payrollsGetEmployeePayrolls(employee: Int64, tenant: Int64, query: PayrollsGetEmployeePayrollsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.PayrollResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/employees/\(employee)/payrolls"
            return await getReq(Models.PaginatedResponse<Models.Payroll.PayrollResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func payrollSettingsGetPayrollSettingsList
        public struct PayrollSettingsGetPayrollSettingsListQuery: URLQueryConvertible {
            /// The type of employee\
            /// Values: [Technician, Employee]
            public var employeeType: String?
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
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
        }
        public func payrollSettingsGetPayrollSettingsList(tenant: Int64, query: PayrollSettingsGetPayrollSettingsListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.PayrollSettingsListResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/payroll-settings"
            return await getReq(Models.PaginatedResponse<Models.Payroll.PayrollSettingsListResponse>.self, endpoint: endpoint, params: query)
        }
        public func payrollSettingsGetEmployeePayrollSettings(employee: Int64, tenant: Int64) async -> Result<Models.Payroll.PayrollSettingsResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/employees/\(employee)/payroll-settings"
            return await getReq(Models.Payroll.PayrollSettingsResponse.self, endpoint: endpoint)
        }
        public func payrollSettingsUpdateEmployeePayrollSettings(employee: Int64, tenant: Int64, body: Models.Payroll.PayrollSettingsUpdateRequest) async -> Result<Models.Payroll.PayrollSettingsUpdateResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/employees/\(employee)/payroll-settings"
            return await bodiedReq(Models.Payroll.PayrollSettingsUpdateResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func payrollSettingsGetTechnicianPayrollSettings(technician: Int64, tenant: Int64) async -> Result<Models.Payroll.PayrollSettingsResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/technicians/\(technician)/payroll-settings"
            return await getReq(Models.Payroll.PayrollSettingsResponse.self, endpoint: endpoint)
        }
        public func payrollSettingsUpdateTechnicianPayrollSettings(technician: Int64, tenant: Int64, body: Models.Payroll.PayrollSettingsUpdateRequest) async -> Result<Models.Payroll.PayrollSettingsUpdateResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/technicians/\(technician)/payroll-settings"
            return await bodiedReq(Models.Payroll.PayrollSettingsUpdateResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        /// Query Parameters for func timesheetCodesGetList
        public struct TimesheetCodesGetListQuery: URLQueryConvertible {
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
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func timesheetCodesGetList(tenant: Int64, query: TimesheetCodesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.TimesheetCodeResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/timesheet-codes"
            return await getReq(Models.PaginatedResponse<Models.Payroll.TimesheetCodeResponse>.self, endpoint: endpoint, params: query)
        }
        public func timesheetCodesGet(id: Int64, tenant: Int64) async -> Result<Models.Payroll.TimesheetCodeResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/timesheet-codes/\(id)"
            return await getReq(Models.Payroll.TimesheetCodeResponse.self, endpoint: endpoint)
        }
        /// Query Parameters for func timesheetsGetJobTimesheets
        public struct TimesheetsGetJobTimesheetsQuery: URLQueryConvertible {
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
            /// Format - int64. The technician ID
            public var technicianId: Int64?
            /// Format - date-time (as date-time in RFC3339). Return items having dispatch, arrive, cancel or done dates after certain date/time (in UTC)
            public var startedOn: Date?
            /// Format - date-time (as date-time in RFC3339). Return items having dispatch, arrive, cancel or done dates before certain date/time (in UTC)
            public var endedOn: Date?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func timesheetsGetJobTimesheets(job: Int64, tenant: Int64, query: TimesheetsGetJobTimesheetsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.JobTimesheetResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/jobs/\(job)/timesheets"
            return await getReq(Models.PaginatedResponse<Models.Payroll.JobTimesheetResponse>.self, endpoint: endpoint, params: query)
        }
        public func timesheetsCreateJobTimesheet(job: Int64, tenant: Int64, body: Models.Payroll.JobTimesheetCreateRequest) async -> Result<Models.Payroll.ModificationResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/jobs/\(job)/timesheets"
            return await bodiedReq(Models.Payroll.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func timesheetsGetNonJobTimesheets
        public struct TimesheetsGetNonJobTimesheetsQuery: URLQueryConvertible {
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
            /// Format - int64. The employee ID
            public var employeeId: Int64?
            /// The employee type\
            /// Values: [Technician, Employee]
            public var employeeType: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func timesheetsGetNonJobTimesheets(tenant: Int64, query: TimesheetsGetNonJobTimesheetsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.NonJobTimesheetResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/non-job-timesheets"
            return await getReq(Models.PaginatedResponse<Models.Payroll.NonJobTimesheetResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func timesheetsGetJobTimesheetsByJobs
        public struct TimesheetsGetJobTimesheetsByJobsQuery: URLQueryConvertible {
            public var jobIds: String?
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
            /// Format - int64. The technician ID
            public var technicianId: Int64?
            /// Format - date-time (as date-time in RFC3339). Return items having dispatch, arrive, cancel or done dates after certain date/time (in UTC)
            public var startedOn: Date?
            /// Format - date-time (as date-time in RFC3339). Return items having dispatch, arrive, cancel or done dates before certain date/time (in UTC)
            public var endedOn: Date?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func timesheetsGetJobTimesheetsByJobs(tenant: Int64, query: TimesheetsGetJobTimesheetsByJobsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Payroll.JobTimesheetResponse>, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/jobs/timesheets"
            return await getReq(Models.PaginatedResponse<Models.Payroll.JobTimesheetResponse>.self, endpoint: endpoint, params: query)
        }
        public func timesheetsUpdateJobTimesheet(job: Int64, id: Int64, tenant: Int64, body: Models.Payroll.JobTimesheetUpdateRequest) async -> Result<Models.Payroll.ModificationResponse, APIError> {
            let endpoint = "/payroll/v2/tenant/\(tenant)/jobs/\(job)/timesheets/\(id)"
            return await bodiedReq(Models.Payroll.ModificationResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
    }
}
