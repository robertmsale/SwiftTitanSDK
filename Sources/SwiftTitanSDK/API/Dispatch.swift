//
//  Dispatch.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct Dispatch {
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GpsPingResponse: Codable {
            /// Unique External ID for data point
            public var externalId: String
            /// Request status
            public var status: GpsPingResultStatus
            /// Gets or sets the response message received from the GPS provider about the unit at the time of recording
            public var message: String
        }
        public enum GpsPingResultStatus: String, CaseIterable, Identifiable, Codable {
            case Fail, Success
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GpsPingCreateRequest: Codable {
            /// Gets or sets the ID of the object for which location information is provided
            public var unitId: String
            /// Gets or sets the name of the object for which location information is provided
            public var unitName: String
            /// Gets or sets the time of the recording
            public var eventTime: Date
            /// Gets or sets the latitude coordinate of the unit's location at the time of recording
            public var latitude: Double?
            /// Gets or sets the longitude coordinate of the unit's location at the time of recording
            public var longitude: Double?
            /// Gets or sets the speed of the vehicle at the time of recording
            public var speed: Double?
            /// Gets the location's street address
            public var street: String
            /// Gets the location's city
            public var city: String
            /// Gets the location's region
            public var region: String
            /// Gets the location's postal code
            public var postalCode: String
            /// Gets or sets the response message received from the GPS provider about the unit at the time of recording
            public var message: String
            /// Unique External ID for data point
            public var externalId: String
            /// Indicate if gps ping unit is a new one
            public var isNew: Bool
            /// Gets the status message
            public var statusMessage: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AppointmentAssignmentResponse: Codable, Identifiable {
            /// ID of the appointment assignment
            public var id: Int64
            /// ID of the technician
            public var technicianId: Int64
            /// Name of the technician
            public var technicianName: String
            /// ID of the user who assigned the appointment assignment
            public var assignedById: Int64
            /// Date/time (in UTC) when the appointment assignment was assigned
            public var assignedOn: Date
            /// Status of the appointment assignment
            public var status: JobAppointmentAssignmentStatus
            /// Whether appointment assignment is paused
            public var isPaused: Bool
            /// ID of the job
            public var jobId: Int64
            /// ID of the appointment
            public var appointmentId: Int64
        }
        public enum JobAppointmentAssignmentStatus: String, CaseIterable, Identifiable, Codable {
            case Scheduled, Dispatched, Working, Done
            public var id: String { rawValue }
        }
        /// Appointment response model
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AppointmentResponse: Codable, Identifiable {
            /// Appointment ID
            public var id: Int64
            /// ID of the job that the appointment was created for
            public var jobId: Int64
            /// Appointment number
            public var appointmentNumber: String?
            /// Appointment's start date/time (in UTC)
            public var start: Date
            /// Appointment's end date/time (in UTC)
            public var end: Date
            /// Arrival window start date/time (in UTC), if configured
            public var arrivalWindowStart: Date?
            /// Arrival window end date/time (in UTC), if configured
            public var arrivalWindowEnd: Date?
            /// Appointment's status
            public var status: AppointmentStatus
            /// Special instructions associated to the appointment
            public var specialInstructions: String?
            /// When the appointment was created (in UTC)
            public var createdOn: Date
            /// When the appointment was modified (in UTC)
            public var modifiedOn: Date
        }
        public enum AppointmentStatus: String, CaseIterable, Identifiable, Codable {
            case Scheduled, Dispatched, Working, Hold, Done, Canceled
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AssignTechniciansRequest: Codable {
            /// Id of the appointment to assign to.
            public var jobAppointmentId: Int64
            /// Assign these technicians to the appointment.
            public var technicianIds: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UnassignTechniciansRequest: Codable {
            /// Id of the appointment to unassign from.
            public var jobAppointmentId: Int64
            /// Unassign these technicians from the appointment.
            public var technicianIds: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ArrivalWindowResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var start: String
            
            public var duration: String
            
            public var businessUnitIds: Int64
            
            public var active: Bool
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateArrivalWindowRequest: Codable {
            /// The start time for the arrival window defined as TimeSpan. I.e. "09:00"
            public var start: String
            /// The end time for the arrival window defined as TimeSpan. I.e. "11:00"
            public var duration: String
            /// The business unit ids list that this arrival window applies for.
            public var businessUnitIds: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateArrivalWindowRequest: Codable {
            /// The start time for the arrival window defined as TimeSpan. I.e. "09:00"
            public var start: String
            /// The end time for the arrival window defined as TimeSpan. I.e. "11:00"
            public var duration: String
            /// The business unit ids list that this arrival window applies for.
            public var businessUnitIds: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SetArrivalWindowStatusRequest: Codable {
            
            public var isActive: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ArrivalWindowConfigurationResponse: Codable {
            
            public var configuration: ArrivalWindowConfiguration
        }
        public enum ArrivalWindowConfiguration: String, CaseIterable, Identifiable, Codable {
            case StartTimeOfArrivalWindow, EndTimeOfArrivalWindow
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateArrivalWindowConfigurationRequest: Codable {
            
            public var configuration: ArrivalWindowConfiguration
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BusinessHourModel: Codable {
            
            public var weekdays: TimeRange
            
            public var saturday: TimeRange
            
            public var sunday: TimeRange
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TimeRange: Codable {
            
            public var fromHour: Int32
            
            public var toHour: Int32
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateBusinessHourResponse: Codable {
            
            public var weekdays: TimeRange
            
            public var saturday: TimeRange
            
            public var sunday: TimeRange
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateBusinessHourRequest: Codable {
            
            public var weekdays: TimeRange
            
            public var saturday: TimeRange
            
            public var sunday: TimeRange
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CapacityResponse: Codable {
            /// When the request was processed
            public var timeStamp: Date
            /// Availability calculations by time frame
            public var availabilities: CapacityResponseAvailability
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CapacityResponseAvailability: Codable {
            /// When the availability time frame starts
            public var start: Date
            /// When the availability time frame ends
            public var end: Date
            /// When the availability time frame starts
            public var startUtc: Date
            /// When the availability time frame ends
            public var endUtc: Date
            /// Business units that the availability applies to
            public var businessUnitIds: Int64
            /// Number of hours that total capacity can allow to be booked during this time frame
            public var totalAvailability: Double
            /// Number of remaining hours that can be booked during this time frame
            public var openAvailability: Double
            /// Technician details for this availability time frame
            public var technicians: CapacityResponseTechnician
            /// Indicate if time slot is available
            public var isAvailable: Bool
            /// Indicate if Ideal Booking Percentage is exceeded
            public var isExceedingIdealBookingPercentage: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CapacityResponseTechnician: Codable, Identifiable {
            /// Unique Id of technician
            public var id: Int64
            /// Name of technician
            public var name: String
            /// Whether the technician is available to work during the associated time frame
            public var status: CapacityResponseTechnicianStatus
            /// Whether the technician has all the skills required for the job type
            public var hasRequiredSkills: Bool?
        }
        public enum CapacityResponseTechnicianStatus: String, CaseIterable, Identifiable, Codable {
            case Available, Unavailable
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CapacityRequestArgs: Codable {
            /// When the time frame should start at or after
            public var startsOnOrAfter: Date
            /// When the time frame should end at or before
            public var endsOnOrBefore: Date
            /// Business units to calculate availability for
            public var businessUnitIds: Int64?
            /// Job type whose duration should be used to calculate availability
            public var jobTypeId: Int64?
            /// Indicate whether to use skill-based availability matching
            public var skillBasedAvailability: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportAppointmentAssignmentsResponse: Codable, Identifiable {
            /// ID of the appointment assignment
            public var id: Int64
            /// ID of the technician
            public var technicianId: Int64
            /// Name of the technician
            public var technicianName: String
            /// ID of the user who assigned the appointment assignment
            public var assignedById: Int64
            /// Date/time (in UTC) when the appointment assignment was assigned
            public var assignedOn: Date
            /// Status of the appointment assignment
            public var status: JobAppointmentAssignmentStatus
            /// Whether appointment assignment is paused
            public var isPaused: Bool
            /// ID of the job
            public var jobId: Int64
            /// ID of the appointment
            public var appointmentId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GetNonJobAppointmentResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var technicianId: Int64
            
            public var start: Date
            
            public var name: String
            
            public var duration: String
            
            public var timesheetCodeId: Int64
            
            public var summary: String
            
            public var clearDispatchBoard: Bool
            
            public var clearTechnicianView: Bool
            
            public var removeTechnicianFromCapacityPlanning: Bool
            
            public var allDay: Bool
            
            public var showOnTechnicianSchedule: Bool
            
            public var active: Bool
            
            public var createdOn: Date
            
            public var createdById: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NonJobAppointmentResponse: Codable, Identifiable {
            /// Non-job appointment id
            public var id: Int64
            /// Non-job appointment's technician id
            public var technicianId: Int64
            /// Non-job appointment's start date/time (in UTC)
            public var start: Date
            /// Non-job appointment name
            public var name: String
            /// Non-job appointment duration
            public var duration: String
            /// Unique Id of timesheet code
            public var timesheetCodeId: Int64
            /// Non-job appointment summary
            public var summary: String
            /// Indicate if non-job appointment should be cleared from dispatch board once event is over
            public var clearDispatchBoard: Bool
            /// Indicate if non-job appointment should be cleared from technician's calendar once event is over
            public var clearTechnicianView: Bool
            /// Indicate if technician availability should be remove from legacy capacity planning
            public var removeTechnicianFromCapacityPlanning: Bool
            /// Indicate if non-job appointment is scheduled for whole day
            public var allDay: Bool
            /// Whether the non-job appointment shows on the technicians schedule even if there is no timesheet
            public var showOnTechnicianSchedule: Bool
            /// Indicate if non-job appointment is active
            public var active: Bool
            /// When the appointment was created (in UTC)
            public var createdOn: Date
            /// ID of the user who created the non-job appointment
            public var createdById: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateNonJobAppointmentResult: Codable, Identifiable {
            /// Non-job appointment id
            public var id: Int64
            /// Non-job appointment's technician id
            public var technicianId: Int64
            /// Non-job appointment's start date/time (in UTC)
            public var start: Date
            /// Non-job appointment name
            public var name: String
            /// Non-job appointment duration
            public var duration: String
            /// Unique Id of timesheet code
            public var timesheetCodeId: Int64
            /// Non-job appointment summary
            public var summary: String
            /// Indicate if non-job appointment should be cleared from dispatch board once event is over
            public var clearDispatchBoard: Bool
            /// Indicate if non-job appointment should be cleared from technician's calendar once event is over
            public var clearTechnicianView: Bool
            /// Indicate if technician availability should be remove from legacy capacity planning
            public var removeTechnicianFromCapacityPlanning: Bool
            /// Indicate if non-job appointment is scheduled for whole day
            public var allDay: Bool
            /// Whether the non-job appointment shows on the technicians schedule even if there is no timesheet
            public var showOnTechnicianSchedule: Bool
            /// Indicate if non-job appointment is active
            public var active: Bool
            /// When the appointment was created (in UTC)
            public var createdOn: Date
            /// ID of the user who created the non-job appointment
            public var createdById: Int64
            /// Indicate if non-job appointment is repeating
            public var isRepeating: Bool?
            /// Number of occurrences of the repeating non-job appointment
            public var countOccurrences: Int32?
            /// Interval of the repeating non-job appointment
            public var interval: Int32?
            /// Frequency of the repeating non-job appointment
            public var frequency: RepeatFrequency?
            /// End type of the repeating non-job appointment
            public var endType: RepeatEndType?
            /// End Date of the repeating non-job appointment
            public var endOn: Date?
            /// Days of the week of the repeating non-job appointment
            public var daysOfWeek: String
            /// Custom CodingKeys to handle `repeat`
            enum CodingKeys: String, CodingKey {
                case id, technicianId, start, name, duration, timesheetCodeId, summary
                case clearDispatchBoard, clearTechnicianView, removeTechnicianFromCapacityPlanning
                case allDay, showOnTechnicianSchedule, active, createdOn, createdById
                case isRepeating = "repeat"  // Map "repeat" to "isRepeating"
                case countOccurrences, interval, frequency, endType, endOn, daysOfWeek
            }
        }
        public enum RepeatFrequency: String, CaseIterable, Identifiable, Codable {
            case Daily, Weekly, Monthly, Yearly
            public var id: String { rawValue }
        }
        public enum RepeatEndType: String, CaseIterable, Identifiable, Codable {
            case Never, After, On
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateNonJobAppointmentRequest: Codable {
            public var technicianId: Int64
            public var start: Date
            public var duration: String
            public var name: String
            public var timesheetCodeId: Int64?
            public var summary: String?
            public var clearDispatchBoard: Bool?
            public var clearTechnicianView: Bool?
            public var showOnTechnicianSchedule: Bool?
            public var removeTechnicianFromCapacityPlanning: Bool?
            public var allDay: Bool?
            public var isRepeating: Bool? // Renamed from `repeat`
            public var countOccurrences: Int32?
            public var interval: Int32?
            public var frequency: RepeatFrequency?
            public var endType: RepeatEndType?
            public var endOn: Date?
            public var daysOfWeek: String?

            /// Custom CodingKeys to handle `repeat`
            enum CodingKeys: String, CodingKey {
                case technicianId, start, duration, name, timesheetCodeId, summary
                case clearDispatchBoard, clearTechnicianView, showOnTechnicianSchedule
                case removeTechnicianFromCapacityPlanning, allDay
                case isRepeating = "repeat"  // Map "repeat" to "isRepeating"
                case countOccurrences, interval, frequency, endType, endOn, daysOfWeek
            }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NonJobAppointmentUpdateRequest: Codable {
            public var technicianId: Int64
            public var start: Date
            public var duration: String
            public var name: String
            public var timesheetCodeId: Int64?
            public var summary: String?
            public var clearDispatchBoard: Bool?
            public var clearTechnicianView: Bool?
            public var showOnTechnicianSchedule: Bool?
            public var removeTechnicianFromCapacityPlanning: Bool?
            public var allDay: Bool?
            public var isRepeating: Bool? // Renamed from `repeat`
            public var countOccurrences: Int32?
            public var interval: Int32?
            public var frequency: RepeatFrequency?
            public var endType: RepeatEndType?
            public var endOn: Date?
            public var daysOfWeek: String?

            /// Custom CodingKeys to handle `repeat`
            enum CodingKeys: String, CodingKey {
                case technicianId, start, duration, name, timesheetCodeId, summary
                case clearDispatchBoard, clearTechnicianView, showOnTechnicianSchedule
                case removeTechnicianFromCapacityPlanning, allDay
                case isRepeating = "repeat"  // Map "repeat" to "isRepeating"
                case countOccurrences, interval, frequency, endType, endOn, daysOfWeek
            }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DeleteNonJobAppointmentResult: Codable, Identifiable {
            
            public var message: String
            
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TeamResponse: Codable, Identifiable {
            /// Unique id of the team record
            public var id: Int64
            /// Whether the team is enabled
            public var active: Bool
            /// Descriptive identifier
            public var name: String?
            /// Created by User ID
            public var createdBy: Int64?
            /// Created on date
            public var createdOn: Date
            /// Modified on date
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateTeamResponse: Codable, Identifiable {
            /// Unique id of the team record
            public var id: Int64
            /// Whether the team is enabled
            public var active: Bool
            /// Descriptive identifier
            public var name: String?
            /// Created by User ID
            public var createdBy: Int64?
            /// Created on date
            public var createdOn: Date
            /// Modified on date
            public var modifiedOn: Date
            /// Whether the team was created or this is an existing record
            public var created: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateTeamRequest: Codable {
            /// Whether the team is enabled
            public var active: Bool
            /// Descriptive identifier
            public var name: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianShiftResponse: Codable, Identifiable {
            /// Unique id of the shift record
            public var id: Int64
            /// How the shift is displayed and contributes to availability calculations
            public var shiftType: ShiftType
            /// Descriptive identifier
            public var title: String
            /// Optional detailed explanation of the shift
            public var note: String?
            /// Whether the shift is enabled
            public var active: Bool
            /// >Unique id of the technician this shift applies to
            public var technicianId: Int64
            /// When the shift begins
            public var start: Date
            /// When the shift ends
            public var end: Date
            /// Timesheet code ID of shift
            public var timesheetCodeId: Int64?
        }
        public enum ShiftType: String, CaseIterable, Identifiable, Codable {
            case Normal, OnCall, TimeOff
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianShiftCreateResponse: Codable {
            
            public var created: Bool
            
            public var technicianShifts: TechnicianShiftResponse
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateTechnicianShiftRequest: Codable {
            
            public var technicianIds: Int64
            
            public var shiftType: ShiftType
            
            public var title: String
            /// When the shift begins
            public var start: Date
            /// When the shift ends
            public var end: Date
            /// Optional detailed explanation of the shift
            public var note: String?
            /// Timesheet code ID of shift
            public var timesheetCodeId: Int64?
            /// Repeat type of the shift (Never, Daily, Weekly)
            public var repeatType: ShiftRepeatType
            /// Date to stop repeating on
            public var repeatEndDate: Date?
            
            public var repeatInterval: Int32?
            /// List of Days to repeat the shift on
            public var shiftDays: String?
        }
        public enum ShiftRepeatType: String, CaseIterable, Identifiable, Codable {
            case Never, Daily, Weekly
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianShiftUpdateResponse: Codable {
            
            public var technicianShifts: TechnicianShiftResponse
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateTechnicianShiftRequest: Codable {
            
            public var shiftType: ShiftType
            
            public var title: String
            /// When the shift begins
            public var start: Date
            /// When the shift ends
            public var end: Date
            /// Optional detailed explanation of the shift
            public var note: String
            /// Timesheet code ID of shift
            public var timesheetCodeId: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DeleteTechnicianShiftResult: Codable, Identifiable {
            
            public var message: String
            
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BulkDeleteTechnicianShiftResult: Codable {
            
            public var message: String
            
            public var deletedIds: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BulkDeleteTechnicianShiftRequest: Codable {
            /// The start date for the range deletion
            public var start: Date
            /// The end date for the range deletion
            public var end: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ZoneResponse: Codable, Identifiable {
            /// Unique id of the zone record
            public var id: Int64
            /// Whether the zone is enabled
            public var active: Bool
            /// Descriptive identifier
            public var name: String?
            /// A list of assigned zip codes to the zone
            public var zips: String?
            /// A list of assigned cities to the zone
            public var cities: String?
            /// A list of assigned territory numbers to the zone
            public var territoryNumbers: String?
            /// A list of assigned LOCN numbers to the zone
            public var locnNumbers: String?
            /// User ID who created the zone
            public var createdBy: Int64
            /// Date/time (in UTC) the zone was created
            public var createdOn: Date
            /// Date/time (in UTC) the zone was last modified
            public var modifiedOn: Date
            /// Whether the service days option is enabled
            public var serviceDaysEnabled: Bool
            /// A list of assigned service days
            public var serviceDays: String?
            /// A list of assigned business units
            public var businessUnits: Int64?
            /// A list of assigned technicians
            public var technicians: Int64?
        }
    }
}
public extension APIs {
    class Dispatch: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "dispatch")
        }
        public func gpsCreate(gps_provider: String, tenant: Int64, body: Models.Dispatch.GpsPingCreateRequest) async -> Result<Models.Dispatch.GpsPingResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/gps-provider/\(gps_provider)/gps-pings"
            return await bodiedReq(Models.Dispatch.GpsPingResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func appointmentAssignmentsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AppointmentAssignmentsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Return appointment assignments for one or more appointments
            public var appointmentIds: String?
            /// Format - int64. Return appointment assignments for a single job
            public var jobId: Int64?
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
        public func appointmentAssignmentsGetList(tenant: Int64, query: AppointmentAssignmentsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Dispatch.AppointmentAssignmentResponse>, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/appointment-assignments"
            return await getReq(Models.PaginatedResponse<Models.Dispatch.AppointmentAssignmentResponse>.self, endpoint: endpoint, params: query)
        }
        public func appointmentAssignmentsAssignTechnicians(tenant: Int64, body: Models.Dispatch.AssignTechniciansRequest) async -> Result<Models.Dispatch.AppointmentResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/appointment-assignments/assign-technicians"
            return await bodiedReq(Models.Dispatch.AppointmentResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func appointmentAssignmentsUnassignTechnicians(tenant: Int64, body: Models.Dispatch.UnassignTechniciansRequest) async -> Result<Models.Dispatch.AppointmentResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/appointment-assignments/unassign-technicians"
            return await bodiedReq(Models.Dispatch.AppointmentResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func arrivalWindowsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ArrivalWindowsGetListQuery: URLQueryConvertible {
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
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
        }
        public func arrivalWindowsGetList(tenant: Int64, query: ArrivalWindowsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Dispatch.ArrivalWindowResponse>, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/arrival-windows"
            return await getReq(Models.PaginatedResponse<Models.Dispatch.ArrivalWindowResponse>.self, endpoint: endpoint, params: query)
        }
        public func arrivalWindowsCreate(tenant: Int64, body: Models.Dispatch.CreateArrivalWindowRequest) async -> Result<Models.Dispatch.ArrivalWindowResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/arrival-windows"
            return await bodiedReq(Models.Dispatch.ArrivalWindowResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func arrivalWindowsGet(id: Int64, tenant: Int64) async -> Result<Models.Dispatch.ArrivalWindowResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/arrival-windows/\(id)"
            return await getReq(Models.Dispatch.ArrivalWindowResponse.self, endpoint: endpoint)
        }
        public func arrivalWindowsUpdate(id: Int64, tenant: Int64, body: Models.Dispatch.UpdateArrivalWindowRequest) async -> Result<Models.Dispatch.ArrivalWindowResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/arrival-windows/\(id)"
            return await bodiedReq(Models.Dispatch.ArrivalWindowResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func arrivalWindowsActivated(id: Int64, tenant: Int64, body: Models.Dispatch.SetArrivalWindowStatusRequest) async -> APIError? {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/arrival-windows/\(id)/activated"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PUT")
        }
        public func arrivalWindowsGetConfiguration(tenant: Int64) async -> Result<Models.Dispatch.ArrivalWindowConfigurationResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/arrival-windows/configuration"
            return await getReq(Models.Dispatch.ArrivalWindowConfigurationResponse.self, endpoint: endpoint)
        }
        public func arrivalWindowsUpdatedConfiguration(tenant: Int64, body: Models.Dispatch.UpdateArrivalWindowConfigurationRequest) async -> Result<Models.Dispatch.ArrivalWindowConfigurationResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/arrival-windows/configuration"
            return await bodiedReq(Models.Dispatch.ArrivalWindowConfigurationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func businessHourGetList(tenant: Int64) async -> Result<Models.Dispatch.BusinessHourModel, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/business-hours"
            return await getReq(Models.Dispatch.BusinessHourModel.self, endpoint: endpoint)
        }
        public func businessHourCreate(tenant: Int64, body: Models.Dispatch.CreateBusinessHourRequest) async -> Result<Models.Dispatch.CreateBusinessHourResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/business-hours"
            return await bodiedReq(Models.Dispatch.CreateBusinessHourResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func capacityGetList(tenant: Int64, body: Models.Dispatch.CapacityRequestArgs) async -> Result<Models.Dispatch.CapacityResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/capacity"
            return await bodiedReq(Models.Dispatch.CapacityResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func exportAppointmentAssignments
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportAppointmentAssignmentsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportAppointmentAssignments(tenant: Int64, query: ExportAppointmentAssignmentsQuery? = nil) async -> Result<Models.Dispatch.ExportAppointmentAssignmentsResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/export/appointment-assignments"
            return await getReq(Models.Dispatch.ExportAppointmentAssignmentsResponse.self, endpoint: endpoint, params: query)
        }
        public func nonJobAppointmentsGet(id: Int64, tenant: Int64) async -> Result<Models.Dispatch.GetNonJobAppointmentResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/non-job-appointments/\(id)"
            return await getReq(Models.Dispatch.GetNonJobAppointmentResponse.self, endpoint: endpoint)
        }
        public func nonJobAppointmentsUpdate(id: Int64, tenant: Int64, body: Models.Dispatch.NonJobAppointmentUpdateRequest) async -> Result<Models.Dispatch.GetNonJobAppointmentResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/non-job-appointments/\(id)"
            return await bodiedReq(Models.Dispatch.GetNonJobAppointmentResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func nonJobAppointmentsDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/non-job-appointments/\(id)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func nonJobAppointmentsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NonJobAppointmentsGetListQuery: URLQueryConvertible {
            /// Format - int64. Unique id of the technician this non-job appointment applies to
            public var technicianId: Int64?
            /// Format - date-time (as date-time in RFC3339). When the Start of non-job appointment should be at or after
            public var startsOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). When the Start of non-job appointment should be at or before
            public var startsOnOrBefore: Date?
            /// Format - int64. Unique Id of timesheet code must apply to
            public var timesheetCodeId: Int64?
            /// Whether the result should contains only active non-job appointments
            public var activeOnly: Bool?
            /// Whether the non-job appointment shows on the technicians schedule even if there is no timesheet
            public var showOnTechnicianSchedule: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func nonJobAppointmentsGetList(tenant: Int64, query: NonJobAppointmentsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Dispatch.NonJobAppointmentResponse>, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/non-job-appointments"
            return await getReq(Models.PaginatedResponse<Models.Dispatch.NonJobAppointmentResponse>.self, endpoint: endpoint, params: query)
        }
        public func nonJobAppointmentsCreate(tenant: Int64, body: Models.Dispatch.CreateNonJobAppointmentRequest) async -> Result<Models.Dispatch.CreateNonJobAppointmentResult, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/non-job-appointments"
            return await bodiedReq(Models.Dispatch.CreateNonJobAppointmentResult.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func teamGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TeamGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Whether to include inactive teams
            public var includeInactive: Bool?
        }
        public func teamGetList(tenant: Int64, query: TeamGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Dispatch.TeamResponse>, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/teams"
            return await getReq(Models.PaginatedResponse<Models.Dispatch.TeamResponse>.self, endpoint: endpoint, params: query)
        }
        public func teamCreate(tenant: Int64, body: Models.Dispatch.CreateTeamRequest) async -> Result<Models.Dispatch.CreateTeamResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/teams"
            return await bodiedReq(Models.Dispatch.CreateTeamResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func teamGet(id: Int64, tenant: Int64) async -> Result<Models.Dispatch.TeamResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/teams/\(id)"
            return await getReq(Models.Dispatch.TeamResponse.self, endpoint: endpoint)
        }
        public func teamDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/teams/\(id)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func technicianShiftsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TechnicianShiftsGetListQuery: URLQueryConvertible {
            /// Format - date-time (as date-time in RFC3339). When the Start of shift should be at or after
            public var startsOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). When the End of shift should be at or before
            public var endsOnOrBefore: Date?
            /// Value to match ShiftType to\
            /// Values: [Normal, OnCall, TimeOff]
            public var shiftType: String?
            /// Format - int64. Unique Id of technician shift must apply to
            public var technicianId: Int64?
            /// Text that must appear in the Title
            public var titleContains: String?
            /// Text that must appear in the Note
            public var noteContains: String?
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
        }
        public func technicianShiftsGetList(tenant: Int64, query: TechnicianShiftsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Dispatch.TechnicianShiftResponse>, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/technician-shifts"
            return await getReq(Models.PaginatedResponse<Models.Dispatch.TechnicianShiftResponse>.self, endpoint: endpoint, params: query)
        }
        public func technicianShiftsCreate(tenant: Int64, body: Models.Dispatch.CreateTechnicianShiftRequest) async -> Result<Models.Dispatch.TechnicianShiftCreateResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/technician-shifts"
            return await bodiedReq(Models.Dispatch.TechnicianShiftCreateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func technicianShiftsGet(id: Int64, tenant: Int64) async -> Result<Models.Dispatch.TechnicianShiftResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/technician-shifts/\(id)"
            return await getReq(Models.Dispatch.TechnicianShiftResponse.self, endpoint: endpoint)
        }
        public func technicianShiftsUpdate(id: Int64, tenant: Int64, body: Models.Dispatch.UpdateTechnicianShiftRequest) async -> Result<Models.Dispatch.TechnicianShiftUpdateResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/technician-shifts/\(id)"
            return await bodiedReq(Models.Dispatch.TechnicianShiftUpdateResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func technicianShiftsDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/technician-shifts/\(id)"
            return await delReq(endpoint: endpoint)
        }
        public func technicianShiftsBulkDelete(tenant: Int64, body: Models.Dispatch.BulkDeleteTechnicianShiftRequest) async -> Result<Models.Dispatch.BulkDeleteTechnicianShiftResult, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/technician-shifts/bulk-delete"
            return await bodiedReq(Models.Dispatch.BulkDeleteTechnicianShiftResult.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func zoneGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ZoneGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func zoneGetList(tenant: Int64, query: ZoneGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Dispatch.ZoneResponse>, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/zones"
            return await getReq(Models.PaginatedResponse<Models.Dispatch.ZoneResponse>.self, endpoint: endpoint, params: query)
        }
        public func zoneGet(id: Int64, tenant: Int64) async -> Result<Models.Dispatch.ZoneResponse, APIError> {
            let endpoint = "/dispatch/v2/tenant/\(tenant)/zones/\(id)"
            return await getReq(Models.Dispatch.ZoneResponse.self, endpoint: endpoint)
        }
    }
}
