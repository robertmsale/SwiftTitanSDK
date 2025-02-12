//
//  JobPlanningAndManagement.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct JobPlanningAndManagement {
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
            /// Id of a customer that the appointment was created for
            public var customerId: Int64
            /// Returns true if the appointment is unused
            public var unused: Bool
            /// ID of the user that created the appointment
            public var createdById: Int64
            /// Returns true if the appointment is confirmed
            public var isConfirmed: Bool
        }
        public enum AppointmentStatus: String, CaseIterable, Identifiable, Codable {
            case Scheduled, Dispatched, Working, Hold, Done, Canceled
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AppointmentAddRequest: Codable {
            /// ID of job for new appointment
            public var jobId: Int64
            /// Start date/time (in UTC) of new appointment
            public var start: Date
            /// End date/time (in UTC) of new appointment
            public var end: Date
            /// Arrival window start date/time (in UTC) for new appointment, if configured
            public var arrivalWindowStart: Date?
            /// Arrival window end date/time (in UTC) for new appointment, if configured
            public var arrivalWindowEnd: Date?
            /// List of IDs of technicians to assign to new appointment
            public var technicianIds: Int64?
            /// Special instructions associated to the appointment
            public var specialInstructions: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AppointmentRescheduleRequest: Codable {
            /// New start date/time (in UTC) for appointment
            public var start: Date
            /// New end date/time (in UTC) for appointment
            public var end: Date
            /// New arrival window start date/time (in UTC) for appointment, if configured
            public var arrivalWindowStart: Date?
            /// New arrival window end date/time (in UTC) for appointment, if configured
            public var arrivalWindowEnd: Date?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct HoldAppointmentRequest: Codable {
            /// ID of the hold reason
            public var reasonId: Int64
            /// Memo of why the appointment is going on hold
            public var memo: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateAppointmentSpecialInstructionsRequest: Codable {
            /// New special instructions associated to the appointment
            public var specialInstructions: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportJobsResponse: Codable, Identifiable {
            /// ID of the job
            public var id: Int64
            /// Job number
            public var jobNumber: String
            /// ID of the job's project
            public var projectId: Int64?
            /// ID of the job's customer
            public var customerId: Int64
            /// ID of the job's location
            public var locationId: Int64
            /// Status of the job
            public var jobStatus: String
            /// Date/time (in UTC) when the job was completed
            public var completedOn: Date?
            /// ID of the job's business unit
            public var businessUnitId: Int64
            /// ID of job type
            public var jobTypeId: Int64
            /// Priority of the job
            public var priority: String
            /// ID of the job's campaign
            public var campaignId: Int64
            /// Job summary
            public var summary: String?
            /// Custom fields on the job
            public var customFields: CustomFieldApiModel
            /// Number of appointments on the job
            public var appointmentCount: Int64
            /// ID of the first appointment on the job
            public var firstAppointmentId: Int64
            /// ID of the last appointment on the job
            public var lastAppointmentId: Int64
            /// ID of the job for which this job is a recall
            public var recallForId: Int64?
            /// ID of the job for which this job is a warranty
            public var warrantyId: Int64?
            /// Object that contains:
            ///             JobId: ID of the job from which this job was generated
            ///             EmployeeId: ID of the office user or technician
            ///
            public var jobGeneratedLeadSource: JobGeneratedLeadSource?
            /// Whether the job is a no-charge job
            public var noCharge: Bool
            /// Whether notifications will be sent to customers
            public var notificationsEnabled: Bool
            /// Date/time (in UTC) when the job was created
            public var createdOn: Date
            /// ID of the user who created the job
            public var createdById: Int64
            /// Date/time (in UTC) when job was last modified
            public var modifiedOn: Date
            /// Tags on the job
            public var tagTypeIds: Int64
            /// ID of the Call that resulted in this job
            public var leadCallId: Int64?
            /// ID of the Booking that resulted in this job
            public var bookingId: Int64?
            /// ID of the Technician that sold this job
            public var soldById: Int64?
            /// List of external data attached to this job,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
            /// Customer PO
            public var customerPo: String
            /// ID of the invoice associated with this job.
            public var invoiceId: Int64
            /// ID of the Membership associated with this job.
            public var membershipId: Int64?
            /// Total amount of the job
            public var total: Double?
            /// Whether this job is active, or not anymore.
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldApiModel: Codable {
            
            public var typeId: Int64
            
            public var name: String
            
            public var value: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobGeneratedLeadSource: Codable {
            
            public var jobId: Int64?
            
            public var employeeId: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalDataModel: Codable {
            /// External data key.
            public var key: String
            /// External data value.
            public var value: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportProjectsResponse: Codable, Identifiable {
            /// ID of the project
            public var id: Int64
            /// Project number
            public var number: String
            /// Project name
            public var name: String?
            /// Project summary
            public var summary: String?
            /// Project status
            public var status: String?
            /// Project status id
            public var statusId: Int64?
            /// Project substatus
            public var subStatus: String?
            /// Project substatus id
            public var subStatusId: Int64?
            /// ID of the project's customer
            public var customerId: Int64
            /// ID of the project's location
            public var locationId: Int64
            /// ID of the project's type
            public var projectTypeId: Int64?
            /// IDs of project managers for the project.
            public var projectManagerIds: Int64
            /// IDs of business units for the project.
            public var businessUnitIds: Int64
            /// Start date of the project
            public var startDate: Date?
            /// Target completion date of the project
            public var targetCompletionDate: Date?
            /// Actual completion date of the project
            public var actualCompletionDate: Date?
            /// Projects last modification date
            public var modifiedOn: Date?
            /// Date/time (in UTC) when the project was created
            public var createdOn: Date
            /// Custom fields on the project
            public var customFields: CustomFieldApiModel
            /// List of external data attached to this project,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
            /// List of jobs associated with this project.
            public var jobIds: Int64
            
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportAppointmentsResponse: Codable, Identifiable {
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
            /// Id of a customer that the appointment was created for
            public var customerId: Int64
            /// Returns true if the appointment is unused
            public var unused: Bool
            /// ID of the user that created the appointment
            public var createdById: Int64
            /// Returns true if the appointment is confirmed
            public var isConfirmed: Bool
            /// Whether this appointment is active, or not anymore.
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportJobCanceledLogResponse: Codable, Identifiable {
            /// ID of the job canceled log
            public var id: Int64
            /// ID of the job that has been canceled
            public var jobId: Int64
            /// ID of the job cancel reason
            public var reasonId: Int64
            /// Job canceled log additional comments
            public var memo: String?
            /// Date/time (in UTC) when the job canceled log was created
            public var createdOn: Date
            /// ID of user who canceled the job
            public var createdById: Int64
            /// Whether the job canceled log is active
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportJobNotesResponse: Codable, Identifiable {
            /// Note Id.
            public var id: Int64
            /// Whether this note is active, or not anymore.
            public var active: Bool
            /// Text content of a note
            public var text: String
            /// Whether the note is pinned to the top
            public var isPinned: Bool
            /// ID of user who created this note
            public var createdById: Int64
            /// Date/time (in UTC) the note was created
            public var createdOn: Date
            /// Date/time (in UTC) the note was modified
            public var modifiedOn: Date
            /// Notes Job Id.
            public var jobId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportProjectNotesResponse: Codable, Identifiable {
            /// Note Id.
            public var id: Int64
            /// Whether this note is active, or not anymore.
            public var active: Bool
            /// Text content of a note
            public var text: String
            /// Whether the note is pinned to the top
            public var isPinned: Bool
            /// ID of user who created this note
            public var createdById: Int64
            /// Date/time (in UTC) the note was created
            public var createdOn: Date
            /// Date/time (in UTC) the note was modified
            public var modifiedOn: Date
            /// Notes Project Id.
            public var projectId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportJobHistoryResponse: Codable {
            /// ID of the job
            public var jobId: Int64
            /// Job history entries
            public var history: ExportJobHistoryEntry
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportJobHistoryEntry: Codable, Identifiable {
            /// ID of the log
            public var id: Int64
            /// ID of the employee
            public var employeeId: Int64?
            /// Type of the job status
            public var eventType: String
            /// Date of the log
            public var date: Date
            /// Scheduling tool used
            public var usedSchedulingTool: JobSchedulingToolValue
        }
        public enum JobSchedulingToolValue: String, CaseIterable, Identifiable, Codable {
            case Manual, SmartSchedule, SmartDispatch, TechnicianRouteOptimization
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobCancelReasonResponse: Codable, Identifiable {
            /// ID of the job cancel reason
            public var id: Int64
            /// Name of the job cancel reason
            public var name: String
            /// Whether the job cancel reason is active
            public var active: Bool
            /// Date/time (in UTC) when the job was created
            public var createdOn: Date
            /// Date/time (in UTC) when job was last modified
            public var modifiedOn: Date
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobHoldReasonResponse: Codable, Identifiable {
            /// Job Hold Reason Id
            public var id: Int64
            /// Job Hold Reason Name
            public var name: String
            /// Job Hold Reason Active Status
            public var active: Bool
            /// Date/time (in UTC) when the job was created
            public var createdOn: Date
            /// Date/time (in UTC) when job was last modified
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobResponse: Codable, Identifiable {
            /// ID of the job
            public var id: Int64
            /// Job number
            public var jobNumber: String
            /// ID of the job's project
            public var projectId: Int64?
            /// ID of the job's customer
            public var customerId: Int64
            /// ID of the job's location
            public var locationId: Int64
            /// Status of the job
            public var jobStatus: String
            /// Date/time (in UTC) when the job was completed
            public var completedOn: Date?
            /// ID of the job's business unit
            public var businessUnitId: Int64
            /// ID of job type
            public var jobTypeId: Int64
            /// Priority of the job
            public var priority: String
            /// ID of the job's campaign
            public var campaignId: Int64
            /// Job summary
            public var summary: String?
            /// Custom fields on the job
            public var customFields: CustomFieldApiModel
            /// Number of appointments on the job
            public var appointmentCount: Int64
            /// ID of the first appointment on the job
            public var firstAppointmentId: Int64
            /// ID of the last appointment on the job
            public var lastAppointmentId: Int64
            /// ID of the job for which this job is a recall
            public var recallForId: Int64?
            /// ID of the job for which this job is a warranty
            public var warrantyId: Int64?
            /// Object that contains:
            ///             JobId: ID of the job from which this job was generated
            ///             EmployeeId: ID of the office user or technician
            ///
            public var jobGeneratedLeadSource: JobGeneratedLeadSource?
            /// Whether the job is a no-charge job
            public var noCharge: Bool
            /// Whether notifications will be sent to customers
            public var notificationsEnabled: Bool
            /// Date/time (in UTC) when the job was created
            public var createdOn: Date
            /// ID of the user who created the job
            public var createdById: Int64
            /// Date/time (in UTC) when job was last modified
            public var modifiedOn: Date
            /// Tags on the job
            public var tagTypeIds: Int64
            /// ID of the Call that resulted in this job
            public var leadCallId: Int64?
            /// ID of the Booking that resulted in this job
            public var bookingId: Int64?
            /// ID of the Technician that sold this job
            public var soldById: Int64?
            /// List of external data attached to this job,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
            /// Customer PO
            public var customerPo: String
            /// ID of the invoice associated with this job.
            public var invoiceId: Int64
            /// ID of the Membership associated with this job.
            public var membershipId: Int64?
            /// Total amount of the job
            public var total: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobCreateRequest: Codable {
            /// ID of the job's customer
            public var customerId: Int64
            /// ID of the job's location
            public var locationId: Int64
            /// ID of the job's project
            public var projectId: Int64?
            /// ID of the job's business unit
            public var businessUnitId: Int64
            /// Object that contains:
            ///             JobId: ID of the job from which this job was generated
            ///             EmployeeId: ID of the office user or technician
            ///
            public var jobGeneratedLeadSource: JobGeneratedLeadSource?
            /// ID of job type
            public var jobTypeId: Int64
            /// Priority of the job
            public var priority: String
            /// ID of the job's campaign
            public var campaignId: Int64
            /// List of appointment information
            public var appointments: AppointmentInformation
            /// Job summary
            public var summary: String?
            /// Custom fields on the job
            public var customFields: CustomFieldModel?
            /// List of IDs of tags on the job
            public var tagTypeIds: Int64?
            /// Optional model that contains a list of external data items
            /// that should be attached to this job.
            public var externalData: ExternalDataCreateRequest?
            /// Optional model that informs if invoice should requires a signature or not
            /// if not informed will follow the rules for location and job type
            public var invoiceSignatureIsRequired: Bool?
            /// Customer PO
            public var customerPo: String?
            /// ID of the Technician who sold the job
            public var soldById: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AppointmentInformation: Codable {
            /// Start date/time (in UTC) for the appointment
            public var start: Date
            /// End date/time (in UTC) for the appointment
            public var end: Date
            /// Start date/time (in UTC) for the arrival window of the appointment
            public var arrivalWindowStart: Date?
            /// End date/time (in UTC) for the arrival window of the appointment
            public var arrivalWindowEnd: Date?
            /// List of IDs of technicians who will be assigned on the appointment
            public var technicianIds: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldModel: Codable {
            /// ID of the custom field
            public var typeId: Int64
            /// Value of the custom field
            public var value: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalDataCreateRequest: Codable {
            /// Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided.
            public var applicationGuid: String
            /// External data list.
            public var externalData: ExternalDataModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CancelJobRequest: Codable {
            /// ID of job cancel reason
            public var reasonId: Int64
            /// Memo of job cancel reason
            public var memo: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct HoldJobRequest: Codable {
            /// ID of job hold reason
            public var reasonId: Int64
            /// Memo of job hold reason
            public var memo: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CompleteJobRequest: Codable {
            /// Date on which the job was completed
            public var completedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateJobRequest: Codable {
            /// ID of the job's customer
            public var customerId: Int64
            /// ID of the job's location
            public var locationId: Int64
            /// ID of the job's business unit
            public var businessUnitId: Int64
            /// Object that contains:
            ///             JobId: ID of the job from which this job was generated
            ///             EmployeeId: ID of the office user or technician
            ///
            public var jobGeneratedLeadSource: JobGeneratedLeadSource?
            /// ID of job type
            public var jobTypeId: Int64
            /// Priority of the job
            public var priority: String
            /// ID of the job's campaign
            public var campaignId: Int64
            /// Job summary
            public var summary: String
            /// If set to true, update the business unit of invoice items on job's invoice
            public var shouldUpdateInvoiceItems: Bool
            /// List of custom fields and their values. This list must describe the full list of custom fields on the job.
            /// If job A has values for custom fields X and Y and this field only contains a model for custom field X, then
            /// the value for custom field Y on job A will be removed.
            public var customFields: CustomFieldModel
            /// List of tag types. This list must describe the full list of tags on the job. If job A has tags X and Y and
            /// this field only contains a ID for tag X, then tag Y on job A will be removed.
            public var tagTypeIds: Int64
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest
            /// Customer PO
            public var customerPo: String
            /// ID of the Technician who sold the job.
            public var soldById: Int64?
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
        public enum JobStatus: String, CaseIterable, Identifiable, Codable {
            case Scheduled, Dispatched, InProgress, Hold, Completed, Canceled
            public var id: String { rawValue }
        }
        public enum JobAppointmentStatus: String, CaseIterable, Identifiable, Codable {
            case Scheduled, Dispatched, Working, Hold, Done, Canceled
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NoteResponse: Codable {
            /// Text content of a note
            public var text: String
            /// Whether the note is pinned to the top
            public var isPinned: Bool
            /// ID of user who created this note
            public var createdById: Int64
            /// Date/time (in UTC) the note was created
            public var createdOn: Date
            /// Date/time (in UTC) the note was modified
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobNoteCreateRequest: Codable {
            /// Text content of job note
            public var text: String
            /// Whether to pin job note to the top
            public var pinToTop: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CancelReasonResponse: Codable {
            /// Job ID
            public var jobId: Int64
            /// ID of the reason
            public var reasonId: Int64
            /// Name of the reason
            public var name: String
            /// Text of the reason
            public var text: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobHistoryResponse: Codable {
            /// List of logs for the job
            public var history: JobHistoryItemModel?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobHistoryItemModel: Codable, Identifiable {
            
            public var id: Int64
            
            public var employeeId: Int64?
            
            public var eventType: String
            
            public var date: Date
            
            public var usedSchedulingTool: JobSchedulingTool
            
            public var memo: String
        }
        public enum JobSchedulingTool: String, CaseIterable, Identifiable, Codable {
            case Manual, SmartSchedule, SmartDispatch, TechnicianRouteOptimization
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MessageResponse: Codable, Identifiable {
            /// The unique identifier of the message
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MessageCreateRequest: Codable {
            /// Text content of a message
            public var body: String
            /// IDs of Users mentioned in this message
            public var recipientIds: Int64?
            /// ID of a message this message is a reply to
            public var parentMessageId: Int64?
            /// Set this to true if you want the author of Parent Message to be added to Recipients of this message
            public var addParentMessageSenderToRecipients: Bool?
            /// ID of an employee who will be marked as author of this message
            public var createdByEmployeeId: Int64
        }
        /// JobCanceledLog response model
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobCanceledLogResponse: Codable, Identifiable {
            /// ID of the job canceled log
            public var id: Int64
            /// ID of the job that has been canceled
            public var jobId: Int64
            /// ID of the job cancel reason
            public var reasonId: Int64
            /// Job canceled log additional comments
            public var memo: String?
            /// Date/time (in UTC) when the job canceled log was created
            public var createdOn: Date
            /// ID of user who canceled the job
            public var createdById: Int64
            /// Whether the job canceled log is active
            public var active: Bool
        }
        /// JobBookedLog response model
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobBookedLogResponse: Codable, Identifiable {
            /// ID of the job booked log
            public var id: Int64
            /// ID of the job that has been booked
            public var jobId: Int64
            /// ID of the job that has been booked
            public var jobAppointmentId: Int64
            /// Start date/time (in UTC) of the job
            public var start: Date
            /// Arrival window start date/time (in UTC) of the job
            public var arrivalWindowStart: Date?
            /// Arrival window end date/time (in UTC) of the job
            public var arrivalWindowEnd: Date?
            /// Date/time (in UTC) when the job booked log was created
            public var createdOn: Date
            /// ID of user who booked the job
            public var createdById: Int64
            /// Whether the job booked log is active
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldTypeResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var dataType: CustomFieldDataType
            
            public var dataTypeOptions: String?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
        }
        public enum CustomFieldDataType: String, CaseIterable, Identifiable, Codable {
            case Text, Dropdown, Numeric
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobTypeResponse: Codable, Identifiable {
            /// ID of the job type
            public var id: Int64
            /// Name of the job type
            public var name: String
            /// Business Unit Ids associated with job type
            public var businessUnitIds: Int64
            /// List of skills required to complete this job
            public var skills: String
            /// Tags here will automatically be applied to jobs booked
            public var tagTypeIds: Int64
            /// Level of urgency for this type of job
            public var priority: String
            /// Avg length of time for this job type
            public var duration: Int64
            /// A job is considered as converted if subtotal meets or exceeds this threshold
            public var soldThreshold: Double?
            /// Let’s you group other job types by class
            public var jobClass: String  // Renamed from `class`
            /// Text that is automatically added to job summary when booked
            public var summary: String
            /// When true, all jobs are considered no charge
            public var noCharge: Bool
            /// When true enforce recurring service event
            public var enforceRecurringServiceEventSelection: Bool?
            /// When true signature is required
            public var invoiceSignaturesRequired: Bool
            /// Date/time (in UTC) when job type was last modified
            public var modifiedOn: Date
            /// Date/time (in UTC) when job type was created
            public var createdOn: Date
            /// List of external data attached to this job type,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
            /// When true, job type is active
            public var active: Bool

            /// Custom CodingKeys to handle `class`
            enum CodingKeys: String, CodingKey {
                case id, name, businessUnitIds, skills, tagTypeIds, priority, duration, soldThreshold
                case jobClass = "class"  // Map `jobClass` to `"class"`
                case summary, noCharge, enforceRecurringServiceEventSelection, invoiceSignaturesRequired
                case modifiedOn, createdOn, externalData, active
            }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateJobTypeRequest: Codable {
            /// Name of the job type
            public var name: String
            /// Business Unit Ids associated with job type
            public var businessUnitIds: Int64?
            /// List of skills required to complete this job
            public var skills: String?
            /// Tags here will automatically be applied to jobs booked
            public var tagTypeIds: Int64?
            /// Level of urgency for this type of job
            public var priority: String?
            /// Avg length of time for this job type
            public var duration: Int32?
            /// A job is considered as converted if subtotal meets or exceeds this threshold
            public var soldThreshold: Double?
            /// Let’s you group other job types by class
            public var jobClass: String?  // Renamed from `class`
            /// Text that is automatically added to job summary when booked
            public var summary: String?
            /// When true, all jobs are considered no charge
            public var noCharge: Bool?
            /// When true enforce recurring service event
            public var enforceRecurringServiceEventSelection: Bool?
            /// When true signature is required
            public var invoiceSignaturesRequired: Bool?
            /// Optional model that contains a list of external data items
            /// that should be attached to this job type.
            public var externalData: ExternalDataCreateRequest?

            /// Custom CodingKeys to handle `class`
            enum CodingKeys: String, CodingKey {
                case name, businessUnitIds, skills, tagTypeIds, priority, duration, soldThreshold
                case jobClass = "class"  // Map `jobClass` to `"class"`
                case summary, noCharge, enforceRecurringServiceEventSelection, invoiceSignaturesRequired
                case externalData
            }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateJobTypeRequest: Codable {
            /// Name of the job type
            public var name: String
            /// Business Unit Ids associated with job type
            public var businessUnitIds: Int64
            /// List of skills required to complete this job
            public var skills: String
            /// Tags here will automatically be applied to jobs booked
            public var tagTypeIds: Int64
            /// Level of urgency for this type of job
            public var priority: String
            /// Avg length of time for this job type
            public var duration: Int32
            /// A job is considered as converted if subtotal meets or exceeds this threshold
            public var soldThreshold: Double?
            /// Let’s you group other job types by class
            public var jobClass: String  // Renamed from `class`
            /// Text that is automatically added to job summary when booked
            public var summary: String
            /// When true, all jobs are considered no charge
            public var noCharge: Bool
            /// When true enforce recurring service event
            public var enforceRecurringServiceEventSelection: Bool
            /// When true signature is required
            public var invoiceSignaturesRequired: Bool
            /// External data update model
            public var externalData: ExternalDataUpdateRequest

            /// Custom CodingKeys to handle `class`
            enum CodingKeys: String, CodingKey {
                case name, businessUnitIds, skills, tagTypeIds, priority, duration, soldThreshold
                case jobClass = "class"  // Map `jobClass` to `"class"`
                case summary, noCharge, enforceRecurringServiceEventSelection, invoiceSignaturesRequired
                case externalData
            }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectResponse: Codable, Identifiable {
            /// ID of the project
            public var id: Int64
            /// Project number
            public var number: String
            /// Project name
            public var name: String?
            /// Project summary
            public var summary: String?
            /// Project status
            public var status: String?
            /// Project status id
            public var statusId: Int64?
            /// Project substatus
            public var subStatus: String?
            /// Project substatus id
            public var subStatusId: Int64?
            /// ID of the project's customer
            public var customerId: Int64
            /// ID of the project's location
            public var locationId: Int64
            /// ID of the project's type
            public var projectTypeId: Int64?
            /// IDs of project managers for the project.
            public var projectManagerIds: Int64
            /// IDs of business units for the project.
            public var businessUnitIds: Int64
            /// Start date of the project
            public var startDate: Date?
            /// Target completion date of the project
            public var targetCompletionDate: Date?
            /// Actual completion date of the project
            public var actualCompletionDate: Date?
            /// Projects last modification date
            public var modifiedOn: Date?
            /// Date/time (in UTC) when the project was created
            public var createdOn: Date
            /// Custom fields on the project
            public var customFields: CustomFieldApiModel
            /// List of external data attached to this project,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
            /// List of jobs associated with this project.
            public var jobIds: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateProjectRequest: Codable {
            /// ID of the project's location
            public var locationId: Int64
            /// ID of the project's customer
            public var customerId: Int64?
            /// ID of the project's type
            public var projectTypeId: Int64?
            /// IDs of the project's managers
            public var projectManagerIds: Int64?
            /// Project name
            public var name: String?
            /// Project summary
            public var summary: String?
            /// Project status id
            public var statusId: Int64?
            /// Project sub status id
            public var subStatusId: Int64?
            /// Start date of the project
            public var startDate: Date?
            /// Target completion date of the project
            public var targetCompletionDate: Date?
            /// Actual completion date of the project
            public var actualCompletionDate: Date?
            /// Project record’s custom fields
            public var customFields: CustomFieldCreateOrUpdateModel?
            /// Optional model that contains a list of external data items
            /// that should be attached to this project.
            public var externalData: ExternalDataCreateRequest?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldCreateOrUpdateModel: Codable {
            /// ID of the custom field
            public var typeId: Int64
            /// Value of the custom field
            public var value: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateProjectRequest: Codable {
            /// IDs of the project's managers
            public var projectManagerIds: Int64
            /// IDs of the project's jobs
            public var jobIds: Int64
            /// Project name
            public var name: String
            /// Project summary
            public var summary: String
            /// Project status id
            public var statusId: Int64
            /// Project sub status id
            public var subStatusId: Int64
            /// Project type id
            public var projectTypeId: Int64?
            /// Start date of the project
            public var startDate: Date
            /// Target completion date of the project
            public var targetCompletionDate: Date
            /// Actual completion date of the project
            public var actualCompletionDate: Date
            /// Project record’s custom fields
            public var customFields: CustomFieldCreateOrUpdateModel
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectNoteCreateRequest: Codable {
            /// Text content of job note
            public var text: String
            /// Whether to pin job note to the top
            public var pinToTop: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectStatusResponse: Codable, Identifiable {
            /// ID of the project status
            public var id: Int64
            /// Name of the project status
            public var name: String
            /// Order of the project status
            public var order: Int32
            /// Date/time (in UTC) when project status was last modified
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectSubStatusResponse: Codable, Identifiable {
            /// ID of the project sub status
            public var id: Int64
            /// Name of the project sub status
            public var name: String
            /// Id of the parent status
            public var statusId: Int64
            /// Order of the project status
            public var order: Int32
            /// Date/time (in UTC) when project sub status was last modified
            public var modifiedOn: Date
            /// When true, project sub status is active
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectTypeResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var description: String
            
            public var createdById: Int64?
        }
    }
}
public extension APIs {
    class JobPlanningAndManagement: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "jpm")
        }
        public func appointmentsGet(id: Int64, tenant: Int64) async -> Result<Models.JobPlanningAndManagement.AppointmentResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments/\(id)"
            return await getReq(Models.JobPlanningAndManagement.AppointmentResponse.self, endpoint: endpoint)
        }
        public func appointmentsDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments/\(id)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func appointmentsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AppointmentsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Format - int64. Return all appointments for this job
            public var jobId: Int64?
            /// Format - int64. Return all appointments for jobs that are part of this project
            public var projectId: Int64?
            /// Return all appointments with this appointment number
            public var number: String?
            /// Return items with specified status AppointmentStatus\
            /// Values: [Scheduled, Dispatched, Working, Hold, Done, Canceled]
            public var status: String?
            /// Format - date-time (as date-time in RFC3339). Return appointments that start on or after the specified date/time (in UTC)
            public var startsOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return appointments that start before the specified date/time (in UTC)
            public var startsBefore: Date?
            /// Format - int64. Return appointments this technician is assigned to
            public var technicianId: Int64?
            /// Format - int64. Return appointments for the specified Customer
            public var customerId: Int64?
            /// Return appointments that are unused
            public var unused: Bool?
            /// Format - date-time (as date-time in RFC3339). Return appointments modified before a certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return appointments modified on or after a certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return appointments created on or after a certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return appointments created before a certain date/time (in UTC)
            public var createdBefore: Date?
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
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func appointmentsGetList(tenant: Int64, query: AppointmentsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.AppointmentResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.AppointmentResponse>.self, endpoint: endpoint, params: query)
        }
        public func appointmentsAdd(tenant: Int64, body: Models.JobPlanningAndManagement.AppointmentAddRequest) async -> Result<Models.JobPlanningAndManagement.AppointmentResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments"
            return await bodiedReq(Models.JobPlanningAndManagement.AppointmentResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func appointmentsReschedule(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.AppointmentRescheduleRequest) async -> Result<Models.JobPlanningAndManagement.AppointmentResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments/\(id)/reschedule"
            return await bodiedReq(Models.JobPlanningAndManagement.AppointmentResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func appointmentsHold(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.HoldAppointmentRequest) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments/\(id)/hold"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PUT")
        }
        public func appointmentsRemoveHold(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments/\(id)/hold"
            return await delReq(endpoint: endpoint)
        }
        public func appointmentsUpdateSpecialInstructions(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.UpdateAppointmentSpecialInstructionsRequest) async -> Result<Models.JobPlanningAndManagement.AppointmentResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments/\(id)/special-instructions"
            return await bodiedReq(Models.JobPlanningAndManagement.AppointmentResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func appointmentsConfirm(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments/\(id)/confirmation"
            return await bodiedRawReqNoResponse(endpoint: endpoint, body: Data(), method: "PUT")
        }
        public func appointmentsRemoveConfirmation(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/appointments/\(id)/confirmation"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func exportJobs
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportJobsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportJobs(tenant: Int64, query: ExportJobsQuery? = nil) async -> Result<Models.JobPlanningAndManagement.ExportJobsResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/export/jobs"
            return await getReq(Models.JobPlanningAndManagement.ExportJobsResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportProjects
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportProjectsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportProjects(tenant: Int64, query: ExportProjectsQuery? = nil) async -> Result<Models.JobPlanningAndManagement.ExportProjectsResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/export/projects"
            return await getReq(Models.JobPlanningAndManagement.ExportProjectsResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportAppointments
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportAppointmentsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportAppointments(tenant: Int64, query: ExportAppointmentsQuery? = nil) async -> Result<Models.JobPlanningAndManagement.ExportAppointmentsResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/export/appointments"
            return await getReq(Models.JobPlanningAndManagement.ExportAppointmentsResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportJobCancelReasons
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportJobCancelReasonsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportJobCancelReasons(tenant: Int64, query: ExportJobCancelReasonsQuery? = nil) async -> Result<Models.JobPlanningAndManagement.ExportJobCanceledLogResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/export/job-canceled-logs"
            return await getReq(Models.JobPlanningAndManagement.ExportJobCanceledLogResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportJobNotes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportJobNotesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportJobNotes(tenant: Int64, query: ExportJobNotesQuery? = nil) async -> Result<Models.JobPlanningAndManagement.ExportJobNotesResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/export/job-notes"
            return await getReq(Models.JobPlanningAndManagement.ExportJobNotesResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportProjectNotes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportProjectNotesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportProjectNotes(tenant: Int64, query: ExportProjectNotesQuery? = nil) async -> Result<Models.JobPlanningAndManagement.ExportProjectNotesResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/export/project-notes"
            return await getReq(Models.JobPlanningAndManagement.ExportProjectNotesResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportJobHistory
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportJobHistoryQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportJobHistory(tenant: Int64, query: ExportJobHistoryQuery? = nil) async -> Result<Models.JobPlanningAndManagement.ExportJobHistoryResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/export/job-history"
            return await getReq(Models.JobPlanningAndManagement.ExportJobHistoryResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func jobCancelReasonsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobCancelReasonsGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// What kind of items should be returned (active and inactive items will be returned by default)\
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
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func jobCancelReasonsGetList(tenant: Int64, query: JobCancelReasonsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.JobCancelReasonResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/job-cancel-reasons"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.JobCancelReasonResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func jobHoldReasonsGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobHoldReasonsGetQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// What kind of items should be returned (active and inactive items will be returned by default)\
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
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func jobHoldReasonsGet(tenant: Int64, query: JobHoldReasonsGetQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.JobHoldReasonResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/job-hold-reasons"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.JobHoldReasonResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func jobsGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobsGetQuery: URLQueryConvertible {
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
        }
        public func jobsGet(id: Int64, tenant: Int64, query: JobsGetQuery? = nil) async -> Result<Models.JobPlanningAndManagement.JobResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)"
            return await getReq(Models.JobPlanningAndManagement.JobResponse.self, endpoint: endpoint, params: query)
        }
        public func jobsUpdate(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.UpdateJobRequest) async -> Result<Models.JobPlanningAndManagement.JobResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)"
            return await bodiedReq(Models.JobPlanningAndManagement.JobResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func jobsCreate(tenant: Int64, body: Models.JobPlanningAndManagement.JobCreateRequest) async -> Result<Models.JobPlanningAndManagement.JobResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs"
            return await bodiedReq(Models.JobPlanningAndManagement.JobResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func jobsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobsGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filters by job number
            public var number: String?
            /// Format - int64. Filters by project ID
            public var projectId: Int64?
            /// Format - int64. Filters by booking ID that resulted in this job
            public var bookingId: Int64?
            /// Filters by job status\
            /// Values: [Scheduled, Dispatched, InProgress, Hold, Completed, Canceled]
            public var jobStatus: String?
            /// Filters by appointment status. Return a job if it has any appointment with the specified status.\
            /// Values: [Scheduled, Dispatched, Working, Hold, Done, Canceled]
            public var appointmentStatus: String?
            /// Filters by priority. Supported priorities are "Low", "Normal", "High", "Urgent"
            public var priority: String?
            /// Format - date-time (as date-time in RFC3339). Return jobs whose first appointment starts on or after date/time (in UTC). Use with
            /// "firstAppointmentStartsBefore" to find jobs whose first appointment is within the specified date range.
            public var firstAppointmentStartsOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return jobs whose first appointment starts before date/time (in UTC)
            public var firstAppointmentStartsBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return jobs if any appointment starts after date/time (in UTC)
            public var appointmentStartsOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return jobs if any appointment starts after date/time (in UTC)
            public var appointmentStartsBefore: Date?
            /// Format - int64. Return jobs if technician is assigned to any appointment
            public var technicianId: Int64?
            /// Format - int64. Filters by job's customer ID
            public var customerId: Int64?
            /// Format - int64. Filters by job's location ID
            public var locationId: Int64?
            /// Format - int64. Filters by the technician who sold the job
            public var soldById: Int64?
            /// Format - int64. Filters by job type ID
            public var jobTypeId: Int64?
            /// Format - int64. Filters by job's campaign ID
            public var campaignId: Int64?
            /// Format - int64. Filters by job's business unit ID
            public var businessUnitId: Int64?
            /// Format - int64. Filters by job's invoice ID
            public var invoiceId: Int64?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return jobs that are completed after a certain date/time (in UTC)
            public var completedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return jobs that are completed before a certain date/time (in UTC)
            public var completedBefore: Date?
            /// Return jobs that have at least one of provided Tag Type assigned
            public var tagTypeIds: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn, Priority.
            public var sort: String?
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
            /// If set to true, return jobs that have unused appointments.
            public var hasUnusedAppointments: Bool?
        }
        public func jobsGetList(tenant: Int64, query: JobsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.JobResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.JobResponse>.self, endpoint: endpoint, params: query)
        }
        public func jobsCancel(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.CancelJobRequest) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/cancel"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PUT")
        }
        public func jobsRemoveCancellation(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/remove-cancellation"
            return await bodiedRawReqNoResponse(endpoint: endpoint, body: Data(), method: "PUT")
        }
        public func jobsHold(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.HoldJobRequest) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/hold"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PUT")
        }
        public func jobsComplete(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.CompleteJobRequest) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/complete"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PUT")
        }
        /// Query Parameters for func jobsGetNotes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobsGetNotesQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func jobsGetNotes(id: Int64, tenant: Int64, query: JobsGetNotesQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.NoteResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/notes"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.NoteResponse>.self, endpoint: endpoint, params: query)
        }
        public func jobsCreateNote(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.JobNoteCreateRequest) async -> Result<Models.JobPlanningAndManagement.NoteResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/notes"
            return await bodiedReq(Models.JobPlanningAndManagement.NoteResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func jobsGetCancelReasons
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobsGetCancelReasonsQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
        }
        public func jobsGetCancelReasons(tenant: Int64, query: JobsGetCancelReasonsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.CancelReasonResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/cancel-reasons"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.CancelReasonResponse>.self, endpoint: endpoint, params: query)
        }
        public func jobsGetHistory(id: Int64, tenant: Int64) async -> Result<Models.JobPlanningAndManagement.JobHistoryResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/history"
            return await getReq(Models.JobPlanningAndManagement.JobHistoryResponse.self, endpoint: endpoint)
        }
        public func jobsCreateMessage(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.MessageCreateRequest) async -> Result<Models.JobPlanningAndManagement.MessageResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/messages"
            return await bodiedReq(Models.JobPlanningAndManagement.MessageResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func jobsGetJobCanceledLogs
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobsGetJobCanceledLogsQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func jobsGetJobCanceledLogs(id: Int64, tenant: Int64, query: JobsGetJobCanceledLogsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.JobCanceledLogResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/canceled-log"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.JobCanceledLogResponse>.self, endpoint: endpoint, params: query)
        }
        public func jobsGetBookedLog(id: Int64, tenant: Int64) async -> Result<Models.JobPlanningAndManagement.JobBookedLogResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/\(id)/booked-log"
            return await getReq(Models.JobPlanningAndManagement.JobBookedLogResponse.self, endpoint: endpoint)
        }
        /// Query Parameters for func jobsGetCustomFieldTypes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobsGetCustomFieldTypesQuery: URLQueryConvertible {
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
            public var sort: String?
        }
        public func jobsGetCustomFieldTypes(tenant: Int64, query: JobsGetCustomFieldTypesQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.CustomFieldTypeResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/jobs/custom-fields"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.CustomFieldTypeResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func jobTypesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobTypesGetListQuery: URLQueryConvertible {
            /// Filters by job type name
            public var name: String?
            /// Format - int32. Minimum length of time for this job type (in seconds)
            public var minDuration: Int32?
            /// Format - int32. Maximum length of time for this job type (in seconds)
            public var maxDuration: Int32?
            /// Level of urgency for this type of job
            public var priority: String?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Orders results by a field. Supported fields are "id", "modifiedOn", and "createdOn"
            public var orderBy: String?
            /// Specifies order direction of results. Supported values are "asc"/"ascending" and "desc"/"descending"
            public var orderByDirection: String?
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
        public func jobTypesGetList(tenant: Int64, query: JobTypesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.JobTypeResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/job-types"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.JobTypeResponse>.self, endpoint: endpoint, params: query)
        }
        public func jobTypesCreate(tenant: Int64, body: Models.JobPlanningAndManagement.CreateJobTypeRequest) async -> Result<Models.JobPlanningAndManagement.JobTypeResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/job-types"
            return await bodiedReq(Models.JobPlanningAndManagement.JobTypeResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func jobTypesGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobTypesGetQuery: URLQueryConvertible {
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
        }
        public func jobTypesGet(id: Int64, tenant: Int64, query: JobTypesGetQuery? = nil) async -> Result<Models.JobPlanningAndManagement.JobTypeResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/job-types/\(id)"
            return await getReq(Models.JobPlanningAndManagement.JobTypeResponse.self, endpoint: endpoint, params: query)
        }
        public func jobTypesUpdate(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.UpdateJobTypeRequest) async -> Result<Models.JobPlanningAndManagement.JobTypeResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/job-types/\(id)"
            return await bodiedReq(Models.JobPlanningAndManagement.JobTypeResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func projectsGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectsGetQuery: URLQueryConvertible {
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
        }
        public func projectsGet(id: Int64, tenant: Int64, query: ProjectsGetQuery? = nil) async -> Result<Models.JobPlanningAndManagement.ProjectResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects/\(id)"
            return await getReq(Models.JobPlanningAndManagement.ProjectResponse.self, endpoint: endpoint, params: query)
        }
        public func projectsUpdate(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.UpdateProjectRequest) async -> Result<Models.JobPlanningAndManagement.ProjectResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects/\(id)"
            return await bodiedReq(Models.JobPlanningAndManagement.ProjectResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func projectsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Format - int64. Filters by customer ID
            public var customerId: Int64?
            /// Format - int64. Filters by location ID
            public var locationId: Int64?
            /// Format - int64. Return projects if it contains the specified project type
            public var projectTypeId: Int64?
            /// Format - int64. Return projects if it contains the specified invoice
            public var invoiceId: Int64?
            /// Format - int64. Return project if technician is assigned to any appointments on any job in the project
            public var technicianId: Int64?
            /// Format - int64. Return project if it contains the specified job
            public var jobId: Int64?
            /// Format - int64. Return project if it contains the specified appointment in the project's jobs
            public var appointmentId: Int64?
            /// Filters by id of managers for matching project
            public var projectManagerIds: String?
            /// Returns projects which have at least one of the provided business units assigned
            public var businessUnitIds: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return projects that start before date
            public var startsBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return projects that start on or after date
            public var startsOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return projects that are completed before date
            public var completedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return projects that are completed on or after date
            public var completedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return projects whose target completion date is before date
            public var targetCompletionDateBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return projects whose target completion date is on or after date
            public var targetCompletionDateOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return projects whose last modification date is before date
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return projects whose last modification date is on or after date
            public var modifiedOnOrAfter: Date?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Returns projects which have one of the provided statuses.
            /// "None" could be passed as one of the values to include projects without a status in the resulting collection.
            public var status: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn, Name, TargetCompletionDate.
            public var sort: String?
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
        }
        public func projectsGetList(tenant: Int64, query: ProjectsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.ProjectResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.ProjectResponse>.self, endpoint: endpoint, params: query)
        }
        public func projectsCreate(tenant: Int64, body: Models.JobPlanningAndManagement.CreateProjectRequest) async -> Result<Models.JobPlanningAndManagement.ProjectResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects"
            return await bodiedReq(Models.JobPlanningAndManagement.ProjectResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func projectsGetNotes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectsGetNotesQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func projectsGetNotes(id: Int64, tenant: Int64, query: ProjectsGetNotesQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.NoteResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects/\(id)/notes"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.NoteResponse>.self, endpoint: endpoint, params: query)
        }
        public func projectsCreateNote(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.ProjectNoteCreateRequest) async -> Result<Models.JobPlanningAndManagement.NoteResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects/\(id)/notes"
            return await bodiedReq(Models.JobPlanningAndManagement.NoteResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func projectsAttachJob(id: Int64, jobId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects/\(id)/attach-job/\(jobId)"
            return await bodiedRawReqNoResponse(endpoint: endpoint, body: Data(), method: "POST")
        }
        public func projectsDetachJob(jobId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects/detach-job/\(jobId)"
            return await bodiedRawReqNoResponse(endpoint: endpoint, body: Data(), method: "POST")
        }
        public func projectsCreateMessage(id: Int64, tenant: Int64, body: Models.JobPlanningAndManagement.MessageCreateRequest) async -> Result<Models.JobPlanningAndManagement.MessageResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects/\(id)/messages"
            return await bodiedReq(Models.JobPlanningAndManagement.MessageResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func projectsGetCustomFieldTypes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectsGetCustomFieldTypesQuery: URLQueryConvertible {
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
            public var sort: String?
        }
        public func projectsGetCustomFieldTypes(tenant: Int64, query: ProjectsGetCustomFieldTypesQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.CustomFieldTypeResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/projects/custom-fields"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.CustomFieldTypeResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func projectStatusesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectStatusesGetListQuery: URLQueryConvertible {
            /// Filters by project status name
            public var name: String?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
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
            /// Available fields are: Id, Name, Order, ModifiedOn, CreatedOn.
            public var sort: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
        }
        public func projectStatusesGetList(tenant: Int64, query: ProjectStatusesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.ProjectStatusResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/project-statuses"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.ProjectStatusResponse>.self, endpoint: endpoint, params: query)
        }
        public func projectStatusesGet(id: Int64, tenant: Int64) async -> Result<Models.JobPlanningAndManagement.ProjectStatusResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/project-statuses/\(id)"
            return await getReq(Models.JobPlanningAndManagement.ProjectStatusResponse.self, endpoint: endpoint)
        }
        /// Query Parameters for func projectSubStatusesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectSubStatusesGetListQuery: URLQueryConvertible {
            /// Filters by project sub status name
            public var name: String?
            /// Format - int64. Filters by parent project status id
            public var statusId: Int64?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
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
            /// Available fields are: Id, Name, Order, StatusId, ModifiedOn, CreatedOn.
            public var sort: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// What kind of items should be returned (active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
        }
        public func projectSubStatusesGetList(tenant: Int64, query: ProjectSubStatusesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.ProjectSubStatusResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/project-substatuses"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.ProjectSubStatusResponse>.self, endpoint: endpoint, params: query)
        }
        public func projectSubStatusesGet(id: Int64, tenant: Int64) async -> Result<Models.JobPlanningAndManagement.ProjectSubStatusResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/project-substatuses/\(id)"
            return await getReq(Models.JobPlanningAndManagement.ProjectSubStatusResponse.self, endpoint: endpoint)
        }
        public func projectTypesGet(id: Int64, tenant: Int64) async -> Result<Models.JobPlanningAndManagement.ProjectTypeResponse, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/project-types/\(id)"
            return await getReq(Models.JobPlanningAndManagement.ProjectTypeResponse.self, endpoint: endpoint)
        }
        /// Query Parameters for func projectTypesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ProjectTypesGetListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func projectTypesGetList(tenant: Int64, query: ProjectTypesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.JobPlanningAndManagement.ProjectTypeResponse>, APIError> {
            let endpoint = "/jpm/v2/tenant/\(tenant)/project-types"
            return await getReq(Models.PaginatedResponse<Models.JobPlanningAndManagement.ProjectTypeResponse>.self, endpoint: endpoint, params: query)
        }
    }
}
