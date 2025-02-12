//
//  CRM.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/9/25.
//

import MemberwiseInit
import Foundation
public extension Models {
    struct Crm {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateBookingProviderTagResponse: Codable, Identifiable {
            /// id of booking provider tag
            public var id: Int64
            /// Name of tag
            public var tagName: String
            /// Description of tag
            public var description: String
            /// Type of tag
            public var type: BookingAgentTagType
            /// Date/time (in UTC) when the booking provider tag was created
            public var createdOn: Date
            /// Date/time (in UTC) when the booking provider tag was modified
            public var modifiedOn: Date
        }
        public enum BookingAgentTagType: String, CaseIterable, Identifiable, Codable {
            case V1Api, V2Api
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateBookingProviderTagRequest: Codable {
            /// Name of tag
            public var tagName: String
            /// Description of tag
            public var description: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GetBookingProviderTagResponse: Codable, Identifiable {
            /// id of booking provider tag
            public var id: Int64
            /// Name of tag
            public var tagName: String
            /// Description of tag
            public var description: String
            /// Type of tag
            public var type: BookingAgentTagType
            /// Date/time (in UTC) when the booking provider tag was created
            public var createdOn: Date
            /// Date/time (in UTC) when the booking provider tag was modified
            public var modifiedOn: Date
            
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BookingProviderTagResponse: Codable, Identifiable {
            /// id of booking provider tag
            public var id: Int64
            /// Name of tag
            public var tagName: String
            /// Description of tag
            public var description: String
            /// Type of tag
            public var type: BookingAgentTagType
            /// Date/time (in UTC) when the booking provider tag was created
            public var createdOn: Date
            /// Date/time (in UTC) when the booking provider tag was modified
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateBookingProviderTagRequest: Codable {
            /// Name of tag
            public var tagName: String
            /// Description of tag
            public var description: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BookingResponse: Codable, Identifiable {
            /// ID of the booking
            public var id: Int64
            /// Source of the booking
            public var source: String
            /// when the booking was created
            public var createdOn: Date
            /// Name of the booking's customer
            public var name: String
            /// Address of the booking
            public var address: AddressModel?
            /// Type of customer (Residential/Commercial)
            public var customerType: CustomerType?
            /// Booking's start date time, in UTC
            public var start: Date
            /// Booking summary
            public var summary: String?
            /// ID of the booking's campaign
            public var campaignId: Int64?
            /// ID of the booking's business unit
            public var businessUnitId: Int64?
            /// Returns true if first time client
            public var isFirstTimeClient: Bool?
            /// Uploaded images
            public var uploadedImages: String?
            /// Returns true if customer should receive email when booking is created
            public var isSendConfirmationEmail: Bool?
            /// Booking status
            public var status: BookingStatus
            /// ID of the reason booking was dismissed
            public var dismissingReasonId: Int64?
            /// ID of the job booked from the booking
            public var jobId: Int64?
            /// External ID of booking
            public var externalId: String
            /// Booking priority
            public var priority: Priority?
            /// ID of the booking's job type
            public var jobTypeId: Int64?
            /// Booking provider id
            public var bookingProviderId: Int64
            /// When the booking was modified
            public var modifiedOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AddressModel: Codable {
            /// Booking address street
            public var street: String
            /// Booking address unit
            public var unit: String?
            /// Booking address city
            public var city: String
            /// Booking address state
            public var state: String
            /// Booking address zip code
            public var zip: String
            /// Booking address country
            public var country: String
        }
        public enum CustomerType: String, CaseIterable, Identifiable, Codable {
            case Residential, Commercial
            public var id: String { rawValue }
        }
        public enum BookingStatus: String, CaseIterable, Identifiable, Codable {
            case New, Converted, Dismissed, Accepted
            public var id: String { rawValue }
        }
        public enum Priority: String, CaseIterable, Identifiable, Codable {
            case Low, Normal, High, Urgent
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BookingContactResponse: Codable, Identifiable {
            /// Id of contact
            public var id: Int64
            /// Type of contact
            public var type: ContactType
            /// Value of contact
            public var value: String
            /// Memo of contact
            public var memo: String
            /// Date/time (in UTC) the contact was last modified
            public var modifiedOn: Date
        }
        public enum ContactType: String, CaseIterable, Identifiable, Codable {
            case Phone, Email, Fax, MobilePhone
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateBookingRequest: Codable {
            /// Source of the booking
            public var source: String
            /// Name of the customer
            public var name: String
            /// Address of the booking
            public var address: AddressModel?
            /// Contacts for the booking
            public var contacts: BookingContactModel?
            /// Type of the customer (Residential/Commercial)
            public var customerType: String?
            /// Booking's start Date(time) in UTC
            public var start: Date?
            /// Summary of the booking
            public var summary: String
            /// ID of the booking's campaign
            public var campaignId: Int64?
            /// ID of the booking's business unit
            public var businessUnitId: Int64?
            /// ID of the booking's job type
            public var jobTypeId: Int64?
            /// Booking priority
            public var priority: Priority?
            /// True if first time client
            public var isFirstTimeClient: Bool
            /// Uploaded images
            public var uploadedImages: String?
            /// Returns true if customer should receive email when booking is created
            public var isSendConfirmationEmail: Bool?
            /// External ID of booking
            public var externalId: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BookingContactModel: Codable {
            
            public var type: ContactType
            
            public var value: String
            
            public var memo: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateBookingRequest: Codable {
            /// Source of the booking
            public var source: String
            /// Name of the booking's customer
            public var name: String
            
            public var address: AddressPatchModel
            /// Type of customer (Residential/Commercial)
            public var customerType: CustomerType
            /// Booking's start date time, in UTC
            public var start: Date
            /// Booking summary
            public var summary: String
            /// ID of the booking's campaign
            public var campaignId: Int64
            /// ID of the booking's business unit
            public var businessUnitId: Int64
            /// ID of the booking's job type
            public var jobTypeId: Int64
            /// Booking priority
            public var priority: Priority
            /// True if first time client
            public var isFirstTimeClient: Bool
            /// Uploaded images
            public var uploadedImages: String
            /// External ID of booking
            public var externalId: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactCreateRequest: Codable {
            /// Type of contact
            public var type: String
            /// Value of contact
            public var value: String
            /// Memo of contact
            public var memo: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateBookingContactRequest: Codable {
            
            public var type: ContactType
            
            public var value: String
            
            public var memo: String
        }
        /// Add bulk tags request.
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AddBulkTagsRequest: Codable {
            /// List of Customer ID(s)
            public var customerIds: Int64
            /// List of TagType ID(s) to add to the customers
            public var tagTypeIds: Int64
        }
        /// Remove bulk tags request.
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct RemoveBulkTagsRequest: Codable {
            /// List of Customer ID(s)
            public var customerIds: Int64
            /// List of TagType ID(s) to add to the customers
            public var tagTypeIds: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactMethodResponse: Codable, Identifiable {
            /// ID of the contact method
            public var id: String
            /// ID of the contact
            public var contactId: String
            /// Reference ID of the contact method
            public var referenceId: String?
            /// Contact method type
            public var type: ContactType
            /// Value of the contact method
            public var value: String
            /// Memo for the contact method
            public var memo: String?
            /// DateTime (UTC) that customer record was created
            public var createdOn: Date
            /// User ID who created the record.
            public var createdBy: Int64
            /// Modified on (UTC) for the record.
            public var modifiedOn: Date
            /// User ID who modified the record.
            public var modifiedBy: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateContactMethodRequest: Codable {
            /// Reference ID of the contact method
            public var referenceId: String?
            /// Type of the contact method
            public var type: ContactType
            /// Value of the contact method
            public var value: String
            /// Memo for the contact method
            public var memo: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpsertContactMethodRequest: Codable {
            /// Reference ID of the contact method
            public var referenceId: String?
            /// Type of the contact method
            public var type: ContactType
            /// Value of the contact method
            public var value: String
            /// Memo for the contact method
            public var memo: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateContactMethodRequest: Codable {
            /// Value of the contact method
            public var value: String
            /// Memo for the contact method
            public var memo: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactResponse: Codable, Identifiable {
            /// ID of the contact
            public var id: String
            /// External reference ID of the contact
            public var referenceId: String?
            /// Name of the contact
            public var name: String?
            /// Title of the contact
            public var title: String?
            /// Whether the contact has been archived.
            public var isArchived: Bool
            /// When the contact was created
            public var createdOn: Date
            /// User ID who created this contact
            public var createdBy: Int64
            /// When the contact was modified
            public var modifiedOn: Date
            /// User ID who modified this contact
            public var modifiedBy: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ReplaceContactRequest: Codable {
            /// Name of the contact
            public var name: String?
            /// Title of the contact
            public var title: String?
            /// External reference ID of the contact
            public var referenceId: String?
            /// Sets whether the contact has been archived.
            public var isArchived: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateContactRequest: Codable {
            /// Name of the contact
            public var name: String?
            /// Title of the contact
            public var title: String?
            /// External reference ID of the contact
            public var referenceId: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactRelationshipResponse: Codable, Identifiable {
            /// ID of the contact relationship
            public var id: String
            /// ID of the related entity
            public var relatedEntityId: Int64
            /// Relationship type name: Customer, Location, Booking
            public var typeName: String
            /// Relationship type slug: customer, location, booking
            public var typeSlug: String
            /// When the contact relationship was created
            public var createdOn: Date
            /// User ID who created this contact relationship
            public var createdBy: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateContactRequest: Codable {
            /// Name of the contact
            public var name: String?
            /// Title of the contact
            public var title: String?
            /// External reference ID of the contact
            public var referenceId: String?
            /// Sets whether the contact has been archived.
            public var isArchived: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerResponse: Codable, Identifiable {
            /// ID of the customer
            public var id: Int64
            /// False indicates that someone has deactivated the customer record, typically upon merging with another record.
            public var active: Bool
            /// Name of the customer
            public var name: String
            /// Residential or commercial
            public var type: CustomerType
            /// Bill-To address of the customer record
            public var address: CustomerAddress
            /// Customer record’s custom fields
            public var customFields: CustomFieldModel
            /// Customer’s account balance
            public var balance: Double
            /// Tag Type IDs associated with the Customer
            public var tagTypeIds: Int64
            /// Customer has been flagged as “do not mail”
            public var doNotMail: Bool
            /// Customer has been flagged as “do not service”
            public var doNotService: Bool
            /// DateTime (UTC) that customer record was created
            public var createdOn: Date
            /// User ID who created the record.
            public var createdById: Int64
            /// Modified on (UTC) for the record.
            public var modifiedOn: Date
            /// The customer ID of the record that this record was previously merged to.
            public var mergedToId: Int64?
            /// List of external data attached to this Customer,
            /// which corresponds to the application GUID provided in the request.
            public var externalData: ExternalDataModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerAddress: Codable {
            /// Street
            public var street: String
            /// Unit
            public var unit: String?
            /// City
            public var city: String
            /// State
            public var state: String
            /// Zip
            public var zip: String
            /// Country
            public var country: String
            /// Latitude
            public var latitude: Double?
            /// Longitude
            public var longitude: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldModel: Codable {
            /// ID of the custom field
            public var typeId: Int64
            /// Name/label of the custom field
            public var name: String?
            /// Value of the custom field
            public var value: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalDataModel: Codable {
            /// External data key.
            public var key: String
            /// External data value.
            public var value: String
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreatedCustomerResponse: Codable, Identifiable {
            /// ID of the customer
            public var id: Int64
            /// False indicates that someone has deactivated the customer record, typically upon merging with another record.
            public var active: Bool
            /// Name of the customer
            public var name: String
            /// Residential or commercial
            public var type: CustomerType
            /// Bill-To address of the customer record
            public var address: CustomerAddress
            /// Customer record’s custom fields
            public var customFields: CustomFieldModel
            /// Customer’s account balance
            public var balance: Double
            /// Tag Type IDs associated with the Customer
            public var tagTypeIds: Int64
            /// Customer has been flagged as “do not mail”
            public var doNotMail: Bool
            /// Customer has been flagged as “do not service”
            public var doNotService: Bool
            /// DateTime (UTC) that customer record was created
            public var createdOn: Date
            /// User ID who created the record.
            public var createdById: Int64
            /// Modified on (UTC) for the record.
            public var modifiedOn: Date
            /// The customer ID of the record that this record was previously merged to.
            public var mergedToId: Int64?
            /// List of external data attached to this Customer,
            /// which corresponds to the application GUID provided in the request.
            public var externalData: ExternalDataModel
            /// Locations for the customer
            public var locations: CreateLocationResponse
            /// Contacts for the customer
            public var contacts: CustomerContact
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateLocationResponse: Codable, Identifiable {
            /// ID of the location tax zone
            public var taxZoneId: Int64?
            /// ID of the location
            public var id: Int64
            /// ID of the location’s customer.
            public var customerId: Int64
            /// If false, the record has been deactivated.
            public var active: Bool
            /// Name of the location
            public var name: String
            /// Location’s address
            public var address: CustomerAddress
            /// Location record’s custom fields
            public var customFields: CustomFieldModel
            /// DateTime (UTC) that location record was created
            public var createdOn: Date
            /// User ID who created the record.
            public var createdById: Int64
            /// Modified On (UTC) for the record.
            public var modifiedOn: Date
            /// Tells you which location record this record was merged into.
            public var mergedToId: Int64?
            /// ID of the location's Zone
            public var zoneId: Int64?
            /// Tag Type IDs of the location
            public var tagTypeIds: Int64
            /// List of external data attached to this Location,
            /// which corresponds to the application GUID provided in the request.
            public var externalData: ExternalDataModel
            
            public var contacts: LocationContact
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationContact: Codable, Identifiable {
            /// ID of the contact
            public var id: Int64
            /// Landline, mobile, e-mail, or fax.
            public var type: ContactType
            /// The email, phone number, or fax number for the contact.
            public var value: String
            /// Short description about this contact, for example, “work #” or “Owner’s daughter - Kelly.”
            public var memo: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerContact: Codable, Identifiable {
            /// ID of the contact
            public var id: Int64
            /// Landline, mobile, e-mail, or fax.
            public var type: ContactType
            /// The email, phone number, or fax number for the contact.
            public var value: String
            /// Short description about this contact, for example, “work #” or “Owner’s daughter - Kelly.”
            public var memo: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateCustomerRequest: Codable {
            /// Name of the customer
            public var name: String
            /// Residential or commercial
            public var type: CustomerType?
            /// Customer has been flagged as “do not mail”
            public var doNotMail: Bool?
            /// Customer has been flagged as “do not service”
            public var doNotService: Bool?
            /// Locations for the customer
            public var locations: NewLocation
            /// Bill-To address of the customer record
            public var address: CustomerAddress
            /// Contacts for the customer
            public var contacts: NewCustomerContact?
            /// Customer record’s custom fields
            public var customFields: CustomFieldUpdateModel?
            /// Tag Type IDs to be associated with the customer
            public var tagTypeIds: Int64?
            /// Optional model that contains a list of external data items
            /// that should be attached to this Customer.
            public var externalData: ExternalDataCreateRequest?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NewLocation: Codable {
            /// Name of the location
            public var name: String
            /// Address of the location record
            public var address: CustomerAddress
            /// Contacts for the location
            public var contacts: NewCustomerContact?
            /// Location record’s custom fields
            public var customFields: CustomFieldUpdateModel?
            /// Tag type ids for the location
            public var tagTypeIds: Int64?
            /// Optional model that contains a list of external data items
            /// that should be attached to this Location.
            public var externalData: ExternalDataCreateRequest?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NewCustomerContact: Codable {
            /// Landline, mobile, e-mail, or fax.
            public var type: ContactType
            /// The email, phone number, or fax number for the contact.
            public var value: String
            /// Short description about this contact, for example, “work #” or “Owner’s daughter - Kelly.”
            public var memo: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldUpdateModel: Codable {
            /// ID of the custom field
            public var typeId: Int64
            /// Value of the custom field
            public var value: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalDataCreateRequest: Codable {
            /// Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided.
            public var applicationGuid: String
            /// External data list.
            public var externalData: ExternalDataModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateCustomerRequest: Codable {
            /// Name of the customer
            public var name: String
            /// Residential or commercial
            public var type: CustomerType
            /// Bill-To address of the customer record
            public var address: UpdateCustomerAddress
            /// Customer record’s custom fields
            public var customFields: CustomFieldUpdateModel
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest
            /// Customer has been flagged as “do not mail”
            public var doNotMail: Bool
            /// Customer has been flagged as “do not service”
            public var doNotService: Bool
            /// Customer has been flagged as “active” ar "innactive"
            public var active: Bool
            /// IDs of the Tag Types
            public var tagTypeIds: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateCustomerAddress: Codable {
            /// Street
            public var street: String
            /// Unit
            public var unit: String
            /// City
            public var city: String
            /// State
            public var state: String
            /// Zip
            public var zip: String
            /// Country
            public var country: String
            /// Latitude
            public var latitude: Double
            /// Longitude
            public var longitude: Double
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
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NoteResponse: Codable, Identifiable {
            /// Id of the note
            public var id: Int64
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
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerNoteCreateRequest: Codable {
            /// Text content of customer note
            public var text: String
            /// Whether to pin customer note to the top
            public var pinToTop: Bool?
            /// Whether to add the same note to the customer's active locations
            public var addToLocations: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerContactWithModifiedOnResponse: Codable, Identifiable {
            /// ID of the contact
            public var id: Int64
            /// Landline, mobile, e-mail, or fax.
            public var type: ContactType
            /// The email, phone number, or fax number for the contact.
            public var value: String
            /// Short description about this contact, for example, “work #” or “Owner’s daughter - Kelly.”
            public var memo: String?
            /// Modified On (UTC) for the record
            public var modifiedOn: Date
            /// Phone settings of the customer contact
            public var phoneSettings: PhoneSettings
            /// Created On (UTC) for the record
            public var createdOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PhoneSettings: Codable {
            /// Phone Number
            public var phoneNumber: String
            /// If the phone number has opted-out from notifications.
            public var doNotText: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateCustomerContactRequest: Codable {
            /// Landline, mobile, e-mail, or fax
            public var type: ContactType
            /// The email, phone number, or fax number for the contact
            public var value: String
            /// Short description about this contact, for example, “work #” or “Owner’s daughter - Kelly”
            public var memo: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateCustomerContactRequest: Codable {
            /// Landline, mobile, e-mail, or fax
            public var type: ContactType
            /// The email, phone number, or fax number for the contact
            public var value: String
            /// Short description about this contact, for example, “work #” or “Owner’s daughter - Kelly”
            public var memo: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomerContactWithModifiedOnAndCustomerIdResponse: Codable, Identifiable {
            /// Modified On (UTC) for the record
            public var modifiedOn: Date
            /// Phone settings of the customer contact
            public var phoneSettings: PhoneSettings
            /// Created On (UTC) for the record
            public var createdOn: Date
            /// ID of the contact
            public var id: Int64
            /// Landline, mobile, e-mail, or fax.
            public var type: ContactType
            /// The email, phone number, or fax number for the contact.
            public var value: String
            /// Short description about this contact, for example, “work #” or “Owner’s daughter - Kelly.”
            public var memo: String?
            
            public var customerId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateCustomerTagResponse: Codable {
            
            public var customerId: Int64
            
            public var tagTypeIds: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportBookingResponse: Codable, Identifiable {
            /// ID of the booking
            public var id: Int64
            /// Source of the booking
            public var source: String
            /// when the booking was created
            public var createdOn: Date
            /// Name of the booking's customer
            public var name: String
            /// Address of the booking
            public var address: AddressModel?
            /// Type of customer (Residential/Commercial)
            public var customerType: CustomerType?
            /// Booking's start date time, in UTC
            public var start: Date
            /// Booking summary
            public var summary: String?
            /// ID of the booking's campaign
            public var campaignId: Int64?
            /// ID of the booking's business unit
            public var businessUnitId: Int64?
            /// Returns true if first time client
            public var isFirstTimeClient: Bool?
            /// Uploaded images
            public var uploadedImages: String?
            /// Returns true if customer should receive email when booking is created
            public var isSendConfirmationEmail: Bool?
            /// Booking status
            public var status: BookingStatus
            /// ID of the reason booking was dismissed
            public var dismissingReasonId: Int64?
            /// ID of the job booked from the booking
            public var jobId: Int64?
            /// External ID of booking
            public var externalId: String
            /// Booking priority
            public var priority: Priority?
            /// ID of the booking's job type
            public var jobTypeId: Int64?
            /// Booking provider id
            public var bookingProviderId: Int64
            /// When the booking was modified
            public var modifiedOn: Date
            
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportCustomerContactResponse: Codable, Identifiable {
            /// Modified On (UTC) for the record
            public var modifiedOn: Date
            /// Phone settings of the customer contact
            public var phoneSettings: PhoneSettings
            /// Created On (UTC) for the record
            public var createdOn: Date
            /// ID of the contact
            public var id: Int64
            /// Landline, mobile, e-mail, or fax.
            public var type: ContactType
            /// The email, phone number, or fax number for the contact.
            public var value: String
            /// Short description about this contact, for example, “work #” or “Owner’s daughter - Kelly.”
            public var memo: String?
            
            public var customerId: Int64
            
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportLocationContactResponse: Codable, Identifiable {
            /// Id of contact
            public var id: Int64
            /// Type of contact
            public var type: ContactType
            /// Value of contact
            public var value: String
            /// Memo of contact
            public var memo: String?
            /// Phone settings of the location contact
            public var phoneSettings: PhoneSettings
            /// Date/time (in UTC) the contact was last modified
            public var modifiedOn: Date
            /// Date/time (in UTC) the contact was created
            public var createdOn: Date
            
            public var locationId: Int64
            
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportCustomerResponse: Codable, Identifiable {
            /// ID of the customer
            public var id: Int64
            /// False indicates that someone has deactivated the customer record, typically upon merging with another record.
            public var active: Bool
            /// Name of the customer
            public var name: String
            /// Residential or commercial
            public var type: CustomerType
            /// Bill-To address of the customer record
            public var address: CustomerAddress
            /// Customer record’s custom fields
            public var customFields: CustomFieldModel
            /// Customer’s account balance
            public var balance: Double
            /// Tag Type IDs associated with the Customer
            public var tagTypeIds: Int64
            /// Customer has been flagged as “do not mail”
            public var doNotMail: Bool
            /// Customer has been flagged as “do not service”
            public var doNotService: Bool
            /// DateTime (UTC) that customer record was created
            public var createdOn: Date
            /// User ID who created the record.
            public var createdById: Int64
            /// Modified on (UTC) for the record.
            public var modifiedOn: Date
            /// The customer ID of the record that this record was previously merged to.
            public var mergedToId: Int64?
            /// List of external data attached to this Customer,
            /// which corresponds to the application GUID provided in the request.
            public var externalData: ExternalDataModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportLeadsResponse: Codable, Identifiable {
            /// ID of the lead
            public var id: Int64
            /// Status of the lead
            public var status: LeadStatus
            /// Customer associated to the lead
            public var customerId: Int64?
            /// Location associated to the lead
            public var locationId: Int64?
            /// Business unit associated to the lead
            public var businessUnitId: Int64?
            /// Job type associated to the lead
            public var jobTypeId: Int64?
            /// Priority of the lead
            public var priority: Priority
            /// Campaign associated to the lead
            public var campaignId: Int64
            /// Summary of the lead
            public var summary: String?
            /// Call reason ID used to classify the lead by the user
            public var callReasonId: Int64?
            /// Call ID used to classify the lead
            public var callId: Int64?
            /// Booking ID used to classify the lead
            public var bookingId: Int64?
            /// Manual Call ID used to classify the lead
            public var manualCallId: Int64?
            /// The next time someone is supposed to follow up on this lead
            public var followUpDate: Date?
            /// When the lead was created
            public var createdOn: Date
            /// User ID who created this lead
            public var createdById: Int64
            /// When the lead was modified
            public var modifiedOn: Date
            /// List of IDs of tags on the lead
            public var tagTypeIds: Int64?
            /// ID of the reason booking was dismissed
            public var dismissingReasonId: Int64?
            /// Permanent URL for the lead
            public var leadUrl: String?
            
            public var active: Bool
        }
        public enum LeadStatus: String, CaseIterable, Identifiable, Codable {
            case Open, Dismissed, Converted
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportLocationsResponse: Codable, Identifiable {
            /// ID of the location tax zone
            public var taxZoneId: Int64?
            /// ID of the location
            public var id: Int64
            /// ID of the location’s customer.
            public var customerId: Int64
            /// If false, the record has been deactivated.
            public var active: Bool
            /// Name of the location
            public var name: String
            /// Location’s address
            public var address: CustomerAddress
            /// Location record’s custom fields
            public var customFields: CustomFieldModel
            /// DateTime (UTC) that location record was created
            public var createdOn: Date
            /// User ID who created the record.
            public var createdById: Int64
            /// Modified On (UTC) for the record.
            public var modifiedOn: Date
            /// Tells you which location record this record was merged into.
            public var mergedToId: Int64?
            /// ID of the location's Zone
            public var zoneId: Int64?
            /// Tag Type IDs of the location
            public var tagTypeIds: Int64
            /// List of external data attached to this Location,
            /// which corresponds to the application GUID provided in the request.
            public var externalData: ExternalDataModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LeadResponse: Codable, Identifiable {
            /// ID of the lead
            public var id: Int64
            /// Status of the lead
            public var status: LeadStatus
            /// Customer associated to the lead
            public var customerId: Int64?
            /// Location associated to the lead
            public var locationId: Int64?
            /// Business unit associated to the lead
            public var businessUnitId: Int64?
            /// Job type associated to the lead
            public var jobTypeId: Int64?
            /// Priority of the lead
            public var priority: Priority
            /// Campaign associated to the lead
            public var campaignId: Int64
            /// Summary of the lead
            public var summary: String?
            /// Call reason ID used to classify the lead by the user
            public var callReasonId: Int64?
            /// Call ID used to classify the lead
            public var callId: Int64?
            /// Booking ID used to classify the lead
            public var bookingId: Int64?
            /// Manual Call ID used to classify the lead
            public var manualCallId: Int64?
            /// The next time someone is supposed to follow up on this lead
            public var followUpDate: Date?
            /// When the lead was created
            public var createdOn: Date
            /// User ID who created this lead
            public var createdById: Int64
            /// When the lead was modified
            public var modifiedOn: Date
            /// List of IDs of tags on the lead
            public var tagTypeIds: Int64?
            /// ID of the reason booking was dismissed
            public var dismissingReasonId: Int64?
            /// Permanent URL for the lead
            public var leadUrl: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct FollowUpResponse: Codable {
            /// ID of the lead the follow-up is for
            public var leadId: Int64
            /// Follow-up date
            public var followUpDate: Date
            /// Text of follow-up note
            public var text: String?
            /// Whether to pin follow-up note to the top
            public var pinToTop: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateFollowUpRequest: Codable {
            /// Follow-up date
            public var followUpDate: Date
            /// Text of follow-up note
            public var text: String?
            /// Whether to pin follow-up note to the top
            public var pinToTop: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LeadCreateRequest: Codable {
            /// ID of the customer
            public var customerId: Int64?
            /// ID of the location
            public var locationId: Int64?
            /// ID of the campaign
            public var campaignId: Int64
            /// ID of the business unit
            public var businessUnitId: Int64?
            /// ID of job type
            public var jobTypeId: Int64?
            /// Lead summary
            public var summary: String
            /// List of IDs of tags on the lead
            public var tagTypeIds: Int64?
            /// Priority of the lead
            public var priority: Priority?
            /// ID of the call reason. Required if follow up date is not provided.
            public var callReasonId: Int64?
            /// Date of when to follow up. Required if call reason ID is not provided.
            public var followUpDate: Date?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LeadUpdateRequest: Codable {
            /// ID of the campaign
            public var campaignId: Int64
            /// Priority of the lead
            public var priority: Priority
            /// ID of the business unit
            public var businessUnitId: Int64
            /// ID of job type
            public var jobTypeId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LeadNoteCreateRequest: Codable {
            /// Text content of lead note
            public var text: String
            /// Whether to pin lead note to the top
            public var pinToTop: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DismissLeadRequest: Codable {
            /// Select a Call Reason to associate to a Booking that’s being dismissed for reporting purposes.
            public var dismissingReasonId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SubmitLeadFormResponse: Codable {
            /// The id of the lead entity that represents the lead form
            public var leadId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SubmitLeadFormRequest: Codable {
            /// The name of the customer
            public var name: String
            /// The email of the customer
            public var email: String?
            /// The phone number of the customer
            public var phoneNumber: String?
            /// The address of the customer
            public var address: CustomerAddress?
            /// Summary submitted in the form
            public var summary: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationResponse: Codable, Identifiable {
            /// ID of the location
            public var id: Int64
            /// ID of the location’s customer.
            public var customerId: Int64
            /// If false, the record has been deactivated.
            public var active: Bool
            /// Name of the location
            public var name: String
            /// Location’s address
            public var address: CustomerAddress
            /// Location record’s custom fields
            public var customFields: CustomFieldModel
            /// DateTime (UTC) that location record was created
            public var createdOn: Date
            /// User ID who created the record.
            public var createdById: Int64
            /// Modified On (UTC) for the record.
            public var modifiedOn: Date
            /// Tells you which location record this record was merged into.
            public var mergedToId: Int64?
            /// ID of the location's Zone
            public var zoneId: Int64?
            /// Tag Type IDs of the location
            public var tagTypeIds: Int64
            /// List of external data attached to this Location,
            /// which corresponds to the application GUID provided in the request.
            public var externalData: ExternalDataModel
            /// ID of the location tax zone
            public var taxZoneId: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateLocationRequest: Codable {
            /// Name of the location
            public var name: String
            /// Address of the location record
            public var address: CustomerAddress
            /// Contacts for the location
            public var contacts: NewCustomerContact?
            /// Location record’s custom fields
            public var customFields: CustomFieldUpdateModel?
            /// Tag type ids for the location
            public var tagTypeIds: Int64?
            /// Optional model that contains a list of external data items
            /// that should be attached to this Location.
            public var externalData: ExternalDataCreateRequest?
            /// ID of the location’s customer.
            public var customerId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateLocationRequest: Codable {
            /// ID of the location’s customer.
            public var customerId: Int64
            /// Name of the location
            public var name: String
            /// Address of the location record
            public var address: AddressPatchModel
            /// If false, the record has been deactivated.
            public var active: Bool
            /// ID of the location tax zone
            public var taxZoneId: Int64
            /// List of custom fields and their values. This list must describe the full list of custom fields on the location.
            /// If location A has values for custom fields X and Y and this field only contains a model for custom field X, then
            /// the value for custom field Y on location A will be removed.
            public var customFields: CustomFieldUpdateModel
            /// List of tag type IDs. If location has tag types X and Y and this field only contains tag type X, then Y will removed from the location.
            /// If it is an empty list, all tags on the location will be removed.
            public var tagTypeIds: Int64
            /// Optional model that contains a list of external data items
            /// that should be updated to this Location.
            public var externalData: ExternalDataUpdateRequest
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AddressPatchModel: Codable {
            /// Street
            public var street: String
            /// Unit
            public var unit: String
            /// City
            public var city: String
            /// State
            public var state: String
            /// Zip
            public var zip: String
            /// Country
            public var country: String
            /// Latitude
            public var latitude: Double?
            /// Longitude
            public var longitude: Double?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationNoteCreateRequest: Codable {
            /// Text content of location note
            public var text: String
            /// Whether to pin location note to the top
            public var pinToTop: Bool?
            /// Whether to add the same note to the location's customer
            public var addToCustomer: Bool?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationContactResponse: Codable, Identifiable {
            /// Id of contact
            public var id: Int64
            /// Type of contact
            public var type: ContactType
            /// Value of contact
            public var value: String
            /// Memo of contact
            public var memo: String?
            /// Phone settings of the location contact
            public var phoneSettings: PhoneSettings
            /// Date/time (in UTC) the contact was last modified
            public var modifiedOn: Date
            /// Date/time (in UTC) the contact was created
            public var createdOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationsContactResponse: Codable, Identifiable {
            /// Id of contact
            public var id: Int64
            /// Type of contact
            public var type: ContactType
            /// Value of contact
            public var value: String
            /// Memo of contact
            public var memo: String?
            /// Phone settings of the location contact
            public var phoneSettings: PhoneSettings
            /// Date/time (in UTC) the contact was last modified
            public var modifiedOn: Date
            /// Date/time (in UTC) the contact was created
            public var createdOn: Date
            /// Id of location
            public var locationId: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationContactCreateRequest: Codable {
            /// Type of contact
            public var type: ContactType
            /// Value of contact
            public var value: String
            /// Memo of contact
            public var memo: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationContactUpdateRequest: Codable {
            /// Type of contact
            public var type: ContactType
            /// Value of contact
            public var value: String
            /// Memo of contact
            public var memo: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateLocationTagResponse: Codable {
            
            public var locationId: Int64
            
            public var tagTypeIds: Int64
        }
    }
}
public extension APIs {
    class Crm: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "crm")
        }
        public func bookingProviderTagsCreate(tenant: Int64, body: Models.Crm.CreateBookingProviderTagRequest) async -> Result<Models.Crm.CreateBookingProviderTagResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider-tags"
            return await bodiedReq(Models.Crm.CreateBookingProviderTagResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func bookingProviderTagsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BookingProviderTagsGetListQuery: URLQueryConvertible {
            /// Name of the booking provider tag
            public var name: String?
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
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
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func bookingProviderTagsGetList(tenant: Int64, query: BookingProviderTagsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.GetBookingProviderTagResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider-tags"
            return await getReq(Models.PaginatedResponse<Models.Crm.GetBookingProviderTagResponse>.self, endpoint: endpoint, params: query)
        }
        public func bookingProviderTagsGet(id: Int64, tenant: Int64) async -> Result<Models.Crm.GetBookingProviderTagResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider-tags/\(id)"
            return await getReq(Models.Crm.GetBookingProviderTagResponse.self, endpoint: endpoint)
        }
        public func bookingProviderTagsUpdate(id: Int64, tenant: Int64, body: Models.Crm.UpdateBookingProviderTagRequest) async -> Result<Models.Crm.BookingProviderTagResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider-tags/\(id)"
            return await bodiedReq(Models.Crm.BookingProviderTagResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func bookingsGet(id: Int64, tenant: Int64) async -> Result<Models.Crm.BookingResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/bookings/\(id)"
            return await getReq(Models.Crm.BookingResponse.self, endpoint: endpoint)
        }
        /// Query Parameters for func bookingsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BookingsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
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
            /// Filters by booking's external ID
            public var externalId: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func bookingsGetList(tenant: Int64, query: BookingsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.BookingResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/bookings"
            return await getReq(Models.PaginatedResponse<Models.Crm.BookingResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func bookingsGetContactList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BookingsGetContactListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func bookingsGetContactList(id: Int64, tenant: Int64, query: BookingsGetContactListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.BookingContactResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/bookings/\(id)/contacts"
            return await getReq(Models.PaginatedResponse<Models.Crm.BookingContactResponse>.self, endpoint: endpoint, params: query)
        }
        public func bookingsGetForProvider(booking_provider: Int64, id: Int64, tenant: Int64) async -> Result<Models.Crm.BookingResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider/\(booking_provider)/bookings/\(id)"
            return await getReq(Models.Crm.BookingResponse.self, endpoint: endpoint)
        }
        public func bookingsUpdate(booking_provider: Int64, id: Int64, tenant: Int64, body: Models.Crm.UpdateBookingRequest) async -> Result<Models.Crm.BookingResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider/\(booking_provider)/bookings/\(id)"
            return await bodiedReq(Models.Crm.BookingResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func bookingsGetList2
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BookingsGetList2Query: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
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
            /// Filters by booking's external ID
            public var externalId: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func bookingsGetList2(booking_provider: Int64, tenant: Int64, query: BookingsGetList2Query? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.BookingResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider/\(booking_provider)/bookings"
            return await getReq(Models.PaginatedResponse<Models.Crm.BookingResponse>.self, endpoint: endpoint, params: query)
        }
        public func bookingsCreate(booking_provider: Int64, tenant: Int64, body: Models.Crm.CreateBookingRequest) async -> Result<Models.Crm.BookingResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider/\(booking_provider)/bookings"
            return await bodiedReq(Models.Crm.BookingResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func bookingsCreateContact(booking_provider: Int64, id: Int64, tenant: Int64, body: Models.Crm.ContactCreateRequest) async -> Result<Models.Crm.BookingContactResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider/\(booking_provider)/bookings/\(id)/contacts"
            return await bodiedReq(Models.Crm.BookingContactResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func bookingsGetContactList2
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BookingsGetContactList2Query: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func bookingsGetContactList2(booking_provider: Int64, id: Int64, tenant: Int64, query: BookingsGetContactList2Query? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.BookingContactResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider/\(booking_provider)/bookings/\(id)/contacts"
            return await getReq(Models.PaginatedResponse<Models.Crm.BookingContactResponse>.self, endpoint: endpoint, params: query)
        }
        public func bookingsUpdateBookingContact(booking_provider: Int64, id: Int64, contactId: Int64, tenant: Int64, body: Models.Crm.UpdateBookingContactRequest) async -> Result<Models.Crm.UpdateBookingContactRequest, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider/\(booking_provider)/bookings/\(id)/contacts/\(contactId)"
            return await bodiedReq(Models.Crm.UpdateBookingContactRequest.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func bookingsDeleteContact(booking_provider: Int64, id: Int64, contactId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/booking-provider/\(booking_provider)/bookings/\(id)/contacts/\(contactId)"
            return await delReq(endpoint: endpoint)
        }
        public func bulkTagsAddTags(tenant: Int64, body: Models.Crm.AddBulkTagsRequest) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/tags"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PUT")
        }
        public func bulkTagsRemoveTags(tenant: Int64, body: Models.Crm.RemoveBulkTagsRequest) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/tags"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func contactMethodsGetContactMethods
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactMethodsGetContactMethodsQuery: URLQueryConvertible {
            /// Filters by reference ID
            public var referenceId: String?
            /// Filters by contact method type
            public var type: String?
            /// Filters by contact method value
            public var value: String?
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
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func contactMethodsGetContactMethods(contactId: String, tenant: Int64, query: ContactMethodsGetContactMethodsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.ContactMethodResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(contactId)/contact-methods"
            return await getReq(Models.PaginatedResponse<Models.Crm.ContactMethodResponse>.self, endpoint: endpoint, params: query)
        }
        public func contactMethodsCreateContactMethod(contactId: String, tenant: Int64, body: Models.Crm.CreateContactMethodRequest) async -> Result<Models.Crm.ContactMethodResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(contactId)/contact-methods"
            return await bodiedReq(Models.Crm.ContactMethodResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func contactMethodsGetContactMethod(contactId: String, contactMethodId: String, tenant: Int64) async -> Result<Models.Crm.ContactMethodResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(contactId)/contact-methods/\(contactMethodId)"
            return await getReq(Models.Crm.ContactMethodResponse.self, endpoint: endpoint)
        }
        public func contactMethodsUpsertContactMethod(contactId: String, contactMethodId: String, tenant: Int64, body: Models.Crm.UpsertContactMethodRequest) async -> Result<Models.Crm.ContactMethodResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(contactId)/contact-methods/\(contactMethodId)"
            return await bodiedReq(Models.Crm.ContactMethodResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func contactMethodsUpdateContactMethod(contactId: String, contactMethodId: String, tenant: Int64, body: Models.Crm.UpdateContactMethodRequest) async -> Result<Models.Crm.ContactMethodResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(contactId)/contact-methods/\(contactMethodId)"
            return await bodiedReq(Models.Crm.ContactMethodResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func contactMethodsDeleteContactMethod(contactId: String, contactMethodId: String, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(contactId)/contact-methods/\(contactMethodId)"
            return await delReq(endpoint: endpoint)
        }
        public func contactsGet(id: String, tenant: Int64) async -> Result<Models.Crm.ContactResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(id)"
            return await getReq(Models.Crm.ContactResponse.self, endpoint: endpoint)
        }
        public func contactsReplace(id: String, tenant: Int64, body: Models.Crm.ReplaceContactRequest) async -> Result<Models.Crm.ContactResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(id)"
            return await bodiedReq(Models.Crm.ContactResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func contactsDeleteContact(id: String, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(id)"
            return await delReq(endpoint: endpoint)
        }
        public func contactsUpdate(id: String, tenant: Int64, body: Models.Crm.UpdateContactRequest) async -> Result<Models.Crm.ContactResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(id)"
            return await bodiedReq(Models.Crm.ContactResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func contactsGetByRelationshipId
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactsGetByRelationshipIdQuery: URLQueryConvertible {
            /// Filters by contact name
            public var name: String?
            /// Filters by contact title
            public var title: String?
            /// Filters by external reference ID
            public var referenceId: String?
            /// Filters by contact archive status
            public var isArchived: String?
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
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func contactsGetByRelationshipId(relationshipId: Int64, tenant: Int64, query: ContactsGetByRelationshipIdQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.ContactResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/relationships/\(relationshipId)"
            return await getReq(Models.PaginatedResponse<Models.Crm.ContactResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func contactsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactsGetListQuery: URLQueryConvertible {
            /// Filters by contact name
            public var name: String?
            /// Filters by contact title
            public var title: String?
            /// Filters by external reference ID
            public var referenceId: String?
            /// Filters by contact archive status
            public var isArchived: String?
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
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func contactsGetList(tenant: Int64, query: ContactsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.ContactResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts"
            return await getReq(Models.PaginatedResponse<Models.Crm.ContactResponse>.self, endpoint: endpoint, params: query)
        }
        public func contactsCreate(tenant: Int64, body: Models.Crm.CreateContactRequest) async -> Result<Models.Crm.ContactResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts"
            return await bodiedReq(Models.Crm.ContactResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func contactsDeleteContactRelationship(contactId: String, relatedEntityId: Int64, typeSlug: String, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(contactId)/relationships/\(relatedEntityId)/\(typeSlug)"
            return await delReq(endpoint: endpoint)
        }
        public func contactsCreateContactRelationship(contactId: String, relatedEntityId: Int64, typeSlug: String, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(contactId)/relationships/\(relatedEntityId)/\(typeSlug)"
            return await bodiedRawReqNoResponse(endpoint: endpoint, body: Data(), method: "POST")
        }
        /// Query Parameters for func contactsGetContactRelationshipList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ContactsGetContactRelationshipListQuery: URLQueryConvertible {
            /// Format - int64. Filters by related entity id
            public var relatedEntityId: Int64?
            /// Relationship type slug: customer, location, booking
            public var typeSlug: String?
            /// Relationship type name: Customer, Location, Booking
            public var typeName: String?
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
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: ID, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func contactsGetContactRelationshipList(contactId: String, tenant: Int64, query: ContactsGetContactRelationshipListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.ContactRelationshipResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/contacts/\(contactId)/relationships"
            return await getReq(Models.PaginatedResponse<Models.Crm.ContactRelationshipResponse>.self, endpoint: endpoint, params: query)
        }
        public func customersGet(id: Int64, tenant: Int64) async -> Result<Models.Crm.CustomerResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)"
            return await getReq(Models.Crm.CustomerResponse.self, endpoint: endpoint)
        }
        public func customersUpdate(id: Int64, tenant: Int64, body: Models.Crm.UpdateCustomerRequest) async -> Result<Models.Crm.CustomerResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)"
            return await bodiedReq(Models.Crm.CustomerResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func customersGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomersGetListQuery: URLQueryConvertible {
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
            /// Returns specific customer records by customer ID.
            public var ids: String?
            /// Format - date-time (as date-time in RFC3339). Returns customer records created before the requested date (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns customer records created on or after the requested date (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Returns customer records modified before the requested date (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns customer records modified after the requested date (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Excludes accounting changes such as balance adjustments from the modified date range.
            public var excludeAccountingChangesFromModifiedDateRange: Bool?
            /// Returns customer records by name.
            public var name: String?
            /// Returns customer records by street.
            public var street: String?
            /// Returns customer records by unit.
            public var unit: String?
            /// Returns customer records by city.
            public var city: String?
            /// Returns customer records by state.
            public var state: String?
            /// Returns customer records by zip.
            public var zip: String?
            /// Returns customer records by country.
            public var country: String?
            /// Format - double. Returns customer records by latitude.
            public var latitude: Double?
            /// Format - double. Returns customer records by longitude.
            public var longitude: Double?
            /// Returns customer records by phone number of contacts.
            public var phone: String?
            /// Returns customer records by active status (only active items will be returned by default).\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - guid. Returns customer records with external data for a particular GUID
            public var externalDataApplicationGuid: String?
            public var externalDataKey: String?
            public var externalDataValues: String?
        }
        public func customersGetList(tenant: Int64, query: CustomersGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.CustomerResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers"
            return await getReq(Models.PaginatedResponse<Models.Crm.CustomerResponse>.self, endpoint: endpoint, params: query)
        }
        public func customersCreate(tenant: Int64, body: Models.Crm.CreateCustomerRequest) async -> Result<Models.Crm.CreatedCustomerResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers"
            return await bodiedReq(Models.Crm.CreatedCustomerResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func customersGetNotes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomersGetNotesQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Returns notes created before the requested date (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns notes created on or after the requested date (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Returns notes modified before the requested date (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns notes modified after the requested date (in UTC)
            public var modifiedOnOrAfter: Date?
        }
        public func customersGetNotes(id: Int64, tenant: Int64, query: CustomersGetNotesQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.NoteResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)/notes"
            return await getReq(Models.PaginatedResponse<Models.Crm.NoteResponse>.self, endpoint: endpoint, params: query)
        }
        public func customersCreateNote(id: Int64, tenant: Int64, body: Models.Crm.CustomerNoteCreateRequest) async -> Result<Models.Crm.NoteResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)/notes"
            return await bodiedReq(Models.Crm.NoteResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func customersDeleteNote(id: Int64, noteId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)/notes/\(noteId)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func customersGetContactList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomersGetContactListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func customersGetContactList(id: Int64, tenant: Int64, query: CustomersGetContactListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.CustomerContactWithModifiedOnResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)/contacts"
            return await getReq(Models.PaginatedResponse<Models.Crm.CustomerContactWithModifiedOnResponse>.self, endpoint: endpoint, params: query)
        }
        public func customersCreateContact(id: Int64, tenant: Int64, body: Models.Crm.CreateCustomerContactRequest) async -> Result<Models.Crm.CustomerContactWithModifiedOnResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)/contacts"
            return await bodiedReq(Models.Crm.CustomerContactWithModifiedOnResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func customersDeleteContact(id: Int64, contactId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)/contacts/\(contactId)"
            return await delReq(endpoint: endpoint)
        }
        public func customersUpdateContact(id: Int64, contactId: Int64, tenant: Int64, body: Models.Crm.UpdateCustomerContactRequest) async -> Result<Models.Crm.CustomerContactWithModifiedOnResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)/contacts/\(contactId)"
            return await bodiedReq(Models.Crm.CustomerContactWithModifiedOnResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func customersGetModifiedContactsList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomersGetModifiedContactsListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC). Either modifiedBefore or modifiedOnOrAfter parameter must be specified
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on/after certain date/time (in UTC). Either modifiedBefore or modifiedOnOrAfter parameter must be specified
            public var modifiedOnOrAfter: Date?
            /// Returns specific contact records by customer IDs.
            public var customerIds: String?
            /// Format - date-time (as date-time in RFC3339). Returns items created before the requested date (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns items created on or after the requested date (in UTC)
            public var createdOnOrAfter: Date?
        }
        public func customersGetModifiedContactsList(tenant: Int64, query: CustomersGetModifiedContactsListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.CustomerContactWithModifiedOnAndCustomerIdResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/contacts"
            return await getReq(Models.PaginatedResponse<Models.Crm.CustomerContactWithModifiedOnAndCustomerIdResponse>.self, endpoint: endpoint, params: query)
        }
        public func customersCreateTag(id: Int64, tagTypeId: Int64, tenant: Int64) async -> Result<Models.Crm.CreateCustomerTagResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)/tags/\(tagTypeId)"
            let response = await bodiedRawRequest(endpoint: endpoint, body: Data(), method: "POST")
            switch response {
            case .success(let data):
                guard let decoded = try? sdk.decoder.decode(Models.Crm.CreateCustomerTagResponse.self, from: data) else {
                    return .failure(.DecodingError("POST: \(endpoint) - Decoding Error"))
                }
                return .success(decoded)
            case .failure(let err): return .failure(err)
            }
        }
        public func customersDeleteTag(id: Int64, tagTypeId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/customers/\(id)/tags/\(tagTypeId)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func exportBookingsGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportBookingsGetQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportBookingsGet(tenant: Int64, query: ExportBookingsGetQuery? = nil) async -> Result<Models.Crm.ExportBookingResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/export/bookings"
            return await getReq(Models.Crm.ExportBookingResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportContactsCustomersContacts
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportContactsCustomersContactsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportContactsCustomersContacts(tenant: Int64, query: ExportContactsCustomersContactsQuery? = nil) async -> Result<Models.Crm.ExportCustomerContactResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/export/customers/contacts"
            return await getReq(Models.Crm.ExportCustomerContactResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportContactsLocationsContacts
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportContactsLocationsContactsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportContactsLocationsContacts(tenant: Int64, query: ExportContactsLocationsContactsQuery? = nil) async -> Result<Models.Crm.ExportLocationContactResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/export/locations/contacts"
            return await getReq(Models.Crm.ExportLocationContactResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportCustomersGetCustomers
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportCustomersGetCustomersQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportCustomersGetCustomers(tenant: Int64, query: ExportCustomersGetCustomersQuery? = nil) async -> Result<Models.Crm.ExportCustomerResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/export/customers"
            return await getReq(Models.Crm.ExportCustomerResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportLeadsLeads
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportLeadsLeadsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportLeadsLeads(tenant: Int64, query: ExportLeadsLeadsQuery? = nil) async -> Result<Models.Crm.ExportLeadsResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/export/leads"
            return await getReq(Models.Crm.ExportLeadsResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportLocationsLocations
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportLocationsLocationsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportLocationsLocations(tenant: Int64, query: ExportLocationsLocationsQuery? = nil) async -> Result<Models.Crm.ExportLocationsResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/export/locations"
            return await getReq(Models.Crm.ExportLocationsResponse.self, endpoint: endpoint, params: query)
        }
        public func leadsGet(id: Int64, tenant: Int64) async -> Result<Models.Crm.LeadResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/leads/\(id)"
            return await getReq(Models.Crm.LeadResponse.self, endpoint: endpoint)
        }
        public func leadsUpdate(id: Int64, tenant: Int64, body: Models.Crm.LeadUpdateRequest) async -> Result<Models.Crm.LeadResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/leads/\(id)"
            return await bodiedReq(Models.Crm.LeadResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func leadsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LeadsGetListQuery: URLQueryConvertible {
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
            /// Format - int64. Filters by associated customer
            public var customerId: Int64?
            /// Allows to filter leads where the customer doesn't have a job, or there is no customer.
            /// Possible values are:
            /// null (return all leads);
            /// true (return leads without customer/jobs);
            /// false (return leads with customer and job)
            public var isProspect: Bool?
            /// Allows to filter leads that don't have a customer or location record associated to it.
            /// Possible values are:
            /// null (return all leads);
            /// true (return leads without customers or locations only);
            /// false (return leads with customers and locations only)
            public var withoutCustomer: Bool?
            /// Filters by status\
            /// Values: [Open, Dismissed, Converted]
            public var status: String?
            /// Filters by customer city
            public var customerCity: String?
            /// Filters by customer state
            public var customerState: String?
            /// Filters by customer zip
            public var customerZip: String?
            /// Format - date-time (as date-time in RFC3339). Returns customers who were created on or before a certain date/time (in UTC)
            public var customerCreatedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Returns customers who were created after a certain date/time (in UTC)
            public var customerCreatedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns customers who were modified on or before a certain date/time (in UTC)
            public var customerModifiedOnOrAfter: Date?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
            /// If true, generates a permanent URL for the lead
            public var genPermUrl: Bool?
        }
        public func leadsGetList(tenant: Int64, query: LeadsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.LeadResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/leads"
            return await getReq(Models.PaginatedResponse<Models.Crm.LeadResponse>.self, endpoint: endpoint, params: query)
        }
        public func leadsCreate(tenant: Int64, body: Models.Crm.LeadCreateRequest) async -> Result<Models.Crm.LeadResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/leads"
            return await bodiedReq(Models.Crm.LeadResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func leadsCreateFollowUp(id: Int64, tenant: Int64, body: Models.Crm.CreateFollowUpRequest) async -> Result<Models.Crm.FollowUpResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/leads/\(id)/follow-up"
            return await bodiedReq(Models.Crm.FollowUpResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func leadsGetNotes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LeadsGetNotesQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Returns notes created before the requested date (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns notes created on or after the requested date (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Returns notes modified before the requested date (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns notes modified after the requested date (in UTC)
            public var modifiedOnOrAfter: Date?
        }
        public func leadsGetNotes(id: Int64, tenant: Int64, query: LeadsGetNotesQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.NoteResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/leads/\(id)/notes"
            return await getReq(Models.PaginatedResponse<Models.Crm.NoteResponse>.self, endpoint: endpoint, params: query)
        }
        public func leadsCreateNote(id: Int64, tenant: Int64, body: Models.Crm.LeadNoteCreateRequest) async -> Result<Models.Crm.NoteResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/leads/\(id)/notes"
            return await bodiedReq(Models.Crm.NoteResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func leadsDismiss(id: Int64, tenant: Int64, body: Models.Crm.DismissLeadRequest) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/leads/\(id)/dismiss"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func leadsSubmitLeadForm
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LeadsSubmitLeadFormQuery: URLQueryConvertible {
            /// Format - int64.
            public var id: Int64
        }
        public func leadsSubmitLeadForm(tenant: Int64, query: LeadsSubmitLeadFormQuery? = nil, body: Models.Crm.SubmitLeadFormRequest) async -> Result<Models.Crm.SubmitLeadFormResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/leads/form"
            return await bodiedReq(Models.Crm.SubmitLeadFormResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func locationsGet(id: Int64, tenant: Int64) async -> Result<Models.Crm.LocationResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)"
            return await getReq(Models.Crm.LocationResponse.self, endpoint: endpoint)
        }
        public func locationsUpdate(id: Int64, tenant: Int64, body: Models.Crm.UpdateLocationRequest) async -> Result<Models.Crm.LocationResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)"
            return await bodiedReq(Models.Crm.LocationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func locationsCreate(tenant: Int64, body: Models.Crm.CreateLocationRequest) async -> Result<Models.Crm.CreateLocationResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations"
            return await bodiedReq(Models.Crm.CreateLocationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func locationsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filters by customer's name
            public var name: String?
            /// Format - int64. Filters by customer ID
            public var customerId: Int64?
            /// Filters by customer's street
            public var street: String?
            /// Filters by customer's unit
            public var unit: String?
            /// Filters by customer's city
            public var city: String?
            /// Filters by customer's state
            public var state: String?
            /// Filters by customer's zip
            public var zip: String?
            /// Filters by customer's country
            public var country: String?
            /// Format - double. Filters by customer's latitude
            public var latitude: Double?
            /// Format - double. Filters by customer's longitude
            public var longitude: Double?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
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
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - guid. Returns location records with external data for a particular GUID
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
        }
        public func locationsGetList(tenant: Int64, query: LocationsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.LocationResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations"
            return await getReq(Models.PaginatedResponse<Models.Crm.LocationResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func locationsGetNotes
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationsGetNotesQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Returns notes created before the requested date (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns notes created on or after the requested date (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Returns notes modified before the requested date (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns notes modified after the requested date (in UTC)
            public var modifiedOnOrAfter: Date?
        }
        public func locationsGetNotes(id: Int64, tenant: Int64, query: LocationsGetNotesQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.NoteResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)/notes"
            return await getReq(Models.PaginatedResponse<Models.Crm.NoteResponse>.self, endpoint: endpoint, params: query)
        }
        public func locationsCreateNote(id: Int64, tenant: Int64, body: Models.Crm.LocationNoteCreateRequest) async -> Result<Models.Crm.NoteResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)/notes"
            return await bodiedReq(Models.Crm.NoteResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func locationsDeleteNote(id: Int64, noteId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)/notes/\(noteId)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func locationsGetContactList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationsGetContactListQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func locationsGetContactList(id: Int64, tenant: Int64, query: LocationsGetContactListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.LocationContactResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)/contacts"
            return await getReq(Models.PaginatedResponse<Models.Crm.LocationContactResponse>.self, endpoint: endpoint, params: query)
        }
        public func locationsCreateContact(id: Int64, tenant: Int64, body: Models.Crm.LocationContactCreateRequest) async -> Result<Models.Crm.LocationContactResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)/contacts"
            return await bodiedReq(Models.Crm.LocationContactResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func locationsGetLocationsContactsList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct LocationsGetLocationsContactsListQuery: URLQueryConvertible {
            /// Format - int32.
            public var page: Int32?
            /// Format - int32.
            public var pageSize: Int32?
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC). Either modifiedBefore or modifiedOnOrAfter parameter must be specified
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on/after certain date/time (in UTC). Either modifiedBefore or modifiedOnOrAfter parameter must be specified
            public var modifiedOnOrAfter: Date?
            /// Returns specific contact records by location IDs.
            public var locationIds: String?
            /// Format - date-time (as date-time in RFC3339). Returns items created before the requested date (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Returns items created on or after the requested date (in UTC)
            public var createdOnOrAfter: Date?
        }
        public func locationsGetLocationsContactsList(tenant: Int64, query: LocationsGetLocationsContactsListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Crm.LocationsContactResponse>, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/contacts"
            return await getReq(Models.PaginatedResponse<Models.Crm.LocationsContactResponse>.self, endpoint: endpoint, params: query)
        }
        public func locationsDeleteContact(id: Int64, contactId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)/contacts/\(contactId)"
            return await delReq(endpoint: endpoint)
        }
        public func locationsUpdateContact(id: Int64, contactId: Int64, tenant: Int64, body: Models.Crm.LocationContactUpdateRequest) async -> Result<Models.Crm.LocationContactResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)/contacts/\(contactId)"
            return await bodiedReq(Models.Crm.LocationContactResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func locationsCreateTag(id: Int64, tagTypeId: Int64, tenant: Int64) async -> Result<Models.Crm.CreateLocationTagResponse, APIError> {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)/tags/\(tagTypeId)"
            let response = await bodiedRawRequest(endpoint: endpoint, body: Data(), method: "POST")
            switch response {
            case .success(let data):
                guard let decoded = try? sdk.decoder.decode(Models.Crm.CreateLocationTagResponse.self, from: data) else {
                    return .failure(.DecodingError("POST: \(endpoint) - Decoding Error"))
                }
                return .success(decoded)
            case .failure(let err): return .failure(err)
            }
        }
        public func locationsDeleteTag(id: Int64, tagTypeId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/crm/v2/tenant/\(tenant)/locations/\(id)/tags/\(tagTypeId)"
            return await delReq(endpoint: endpoint)
        }
    }
}
