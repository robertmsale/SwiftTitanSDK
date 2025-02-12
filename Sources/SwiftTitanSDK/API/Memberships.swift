//
//  Memberships.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct Memberships {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerMembershipResponse: Codable, Identifiable {
            /// Customer membership ID
            public var id: Int64
            /// When customer membership was created
            public var createdOn: Date
            /// ID of the user that created this membership
            public var createdById: Int64?
            /// When customer membership was last modified
            public var modifiedOn: Date
            /// Follow up on date
            public var followUpOn: Date
            /// When customer membership was or will be cancelled
            public var cancellationDate: Date?
            /// Beginning date of customer membership
            public var from: Date?
            /// Next scheduled billing date
            public var nextScheduledBillDate: Date?
            /// End date of customer membership
            public var to: Date?
            /// How often the customer membership is billed
            public var billingFrequency: MembershipRecurrenceType
            /// Renewal billing frequency
            public var renewalBillingFrequency: MembershipRecurrenceType?
            /// Current status of the customer membership
            public var status: MembershipStatus
            /// Follow-up status of the customer membership
            public var followUpStatus: OpportunityStatus
            /// Whether customer membership is active
            public var active: Bool
            /// Initial deferred revenue
            public var initialDeferredRevenue: Double
            /// Duration of customer membership in months
            public var duration: Int32?
            /// Renewal duration
            public var renewalDuration: Int32?
            /// Business unit ID
            public var businessUnitId: Int64
            /// Customer ID of membership
            public var customerId: Int64
            /// The membership type ID of the customer membership
            public var membershipTypeId: Int64
            /// ID of the user that activated this membership
            public var activatedById: Int64?
            /// ID of the invoice item that is the sale task of this membership
            public var activatedFromId: Int64?
            /// ID of the invoice template used for membership billing
            public var billingTemplateId: Int64?
            /// Cancellation balance invoice ID
            public var cancellationBalanceInvoiceId: Int64?
            /// ID of the invoice that either charged or refunded the deferred revenue balance of the customer membership
            public var cancellationInvoiceId: Int64?
            /// ID of custom followup status
            public var followUpCustomStatusId: Int64?
            /// ID of location for this customer membership
            public var locationId: Int64?
            /// Preferred payment method ID
            public var paymentMethodId: Int64?
            /// ID of payment type
            public var paymentTypeId: Int64?
            /// Recurring Location ID
            public var recurringLocationId: Int64?
            /// Task ID that renews this membership
            public var renewalMembershipTaskId: Int64?
            /// ID of the user that renewed this membership
            public var renewedById: Int64?
            /// ID of the user that was credited for the sale of this membership
            public var soldById: Int64?
            /// Customer Purchase Order
            public var customerPo: String?
            /// Internal import ID label
            public var importId: String?
            /// Memo for customer membership
            public var memo: String?
            /// List of custom fields
            public var customFields: CustomFieldResponse
        }
        public enum MembershipRecurrenceType: String, CaseIterable, Identifiable, Codable {
            case OneTime, Monthly, EveryOtherMonth, Quarterly, BiAnnual, Annual
            public var id: String { rawValue }
        }
        public enum MembershipStatus: String, CaseIterable, Identifiable, Codable {
            case Active, Suspended, Expired, Canceled, Deleted
            public var id: String { rawValue }
        }
        public enum OpportunityStatus: String, CaseIterable, Identifiable, Codable {
            case NotAttempted, Unreachable, Contacted, Won, Dismissed
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldResponse: Codable {
            /// Custom field type id
            public var typeId: Int64
            /// Custom field name
            public var name: String
            /// Custom field value
            public var value: String?
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldTypeResponse: Codable, Identifiable {
            /// The ID of the custom field.
            public var id: Int64
            /// The name of the custom field.
            public var name: String
            /// Indicates the data type of the custom field.
            public var dataType: CustomFieldDataType
            /// Indicates the dropdown options if the custom field is a dropdown data type.
            public var dataTypeOptions: String?
            /// The date the custom field was created in UTC date / time.
            public var createdOn: Date
            /// The last date the custom field was modified in UTC date / time.
            public var modifiedOn: Date
        }
        public enum CustomFieldDataType: String, CaseIterable, Identifiable, Codable {
            case Text, Dropdown, Numeric
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerMembershipStatusChangeItemResponse: Codable, Identifiable {
            /// ID of the status change record
            public var id: Int64
            /// Previous status value
            public var oldStatus: MembershipStatus
            /// New status value
            public var newStatus: MembershipStatus
            /// Optional note attached to this status change
            public var note: String?
            /// When this status change record was created
            public var createdOn: Date
            /// ID of the user that created this status change record
            public var createdById: Int64?
        }
        /// Default response when creating object with a new ID, or updating object by specified ID.
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ModificationResponse: Codable, Identifiable {
            /// The ID of created/updated object
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerMembershipUpdateRequest: Codable {
            /// ID of the Business Unit associated with this membership
            public var businessUnitId: Int64
            /// Next date that this membership will be billed on
            public var nextScheduledBillDate: Date?
            /// Status of the membership
            public var status: MembershipStatus
            /// Memo text field
            public var memo: String
            /// The starting date of this membership
            public var from: Date
            /// The end date of this membership (null if ongoing)
            public var to: Date?
            /// ID of the user that was credited for the sale of this membership
            public var soldById: Int64?
            /// The ID of the invoice template used to bill this membership.
            /// Can either be a "settings template" (when invoice template is shared – in this case new invoice template will be created),
            /// or be a new invoice template created specifically for this customer membership.
            public var billingTemplateId: Int64?
            /// Discount location ID of this membership (null if all locations)
            public var locationId: Int64?
            /// Required if RecurringLocationId is set.
            /// Determines how many of the customer's locations that recurring services should be added to: all, single, or none (which deletes existing recurring services).
            public var recurringServiceAction: RecurringServiceAction
            /// The location at which recurring services are scheduled (null if all locations)
            public var recurringLocationId: Int64?
            /// The ID of the payment method (credit card or bank account) that should be used for this membership. This
            /// field is mutually exclusive with payment type. Only one or the other can be set at a time.
            public var paymentMethodId: Int64?
            /// The payment type (cash, check, etc) that should be used for this membership. This field is mutually
            /// exclusive with payment type. Only one or the other can be set at a time. Setting payment type means we will
            /// not automatically use a payment method to bill the membership and payment will have to be collected manually.
            public var paymentTypeId: Int64?
            /// The ID of the service that will be used as the default to renew this membership.
            public var renewalMembershipTaskId: Int64?
            /// The amount of deferred revenue that this membership should start with that is not accounted for
            /// in the sale task.
            public var initialDeferredRevenue: Double
            /// The ID of the invoice created upon membership cancellation in order to zero out the deferred revenue balance.
            public var cancellationBalanceInvoiceId: Int64?
            /// The ID of the invoice optionally created upon membership cancellation in order to charge (or refund) the
            /// customer if deferred revenue balance is not 0.
            public var cancellationInvoiceId: Int64?
        }
        public enum RecurringServiceAction: String, CaseIterable, Identifiable, Codable {
            case None, Single, All
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipSaleInvoiceCreateResponse: Codable {
            /// ID of sale invoice created
            public var invoiceId: Int64
            /// ID of customer membership that was created
            public var customerMembershipId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipSaleInvoiceCreateRequest: Codable {
            /// ID of the customer you are creating the Membership Sale Invoice for
            public var customerId: Int64
            /// Business unit ID
            public var businessUnitId: Int64
            /// ID of the sale task that is creating the membership
            public var saleTaskId: Int64
            /// ID of the duration/billing option to be used
            public var durationBillingId: Int64
            /// Discount location ID of this membership (null if all locations)
            public var locationId: Int64?
            /// Required if RecurringLocationId is set.
            /// Determines how many of the customer's locations that recurring services should be added to: all, single, or none (which deletes existing recurring services).
            public var recurringServiceAction: RecurringServiceAction
            /// The location at which recurring services are scheduled (null if all locations)
            public var recurringLocationId: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportMembershipTypeResponse: Codable, Identifiable {
            /// Membership type ID
            public var id: Int64
            /// When membership type was created
            public var createdOn: Date
            /// ID of the user that created this membership type
            public var createdById: Int64?
            /// When membership type was modified
            public var modifiedOn: Date
            /// Internal import ID label
            public var importId: String?
            /// Billing template ID
            public var billingTemplateId: Int64?
            /// Membership type name
            public var name: String
            /// Whether membership type is active
            public var active: Bool
            /// Membership discount mode
            public var discountMode: DiscountMode
            /// Membership location target
            public var locationTarget: MembershipLocationTarget
            /// Membership revenue recognition mode
            public var revenueRecognitionMode: RevenueRecognitionMode
            /// Whether invoice templates should be auto-calculated
            public var autoCalculateInvoiceTemplates: Bool
            /// Whether membership pricing table should be used
            public var useMembershipPricingTable: Bool
            /// Whether membership savings should be displayed
            public var showMembershipSavings: Bool
        }
        public enum DiscountMode: String, CaseIterable, Identifiable, Codable {
            case Basic, Units, Categories
            public var id: String { rawValue }
        }
        public enum MembershipLocationTarget: String, CaseIterable, Identifiable, Codable {
            case AllLocations, SingleLocation
            public var id: String { rawValue }
        }
        public enum RevenueRecognitionMode: String, CaseIterable, Identifiable, Codable {
            case PointOfSale, Deferred
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportRecurringServiceTypeResponse: Codable, Identifiable {
            /// Recurring service type ID
            public var id: Int64
            /// When recurring service type was created
            public var createdOn: Date
            /// ID of the user that created this recurring service type
            public var createdById: Int64?
            /// When recurring service type was modified
            public var modifiedOn: Date
            /// Whether recurring service type is active
            public var active: Bool
            /// The recurrence type (e.g. Daily, Weekly, Monthly)
            public var recurrenceType: ServiceRecurrenceType
            /// The recurrence interval for the given recurrence type
            public var recurrenceInterval: Int32
            /// A list of months when the recurring service occurs, if it is a seasonal recurrence type
            public var recurrenceMonths: Month
            /// The recurrence duration type
            public var durationType: ServiceRecurrenceDuration
            /// The recurrence duration length (number of events)
            public var durationLength: Int32
            /// Invoice template ID
            public var invoiceTemplateId: Int64?
            /// Business unit ID
            public var businessUnitId: Int64?
            /// Job type ID
            public var jobTypeId: Int64?
            /// Priority
            public var priority: Priority
            /// Campaign ID
            public var campaignId: Int64?
            /// Job summary
            public var jobSummary: String?
            /// Recurring service type name
            public var name: String?
            /// Import ID
            public var importId: String?
        }
        public enum ServiceRecurrenceType: String, CaseIterable, Identifiable, Codable {
            case Weekly, Monthly, Seasonal, Daily, NthWeekdayOfMonth
            public var id: String { rawValue }
        }
        public enum Month: String, CaseIterable, Identifiable, Codable {
            case January, February, March, April, May, June, July, August, September, October, November, December
            public var id: String { rawValue }
        }
        public enum ServiceRecurrenceDuration: String, CaseIterable, Identifiable, Codable {
            case Continuous, NumberOfVisits
            public var id: String { rawValue }
        }
        public enum Priority: String, CaseIterable, Identifiable, Codable {
            case Low, Normal, High, Urgent
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportCustomerMembershipResponse: Codable, Identifiable {
            /// Customer membership ID
            public var id: Int64
            /// When customer membership was created
            public var createdOn: Date
            /// ID of the user that created this membership
            public var createdById: Int64?
            /// When customer membership was last modified
            public var modifiedOn: Date
            /// Follow up on date
            public var followUpOn: Date
            /// When customer membership was or will be cancelled
            public var cancellationDate: Date?
            /// Beginning date of customer membership
            public var from: Date?
            /// Next scheduled billing date
            public var nextScheduledBillDate: Date?
            /// End date of customer membership
            public var to: Date?
            /// How often the customer membership is billed
            public var billingFrequency: MembershipRecurrenceType
            /// Renewal billing frequency
            public var renewalBillingFrequency: MembershipRecurrenceType?
            /// Current status of the customer membership
            public var status: MembershipStatus
            /// Follow-up status of the customer membership
            public var followUpStatus: OpportunityStatus
            /// Whether customer membership is active
            public var active: Bool
            /// Initial deferred revenue
            public var initialDeferredRevenue: Double
            /// Duration of customer membership in months
            public var duration: Int32?
            /// Renewal duration
            public var renewalDuration: Int32?
            /// Business unit ID
            public var businessUnitId: Int64
            /// Customer ID of membership
            public var customerId: Int64
            /// The membership type ID of the customer membership
            public var membershipTypeId: Int64
            /// ID of the user that activated this membership
            public var activatedById: Int64?
            /// ID of the invoice item that is the sale task of this membership
            public var activatedFromId: Int64?
            /// ID of the invoice template used for membership billing
            public var billingTemplateId: Int64?
            /// Cancellation balance invoice ID
            public var cancellationBalanceInvoiceId: Int64?
            /// ID of the invoice that either charged or refunded the deferred revenue balance of the customer membership
            public var cancellationInvoiceId: Int64?
            /// ID of custom followup status
            public var followUpCustomStatusId: Int64?
            /// ID of location for this customer membership
            public var locationId: Int64?
            /// Preferred payment method ID
            public var paymentMethodId: Int64?
            /// ID of payment type
            public var paymentTypeId: Int64?
            /// Recurring Location ID
            public var recurringLocationId: Int64?
            /// Task ID that renews this membership
            public var renewalMembershipTaskId: Int64?
            /// ID of the user that renewed this membership
            public var renewedById: Int64?
            /// ID of the user that was credited for the sale of this membership
            public var soldById: Int64?
            /// Customer Purchase Order
            public var customerPo: String?
            /// Internal import ID label
            public var importId: String?
            /// Memo for customer membership
            public var memo: String?
            /// List of custom fields
            public var customFields: CustomFieldResponse
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportInvoiceTemplateResponse: Codable, Identifiable {
            /// Invoice template ID
            public var id: Int64
            /// Invoice template name (used only for shared invoice templates)
            public var name: String?
            /// Invoice template creation date
            public var createdOn: Date
            /// ID of the user that created invoice template
            public var createdById: Int64?
            /// Invoice template modification date
            public var modifiedOn: Date
            /// Whether invoice template is active
            public var active: Bool
            /// Invoice template total
            public var total: Double
            /// Whether invoice template is shared (i.e. visible on the Settings page)
            public var isSettingsTemplate: Bool
            /// Import ID
            public var importId: String?
            /// A list of invoice template items
            public var items: InvoiceTemplateItemResponse
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceTemplateItemResponse: Codable, Identifiable {
            /// Invoice template item ID
            public var id: Int64
            /// Linked SKU ID
            public var skuId: Int64
            /// The type of linked SKU
            public var skuType: SkuType
            /// Quantity
            public var quantity: Double
            /// Unit price
            public var unitPrice: Double
            /// Whether invoice item is add-on
            public var isAddOn: Bool
            /// Import ID
            public var importId: String?
            /// The invoice item ID that created this invoice template item via ModifyMembershipWorkflowAction
            public var workflowActionItemId: Int64?
            /// Item description
            public var description: String?
            /// Materials cost
            public var cost: Double?
            /// Sold/billable hours
            public var hours: Double?
        }
        public enum SkuType: String, CaseIterable, Identifiable, Codable {
            case Service, Material, Equipment, PriceModifier
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportLocationRecurringServiceResponse: Codable, Identifiable {
            /// Recurring service ID
            public var id: Int64
            /// Recurring service name
            public var name: String
            /// Whether recurring service is active
            public var active: Bool
            /// When recurring service was created
            public var createdOn: Date
            /// ID of the user that created this recurring service
            public var createdById: Int64?
            /// When recurring service was modified
            public var modifiedOn: Date
            /// Internal import ID label
            public var importId: String?
            /// Customer membership ID
            public var membershipId: Int64?
            /// Location ID
            public var locationId: Int64
            /// Recurring Service Type ID
            public var recurringServiceTypeId: Int64
            /// The recurrence duration type
            public var durationType: ServiceRecurrenceDuration
            /// The duration length for the given duration type
            public var durationLength: Int32
            /// Beginning date of recurring service
            public var from: Date?
            /// End date of recurring service
            public var to: Date?
            /// Memo
            public var memo: String?
            /// Invoice template ID
            public var invoiceTemplateId: Int64?
            /// Invoice template ID for the 2nd year and following (for ongoing memberships)
            public var invoiceTemplateForFollowingYearsId: Int64?
            /// Whether first visit is complete
            public var firstVisitComplete: Bool
            /// ID of the invoice item that is the sale task of this membership
            public var activatedFromId: Int64?
            /// Recurring service allocation
            public var allocation: Double
            /// Business unit ID
            public var businessUnitId: Int64?
            /// Job type ID
            public var jobTypeId: Int64?
            /// Campaign ID
            public var campaignId: Int64?
            /// Recurring service priority
            public var priority: Priority
            /// Job summary
            public var jobSummary: String?
            /// The recurrence type (e.g. Daily, Weekly, Monthly, etc.)
            public var recurrenceType: ServiceRecurrenceType
            /// The recurrence interval for the given recurrence type.
            /// Can be 0 when RecurrenceType is Seasonal.
            public var recurrenceInterval: Int32
            /// A list of months when the recurring service occurs, if it is a seasonal recurrence type
            public var recurrenceMonths: Month
            /// A list specifying which days of the week this recurring service recurs when
            /// RecurrenceType is Weekly
            public var recurrenceDaysOfWeek: WeekDay
            /// Enum value corresponding to which week of the month this recurring service recurs when
            /// RecurrenceType is NthWeekdayOfMonth. Used with RecurrenceDayOfNthWeek.
            public var recurrenceWeek: WeekOfMonth
            /// Enum value corresponding to which day of the week this recurring service recurs when
            /// RecurrenceType is NthWeekdayOfMonth. Used with RecurrenceWeek.
            public var recurrenceDayOfNthWeek: WeekDay?
            /// A list of days of the month on which this recurring service recurs when
            /// RecurrenceType is Monthly.
            public var recurrenceDaysOfMonth: Int32
            /// Job start time
            public var jobStartTime: String?
            /// Estimated payroll cost
            public var estimatedPayrollCost: Double?
        }
        public enum WeekDay: String, CaseIterable, Identifiable, Codable {
            case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday
            public var id: String { rawValue }
        }
        public enum WeekOfMonth: String, CaseIterable, Identifiable, Codable {
            case None, First, Second, Third, Fourth, Last
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportLocationRecurringServiceEventResponse: Codable, Identifiable {
            /// Recurring service event ID
            public var id: Int64
            /// Recurring service ID
            public var locationRecurringServiceId: Int64
            /// Recurring service name
            public var locationRecurringServiceName: String?
            /// Membership ID
            public var membershipId: Int64?
            /// Membership name
            public var membershipName: String?
            /// Opportunity status
            public var status: OpportunityStatus
            /// Event date
            public var date: Date
            /// Event creation date
            public var createdOn: Date
            /// ID of the job associated with this event
            public var jobId: Int64?
            /// ID of the user that created this event (could happen as a result of
            /// editing recurring service, selling a new membership, etc.)
            public var createdById: Int64?
            /// Event modification date
            public var modifiedOn: Date
            /// Whether this event still exists, or was deleted already.
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportCustomerMembershipStatusChangesResponse: Codable, Identifiable {
            /// ID of the status change record
            public var id: Int64
            /// Previous status value
            public var oldStatus: MembershipStatus
            /// New status value
            public var newStatus: MembershipStatus
            /// Optional note attached to this status change
            public var note: String?
            /// When this status change record was created
            public var createdOn: Date
            /// ID of the user that created this status change record
            public var createdById: Int64?
            /// ID of the membership that this status change record is associated with
            public var membershipId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceTemplateResponse: Codable, Identifiable {
            /// Invoice template ID
            public var id: Int64
            /// Invoice template name (used only for shared invoice templates)
            public var name: String?
            /// Invoice template creation date
            public var createdOn: Date
            /// ID of the user that created invoice template
            public var createdById: Int64?
            /// Invoice template modification date
            public var modifiedOn: Date
            /// Whether invoice template is active
            public var active: Bool
            /// Invoice template total
            public var total: Double
            /// Whether invoice template is shared (i.e. visible on the Settings page)
            public var isSettingsTemplate: Bool
            /// Import ID
            public var importId: String?
            /// A list of invoice template items
            public var items: InvoiceTemplateItemResponse
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceTemplateCreateRequest: Codable {
            /// Invoice template items
            public var items: InvoiceTemplateItemCreateRequest?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceTemplateItemCreateRequest: Codable {
            /// Linked SKU ID
            public var skuId: Int64
            /// Quantity
            public var quantity: Double
            /// Unit price
            public var unitPrice: Double
            /// Whether invoice item is add-on
            public var isAddOn: Bool
            /// The invoice item ID that created this invoice template item via ModifyMembershipWorkflowAction
            public var workflowActionItemId: Int64?
            /// Item description
            public var description: String?
            /// Materials cost
            public var cost: Double?
            /// Sold/billable hours
            public var hours: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceTemplateUpdateRequest: Codable {
            /// Invoice template name (used only for shared invoice templates)
            public var name: String
            /// Invoice template creation date
            public var createdOn: Date
            /// ID of the user that created invoice template
            public var createdById: Int64
            /// Whether invoice template is active
            public var active: Bool
            /// Invoice template items
            public var items: [InvoiceTemplateItemUpdateRequest]
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceTemplateItemUpdateRequest: Codable {
            /// Invoice template item ID
            public var id: Int64?
            /// Linked SKU ID
            public var skuId: Int64
            /// Quantity
            public var quantity: Double
            /// Unit price
            public var unitPrice: Double
            /// Whether invoice item is add-on
            public var isAddOn: Bool
            /// Item description
            public var description: String?
            /// Materials cost
            public var cost: Double?
            /// Sold/billable hours
            public var hours: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationRecurringServiceEventResponse: Codable, Identifiable {
            /// Recurring service event ID
            public var id: Int64
            /// Recurring service ID
            public var locationRecurringServiceId: Int64
            /// Recurring service name
            public var locationRecurringServiceName: String?
            /// Membership ID
            public var membershipId: Int64?
            /// Membership name
            public var membershipName: String?
            /// Opportunity status
            public var status: OpportunityStatus
            /// Event date
            public var date: Date
            /// Event creation date
            public var createdOn: Date
            /// ID of the job associated with this event
            public var jobId: Int64?
            /// ID of the user that created this event (could happen as a result of
            /// editing recurring service, selling a new membership, etc.)
            public var createdById: Int64?
            /// Event modification date
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MarkEventCompletedStatusUpdateRequest: Codable {
            /// The job ID that the event is marked as completed/incompleted on
            public var jobId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationRecurringServiceResponse: Codable, Identifiable {
            /// Recurring service ID
            public var id: Int64
            /// Recurring service name
            public var name: String
            /// Whether recurring service is active
            public var active: Bool
            /// When recurring service was created
            public var createdOn: Date
            /// ID of the user that created this recurring service
            public var createdById: Int64?
            /// When recurring service was modified
            public var modifiedOn: Date
            /// Internal import ID label
            public var importId: String?
            /// Customer membership ID
            public var membershipId: Int64?
            /// Location ID
            public var locationId: Int64
            /// Recurring Service Type ID
            public var recurringServiceTypeId: Int64
            /// The recurrence duration type
            public var durationType: ServiceRecurrenceDuration
            /// The duration length for the given duration type
            public var durationLength: Int32
            /// Beginning date of recurring service
            public var from: Date?
            /// End date of recurring service
            public var to: Date?
            /// Memo
            public var memo: String?
            /// Invoice template ID
            public var invoiceTemplateId: Int64?
            /// Invoice template ID for the 2nd year and following (for ongoing memberships)
            public var invoiceTemplateForFollowingYearsId: Int64?
            /// Whether first visit is complete
            public var firstVisitComplete: Bool
            /// ID of the invoice item that is the sale task of this membership
            public var activatedFromId: Int64?
            /// Recurring service allocation
            public var allocation: Double
            /// Business unit ID
            public var businessUnitId: Int64?
            /// Job type ID
            public var jobTypeId: Int64?
            /// Campaign ID
            public var campaignId: Int64?
            /// Recurring service priority
            public var priority: Priority
            /// Job summary
            public var jobSummary: String?
            /// The recurrence type (e.g. Daily, Weekly, Monthly, etc.)
            public var recurrenceType: ServiceRecurrenceType
            /// The recurrence interval for the given recurrence type.
            /// Can be 0 when RecurrenceType is Seasonal.
            public var recurrenceInterval: Int32
            /// A list of months when the recurring service occurs, if it is a seasonal recurrence type
            public var recurrenceMonths: Month
            /// A list specifying which days of the week this recurring service recurs when
            /// RecurrenceType is Weekly
            public var recurrenceDaysOfWeek: WeekDay
            /// Enum value corresponding to which week of the month this recurring service recurs when
            /// RecurrenceType is NthWeekdayOfMonth. Used with RecurrenceDayOfNthWeek.
            public var recurrenceWeek: WeekOfMonth
            /// Enum value corresponding to which day of the week this recurring service recurs when
            /// RecurrenceType is NthWeekdayOfMonth. Used with RecurrenceWeek.
            public var recurrenceDayOfNthWeek: WeekDay?
            /// A list of days of the month on which this recurring service recurs when
            /// RecurrenceType is Monthly.
            public var recurrenceDaysOfMonth: Int32
            /// Job start time
            public var jobStartTime: String?
            /// Estimated payroll cost
            public var estimatedPayrollCost: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationRecurringServiceUpdateRequest: Codable {
            /// Recurring service name
            public var name: String
            /// Whether recurring service is active
            public var active: Bool
            /// Recurring Service Type ID
            public var recurringServiceTypeId: Int64
            /// The recurrence duration type
            public var durationType: ServiceRecurrenceDuration
            /// The duration length for the given duration type
            public var durationLength: Int32
            /// Beginning date of recurring service
            public var from: Date
            /// Memo
            public var memo: String
            /// Invoice template ID
            public var invoiceTemplateId: Int64?
            /// Invoice template ID for the 2nd year and following (for ongoing memberships)
            public var invoiceTemplateForFollowingYearsId: Int64?
            /// Business unit ID
            public var businessUnitId: Int64
            /// Job type ID
            public var jobTypeId: Int64
            /// Campaign ID
            public var campaignId: Int64
            /// Recurring service priority
            public var priority: Priority
            /// Job summary
            public var jobSummary: String
            /// The recurrence type (e.g. Daily, Weekly, Monthly, etc.)
            public var recurrenceType: ServiceRecurrenceType
            /// The recurrence interval for the given recurrence type.
            /// Can be 0 when RecurrenceType is Seasonal.
            public var recurrenceInterval: Int32
            /// A list of months when the recurring service occurs, if it is a seasonal recurrence type
            public var recurrenceMonths: Month
            /// A list specifying which days of the week this recurring service recurs when
            /// RecurrenceType is Weekly
            public var recurrenceDaysOfWeek: WeekDay
            /// Enum value corresponding to which week of the month this recurring service recurs when
            /// RecurrenceType is NthWeekdayOfMonth. Used with RecurrenceDayOfNthWeek.
            public var recurrenceWeek: WeekOfMonth
            /// Enum value corresponding to which day of the week this recurring service recurs when
            /// RecurrenceType is NthWeekdayOfMonth. Used with RecurrenceWeek.
            public var recurrenceDayOfNthWeek: WeekDay?
            /// Job start time
            public var jobStartTime: String?
            /// Estimated payroll cost
            public var estimatedPayrollCost: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipTypeResponse: Codable, Identifiable {
            /// Membership type name
            public var name: String
            /// Whether membership type is active
            public var active: Bool
            /// Membership discount mode
            public var discountMode: DiscountMode
            /// Membership location target
            public var locationTarget: MembershipLocationTarget
            /// Membership revenue recognition mode
            public var revenueRecognitionMode: RevenueRecognitionMode
            /// Whether invoice templates should be auto-calculated
            public var autoCalculateInvoiceTemplates: Bool
            /// Whether membership pricing table should be used
            public var useMembershipPricingTable: Bool
            /// Whether membership savings should be displayed
            public var showMembershipSavings: Bool
            /// Membership type ID
            public var id: Int64
            /// When membership type was created
            public var createdOn: Date
            /// ID of the user that created this membership type
            public var createdById: Int64?
            /// When membership type was modified
            public var modifiedOn: Date
            /// Internal import ID label
            public var importId: String?
            /// Billing template ID
            public var billingTemplateId: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipTypeRecurringServiceItemResponse: Codable, Identifiable {
            /// ID of the recurring service item
            public var id: Int64
            /// Membership type ID associated with the item
            public var membershipTypeId: Int64
            /// Recurring service type ID associated with the item
            public var recurringServiceTypeId: Int64
            /// Number of weeks or months (depending on offset type) between membership start and recurring service start
            public var offset: Int32
            /// Offset type of the recurring service type associated with this item, can be weeks (0) or months (1)
            public var offsetType: OffsetType
            /// The percentage of deferred revenue allocated to the recurring service item
            public var allocation: Double
            /// Import ID
            public var importId: String?
            /// When recurring service item was created
            public var createdOn: Date
            /// ID of the user that created this recurring service item
            public var createdById: Int64?
        }
        public enum OffsetType: String, CaseIterable, Identifiable, Codable {
            case Weeks, Months
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipTypeDiscountItemResponse: Codable, Identifiable {
            /// ID of the discount item
            public var id: Int64
            /// ID of the discount's target, which can be either a business unit or pricebook category
            public var targetId: Int64
            /// Percentage discount (0 to 100)
            public var discount: Double
            /// When discount item was created
            public var createdOn: Date
            /// ID of the user that created this discount item
            public var createdById: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipTypeDurationBillingItemResponse: Codable, Identifiable {
            /// ID of the duration/billing option
            public var id: Int64
            /// Duration of the entry
            public var duration: Int32?
            /// Billing frequency of the entry
            public var billingFrequency: MembershipRecurrenceType
            /// Sale price of the entry
            public var salePrice: Double
            /// Billing price of the entry
            public var billingPrice: Double
            /// Renewal price of the entry
            public var renewalPrice: Double
            /// Import ID of the entry
            public var importId: String?
            /// Whether the duration/billing option is active
            public var active: Bool
            /// When duration/billing option was created
            public var createdOn: Date
            /// ID of the user that created this duration/billing option
            public var createdById: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct RecurringServiceTypeResponse: Codable, Identifiable {
            /// Recurring service type ID
            public var id: Int64
            /// When recurring service type was created
            public var createdOn: Date
            /// ID of the user that created this recurring service type
            public var createdById: Int64?
            /// When recurring service type was modified
            public var modifiedOn: Date
            /// Whether recurring service type is active
            public var active: Bool
            /// The recurrence type (e.g. Daily, Weekly, Monthly)
            public var recurrenceType: ServiceRecurrenceType
            /// The recurrence interval for the given recurrence type
            public var recurrenceInterval: Int32
            /// A list of months when the recurring service occurs, if it is a seasonal recurrence type
            public var recurrenceMonths: Month
            /// The recurrence duration type
            public var durationType: ServiceRecurrenceDuration
            /// The recurrence duration length (number of events)
            public var durationLength: Int32
            /// Invoice template ID
            public var invoiceTemplateId: Int64?
            /// Business unit ID
            public var businessUnitId: Int64?
            /// Job type ID
            public var jobTypeId: Int64?
            /// Priority
            public var priority: Priority
            /// Campaign ID
            public var campaignId: Int64?
            /// Job summary
            public var jobSummary: String?
            /// Recurring service type name
            public var name: String?
            /// Import ID
            public var importId: String?
        }
    }
}
public extension APIs {
    class Memberships: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "memberships")
        }
        /// Query Parameters for func customerMembershipsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerMembershipsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filters by customer IDs
            public var customerIds: String?
            /// Filters by membership status\
            /// Values: [Active, Suspended, Expired, Canceled, Deleted]
            public var status: String?
            /// Format - int32. Filters by membership duration (in months); use null for ongoing memberships
            public var duration: Int32?
            /// Filters by membership billing frequency\
            /// Values: [OneTime, Monthly, EveryOtherMonth, Quarterly, BiAnnual, Annual]
            public var billingFrequency: String?
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
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func customerMembershipsGetList(tenant: Int64, query: CustomerMembershipsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Memberships.CustomerMembershipResponse>, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/memberships"
            return await getReq(Models.PaginatedResponse<Models.Memberships.CustomerMembershipResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func customerMembershipsGetCustomFields
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerMembershipsGetCustomFieldsQuery: URLQueryConvertible {
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
            /// Applies sorting by specified fields
            public var sort: String?
        }
        public func customerMembershipsGetCustomFields(tenant: Int64, query: CustomerMembershipsGetCustomFieldsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Memberships.CustomFieldTypeResponse>, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/memberships/custom-fields"
            return await getReq(Models.PaginatedResponse<Models.Memberships.CustomFieldTypeResponse>.self, endpoint: endpoint, params: query)
        }
        public func customerMembershipsGet(id: Int64, tenant: Int64) async -> Result<Models.Memberships.CustomerMembershipResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/memberships/\(id)"
            return await getReq(Models.Memberships.CustomerMembershipResponse.self, endpoint: endpoint)
        }
        public func customerMembershipsUpdate(id: Int64, tenant: Int64, body: Models.Memberships.CustomerMembershipUpdateRequest) async -> Result<Models.Memberships.ModificationResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/memberships/\(id)"
            return await bodiedReq(Models.Memberships.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func customerMembershipsGetStatusChanges(id: Int64, tenant: Int64) async -> Result<Models.Memberships.CustomerMembershipStatusChangeItemResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/memberships/\(id)/status-changes"
            return await getReq(Models.Memberships.CustomerMembershipStatusChangeItemResponse.self, endpoint: endpoint)
        }
        public func customerMembershipsCreate(tenant: Int64, body: Models.Memberships.MembershipSaleInvoiceCreateRequest) async -> Result<Models.Memberships.MembershipSaleInvoiceCreateResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/memberships/sale"
            return await bodiedReq(Models.Memberships.MembershipSaleInvoiceCreateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func exportMembershipTypes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportMembershipTypesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportMembershipTypes(tenant: Int64, query: ExportMembershipTypesQuery? = nil) async -> Result<Models.Memberships.ExportMembershipTypeResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/export/membership-types"
            return await getReq(Models.Memberships.ExportMembershipTypeResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportRecurringServiceTypes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportRecurringServiceTypesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportRecurringServiceTypes(tenant: Int64, query: ExportRecurringServiceTypesQuery? = nil) async -> Result<Models.Memberships.ExportRecurringServiceTypeResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/export/recurring-service-types"
            return await getReq(Models.Memberships.ExportRecurringServiceTypeResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportMemberships
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportMembershipsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportMemberships(tenant: Int64, query: ExportMembershipsQuery? = nil) async -> Result<Models.Memberships.ExportCustomerMembershipResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/export/memberships"
            return await getReq(Models.Memberships.ExportCustomerMembershipResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportInvoiceTemplates
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportInvoiceTemplatesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportInvoiceTemplates(tenant: Int64, query: ExportInvoiceTemplatesQuery? = nil) async -> Result<Models.Memberships.ExportInvoiceTemplateResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/export/invoice-templates"
            return await getReq(Models.Memberships.ExportInvoiceTemplateResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportLocationRecurringServices
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportLocationRecurringServicesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportLocationRecurringServices(tenant: Int64, query: ExportLocationRecurringServicesQuery? = nil) async -> Result<Models.Memberships.ExportLocationRecurringServiceResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/export/recurring-services"
            return await getReq(Models.Memberships.ExportLocationRecurringServiceResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportLocationRecurringServiceEvents
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportLocationRecurringServiceEventsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportLocationRecurringServiceEvents(tenant: Int64, query: ExportLocationRecurringServiceEventsQuery? = nil) async -> Result<Models.Memberships.ExportLocationRecurringServiceEventResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/export/recurring-service-events"
            return await getReq(Models.Memberships.ExportLocationRecurringServiceEventResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportMembershipStatusChanges
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportMembershipStatusChangesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportMembershipStatusChanges(tenant: Int64, query: ExportMembershipStatusChangesQuery? = nil) async -> Result<Models.Memberships.ExportCustomerMembershipStatusChangesResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/export/membership-status-changes"
            return await getReq(Models.Memberships.ExportCustomerMembershipStatusChangesResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func invoiceTemplatesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceTemplatesGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
        }
        public func invoiceTemplatesGetList(tenant: Int64, query: InvoiceTemplatesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Memberships.InvoiceTemplateResponse>, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/invoice-templates"
            return await getReq(Models.PaginatedResponse<Models.Memberships.InvoiceTemplateResponse>.self, endpoint: endpoint, params: query)
        }
        public func invoiceTemplatesCreate(tenant: Int64, body: Models.Memberships.InvoiceTemplateCreateRequest) async -> Result<Models.Memberships.ModificationResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/invoice-templates"
            return await bodiedReq(Models.Memberships.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func invoiceTemplatesGet(id: Int64, tenant: Int64) async -> Result<Models.Memberships.InvoiceTemplateResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/invoice-templates/\(id)"
            return await getReq(Models.Memberships.InvoiceTemplateResponse.self, endpoint: endpoint)
        }
        public func invoiceTemplatesUpdate(id: Int64, tenant: Int64, body: Models.Memberships.InvoiceTemplateUpdateRequest) async -> Result<Models.Memberships.ModificationResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/invoice-templates/\(id)"
            return await bodiedReq(Models.Memberships.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func locationRecurringServiceEventsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationRecurringServiceEventsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Format - int64. Location ID
            public var locationId: Int64?
            /// Format - int64. Job ID
            public var jobId: Int64?
            /// Follow up status \
            /// Values: [NotAttempted, Unreachable, Contacted, Won, Dismissed]
            public var status: String?
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
        }
        public func locationRecurringServiceEventsGetList(tenant: Int64, query: LocationRecurringServiceEventsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Memberships.LocationRecurringServiceEventResponse>, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/recurring-service-events"
            return await getReq(Models.PaginatedResponse<Models.Memberships.LocationRecurringServiceEventResponse>.self, endpoint: endpoint, params: query)
        }
        public func locationRecurringServiceEventsMarkComplete(id: Int64, tenant: Int64, body: Models.Memberships.MarkEventCompletedStatusUpdateRequest) async -> Result<Models.Memberships.ModificationResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/recurring-service-events/\(id)/mark-complete"
            return await bodiedReq(Models.Memberships.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func locationRecurringServiceEventsMarkIncomplete(id: Int64, tenant: Int64, body: Models.Memberships.MarkEventCompletedStatusUpdateRequest) async -> Result<Models.Memberships.ModificationResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/recurring-service-events/\(id)/mark-incomplete"
            return await bodiedReq(Models.Memberships.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func locationRecurringServicesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationRecurringServicesGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filters by customer membership IDs
            public var membershipIds: String?
            /// Filters by location IDs
            public var locationIds: String?
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
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func locationRecurringServicesGetList(tenant: Int64, query: LocationRecurringServicesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Memberships.LocationRecurringServiceResponse>, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/recurring-services"
            return await getReq(Models.PaginatedResponse<Models.Memberships.LocationRecurringServiceResponse>.self, endpoint: endpoint, params: query)
        }
        public func locationRecurringServicesGet(id: Int64, tenant: Int64) async -> Result<Models.Memberships.LocationRecurringServiceResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/recurring-services/\(id)"
            return await getReq(Models.Memberships.LocationRecurringServiceResponse.self, endpoint: endpoint)
        }
        public func locationRecurringServicesUpdate(id: Int64, tenant: Int64, body: Models.Memberships.LocationRecurringServiceUpdateRequest) async -> Result<Models.Memberships.ModificationResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/recurring-services/\(id)"
            return await bodiedReq(Models.Memberships.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func membershipTypesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipTypesGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - int32. Filters by membership duration (in months); use null for ongoing memberships
            public var duration: Int32?
            /// Filters by membership billing frequency\
            /// Values: [OneTime, Monthly, EveryOtherMonth, Quarterly, BiAnnual, Annual]
            public var billingFrequency: String?
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
        }
        public func membershipTypesGetList(tenant: Int64, query: MembershipTypesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Memberships.MembershipTypeResponse>, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/membership-types"
            return await getReq(Models.PaginatedResponse<Models.Memberships.MembershipTypeResponse>.self, endpoint: endpoint, params: query)
        }
        public func membershipTypesGet(id: Int64, tenant: Int64) async -> Result<Models.Memberships.MembershipTypeResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/membership-types/\(id)"
            return await getReq(Models.Memberships.MembershipTypeResponse.self, endpoint: endpoint)
        }
        public func membershipTypesGetRecurringServiceItems(id: Int64, tenant: Int64) async -> Result<Models.Memberships.MembershipTypeRecurringServiceItemResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/membership-types/\(id)/recurring-service-items"
            return await getReq(Models.Memberships.MembershipTypeRecurringServiceItemResponse.self, endpoint: endpoint)
        }
        public func membershipTypesGetDiscountsList(id: Int64, tenant: Int64) async -> Result<Models.Memberships.MembershipTypeDiscountItemResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/membership-types/\(id)/discounts"
            return await getReq(Models.Memberships.MembershipTypeDiscountItemResponse.self, endpoint: endpoint)
        }
        /// Query Parameters for func membershipTypesGetDurationBillingList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MembershipTypesGetDurationBillingListQuery: URLQueryConvertible {
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
        }
        public func membershipTypesGetDurationBillingList(id: Int64, tenant: Int64, query: MembershipTypesGetDurationBillingListQuery? = nil) async -> Result<Models.Memberships.MembershipTypeDurationBillingItemResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/membership-types/\(id)/duration-billing-items"
            return await getReq(Models.Memberships.MembershipTypeDurationBillingItemResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func recurringServiceTypesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct RecurringServiceTypesGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Format - int64. Filters by membership type ID
            public var membershipTypeId: Int64?
            /// Filters by recurrence type\
            /// Values: [Weekly, Monthly, Seasonal, Daily, NthWeekdayOfMonth]
            public var recurrenceType: String?
            /// Filters by duration type\
            /// Values: [Continuous, NumberOfVisits]
            public var durationType: String?
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
            /// Available fields are: Id, Name, CreatedOn, ModifiedOn.
            public var sort: String?
        }
        public func recurringServiceTypesGetList(tenant: Int64, query: RecurringServiceTypesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Memberships.RecurringServiceTypeResponse>, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/recurring-service-types"
            return await getReq(Models.PaginatedResponse<Models.Memberships.RecurringServiceTypeResponse>.self, endpoint: endpoint, params: query)
        }
        public func recurringServiceTypesGet(id: Int64, tenant: Int64) async -> Result<Models.Memberships.RecurringServiceTypeResponse, APIError> {
            let endpoint = "/memberships/v2/tenant/\(tenant)/recurring-service-types/\(id)"
            return await getReq(Models.Memberships.RecurringServiceTypeResponse.self, endpoint: endpoint)
        }
    }
}
