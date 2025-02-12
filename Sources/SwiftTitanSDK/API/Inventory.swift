//
//  Inventory.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
public extension Models {
    struct Inventory {
        /// Inventory adjustment response
        public struct InventoryAdjustmentResponse: Codable, Identifiable {
            /// Inventory adjustment Id
            public var id: Int64
            /// Is active
            public var active: Bool
            /// Number
            public var number: String
            /// Reference number
            public var referenceNumber: String
            /// Inventory Adjustment Type
            public var type: String
            /// Id of Inventory Location for this adjustment
            public var inventoryLocationId: Int64
            /// Business Unit Id
            public var businessUnitId: Int64?
            /// Employee who created this adjustment
            public var createdById: Int64?
            /// memo/summary field
            public var memo: String
            /// Adjustment date
            public var date: Date
            /// system created date
            public var createdOn: Date
            /// last time adjustment was modified date
            public var modifiedOn: Date
            /// Batch Id (Deprecated - Use Batch instead)
            public var batchId: Int64?
            /// Batch
            public var batch: BatchResponse?
            /// Sync status
            public var syncStatus: SyncStatus
            /// Reason the adjustment was canceled
            public var canceledReason: InventoryReasonTransactionCanceled?
            /// Employee who canceled this adjustment
            public var canceledById: Int64?
            /// time the adjustment was canceled
            public var dateCanceled: Date?
            /// List of external data attached to this warehouse,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
            /// Collection of adjustment items
            public var items: InventoryAdjustmentItemResponse
            /// Collection of custom fields
            public var customFields: CustomFieldResponse
        }
        /// Represents Batch response
        public struct BatchResponse: Codable, Identifiable {
            /// Batch Id
            public var id: Int64
            /// Batch number
            public var number: String?
            /// Batch name
            public var name: String?
        }
        public enum SyncStatus: String, CaseIterable, Identifiable, Codable {
            case Pending, Posted, Exported
            public var id: String { rawValue }
        }
        public enum InventoryReasonTransactionCanceled: String, CaseIterable, Identifiable, Codable {
            case NotRequired, Duplicate, Accidental, VendorIssue, Other, JobCanceled, NotWarranty, WarrantyRejected
            public var id: String { rawValue }
        }
        
        public struct ExternalDataModel: Codable {
            /// External data key.
            public var key: String
            /// External data value.
            public var value: String
        }
        /// Inventory adjustment item response
        public struct InventoryAdjustmentItemResponse: Codable, Identifiable {
            /// Item Id
            public var id: Int64
            /// Sku Id
            public var skuId: Int64
            /// Item description
            public var description: String
            /// system created date
            public var createdOn: Date
            /// last time transfer item was modified date
            public var modifiedOn: Date
            /// Item name
            public var name: String
            /// Item code
            public var code: String
            /// Adjustment quantity
            public var quantity: Double
            /// Employee who canceled this transfer
            public var createdById: Int64?
            /// Is active
            public var active: Bool
            /// List of serial numbers
            public var serialNumbers: SerialNumberResponse?
        }
        /// Represents serial number response
        public struct SerialNumberResponse: Codable, Identifiable {
            /// Id of this serial number
            public var id: Int64
            /// Serial number value
            public var number: String
        }
        /// Represents custom field response
        public struct CustomFieldResponse: Codable {
            /// Id of custom field type
            public var typeId: Int64
            /// Custom field name
            public var name: String
            /// Custom field value
            public var value: String
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        public enum LogicalOperator: String, CaseIterable, Identifiable, Codable {
            case And, Or
            public var id: String { rawValue }
        }
        /// Default response when creating object with a new ID, or updating object by specified ID.
        public struct ModificationResponse: Codable, Identifiable {
            /// The ID of created/updated object
            public var id: Int64
        }
        /// Represents request to update adjustment
        public struct UpdateAdjustmentRequest: Codable {
            /// Contains a list of external data items that should be attached to this adjustment
            public var externalData: ExternalDataUpdateRequest
        }
        
        public struct ExternalDataUpdateRequest: Codable {
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
        
        public struct ExternalDataUpdateModel: Codable {
            /// External data key.
            public var key: String
            /// External data value.
            public var value: String?
        }
        /// Represents a batch request to update custom fields
        public struct CustomFieldUpdateRequest: Codable {
            /// Collection of custom field update operations
            public var operations: CustomFieldOperationRequest
        }
        /// Represents a request to update custom fields on a single transaction
        public struct CustomFieldOperationRequest: Codable {
            /// Id of inventory transaction where custom fields will be updated
            public var objectId: Int64
            /// Collection of custom fields to be updated
            public var customFields: CustomFieldRequest
        }
        /// Request model to update a single custom field
        public struct CustomFieldRequest: Codable {
            /// Custom field name
            public var name: String
            /// Custom field value
            public var value: String
        }
        
        public struct ExportAdjustmentsResponse: Codable, Identifiable {
            /// Inventory adjustment Id
            public var id: Int64
            /// Is active
            public var active: Bool
            /// Number
            public var number: String
            /// Reference number
            public var referenceNumber: String
            /// Inventory Adjustment Type
            public var type: String
            /// Id of Inventory Location for this adjustment
            public var inventoryLocationId: Int64
            /// Business Unit Id
            public var businessUnitId: Int64?
            /// Employee who created this adjustment
            public var createdById: Int64?
            /// memo/summary field
            public var memo: String
            /// Adjustment date
            public var date: Date
            /// system created date
            public var createdOn: Date
            /// last time adjustment was modified date
            public var modifiedOn: Date
            /// Batch Id (Deprecated - Use Batch instead)
            public var batchId: Int64?
            /// Batch
            public var batch: BatchResponse?
            /// Sync status
            public var syncStatus: SyncStatus
            /// Reason the adjustment was canceled
            public var canceledReason: InventoryReasonTransactionCanceled?
            /// Employee who canceled this adjustment
            public var canceledById: Int64?
            /// time the adjustment was canceled
            public var dateCanceled: Date?
            /// List of external data attached to this warehouse,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
            /// Collection of adjustment items
            public var items: InventoryAdjustmentItemResponse
            /// Collection of custom fields
            public var customFields: CustomFieldResponse
        }
        
        public struct ExportPurchaseOrdersResponse: Codable, Identifiable {
            /// Purchase order Id
            public var id: Int64
            /// Purchase order number
            public var number: String
            /// Id of invoice associated with PO
            public var invoiceId: Int64?
            /// Id of job associated with PO
            public var jobId: Int64?
            /// Id of project associated with PO
            public var projectId: Int64?
            /// Status of this PO
            public var status: String
            /// The purchase order type Id of this PO
            public var typeId: Int64
            /// Id of vendor for this PO
            public var vendorId: Int64
            /// Id of technician for this PO
            public var technicianId: Int64?
            /// Shipping address for this PO
            public var shipTo: AddressResponse
            /// Id of business unit for this PO
            public var businessUnitId: Int64?
            /// Inventory location Id of PO
            public var inventoryLocationId: Int64?
            /// Batch Id of PO
            public var batchId: Int64?
            /// Vendor document number of PO
            public var vendorDocumentNumber: String
            /// PO date
            public var date: Date
            /// PO required on date
            public var requiredOn: Date?
            /// PO sent on date
            public var sentOn: Date?
            /// PO received on date
            public var receivedOn: Date?
            /// When PO was created, system date
            public var createdOn: Date
            /// When PO was last modified, system date
            public var modifiedOn: Date
            /// PO total, including items cost, tax and shipping cost
            public var total: Double
            /// PO tax
            public var tax: Double
            /// PO shipping cost
            public var shipping: Double
            /// PO summary/memo
            public var summary: String
            /// List of PO items
            public var items: PurchaseOrderItemResponse
            /// List of custom fields for this PO
            public var customFields: CustomFieldResponse
        }
        /// Represents address response
        public struct AddressResponse: Codable {
            /// Street
            public var street: String?
            /// Unit
            public var unit: String?
            /// City
            public var city: String?
            /// State
            public var state: String?
            /// Zip code
            public var zip: String?
            /// Country code
            public var country: String?
        }
        /// Represents purchase order item response
        public struct PurchaseOrderItemResponse: Codable, Identifiable {
            /// Item Id
            public var id: Int64
            /// Sku Id
            public var skuId: Int64
            /// Item description
            public var description: String
            /// system created date
            public var createdOn: Date
            /// last time transfer item was modified date
            public var modifiedOn: Date
            /// Item name
            public var skuName: String
            /// Item code
            public var skuCode: String
            /// Item type(material or equipment)
            public var skuType: String
            /// Vendor part number for this item
            public var vendorPartNumber: String
            /// Item quantity
            public var quantity: Double
            /// Quantity received for this item, PO must have at least one receipt for this to be not 0
            public var quantityReceived: Double
            /// Item cost
            public var cost: Double
            /// Item total cost
            public var total: Double
            /// List of serial numbers
            public var serialNumbers: SerialNumberResponse
            /// Item status
            public var status: String
            /// Indicates whether item price is charged to customer
            public var chargeable: Bool
        }
        
        public struct ExportReturnsResponse: Codable, Identifiable {
            /// Return Id
            public var id: Int64
            /// Is active
            public var active: Bool
            /// Number
            public var number: String
            /// Reference number
            public var referenceNumber: String
            /// Status
            public var status: InventoryReturnStatus
            /// Vendor
            public var vendorId: Int64
            /// Purchase order
            public var purchaseOrderId: Int64?
            /// Job
            public var jobId: Int64?
            /// Business unit
            public var businessUnitId: Int64
            /// Inventory location
            public var inventoryLocationId: Int64?
            /// Employee who created this return
            public var createdById: Int64?
            /// Memo/summary field
            public var memo: String
            /// Return total, including tax and shipping
            public var returnAmount: Double
            /// Return tax
            public var taxAmount: Double
            /// Return shipping cost
            public var shippingAmount: Double
            /// Return creation date
            public var returnDate: Date
            /// Date when return was actually processed
            public var returnedOn: Date?
            /// Date when credit was received
            public var creditReceivedOn: Date?
            /// System created date
            public var createdOn: Date
            /// Last time return was modified
            public var modifiedOn: Date
            /// Batch Id (Deprecated - Use Batch instead)
            public var batchId: Int64?
            /// Batch
            public var batch: BatchResponse?
            /// Sync status
            public var syncStatus: SyncStatus
            /// Employee who canceled this transfer
            public var canceledById: Int64?
            /// Reason the transfer was canceled
            public var canceledReason: InventoryReasonTransactionCanceled?
            /// Transfer canceled date
            public var dateCanceled: Date?
            /// Collection of return items
            public var items: InventoryReturnItemResponse
            /// Collection of custom fields
            public var customFields: CustomFieldResponse
            /// List of external data attached to this return,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
        }
        public enum InventoryReturnStatus: String, CaseIterable, Identifiable, Codable {
            case Pending, Returned, CreditReceived, Canceled
            public var id: String { rawValue }
        }
        /// Inventory return item response
        public struct InventoryReturnItemResponse: Codable, Identifiable {
            /// Item Id
            public var id: Int64
            /// Sku Id
            public var skuId: Int64
            /// Item description
            public var description: String
            /// system created date
            public var createdOn: Date
            /// last time transfer item was modified date
            public var modifiedOn: Date
            /// Item name
            public var name: String
            /// Item code
            public var code: String
            /// Return quantity
            public var quantity: Double
            /// Item cost
            public var cost: Double
            /// General ledge account information
            public var generalLedgerAccount: GLAccountResponse?
            /// Cost of sale account information
            public var costOfSaleAccount: GLAccountResponse?
            /// Asset account information
            public var assetAccount: GLAccountResponse?
            /// List of serial numbers
            public var serialNumbers: SerialNumberResponse?
            /// Employee who canceled this transfer
            public var createdById: Int64?
            /// Is active
            public var active: Bool
        }
        /// Represents GL account response
        public struct GLAccountResponse: Codable {
            /// GL Account name
            public var name: String?
            /// GL Account number
            public var number: String?
            /// GL Account type
            public var type: String?
            /// GL Account detail type
            public var detailType: String?
        }
        
        public struct ExportTransfersResponse: Codable, Identifiable {
            /// Inventory transfer Id
            public var id: Int64
            /// Type
            public var transferType: String
            /// Status
            public var status: String
            /// Number
            public var number: String
            /// Reference number
            public var referenceNumber: String
            /// Inventory location to transfer from
            public var fromLocationId: Int64
            /// Inventory location where transfer is going
            public var toLocationId: Int64
            /// Employee who created this transfer
            public var createdById: Int64?
            /// Memo/summary field
            public var memo: String
            /// Transfer date
            public var date: Date
            /// Transfer picked date
            public var pickedDate: Date?
            /// Transfer recevived date
            public var receivedDate: Date?
            /// system created date
            public var createdOn: Date
            /// last time transfer was modified date
            public var modifiedOn: Date
            /// Batch Id (Deprecated - Use Batch instead)
            public var batchId: Int64?
            /// Batch
            public var batch: BatchResponse?
            /// Sync status
            public var syncStatus: SyncStatus
            /// Transfer required by date
            public var dateRequired: Date?
            /// Id of job associated with transfer
            public var jobId: Int64?
            /// Id of invoice associated with transfer
            public var invoiceId: Int64?
            /// Employee who canceled this transfer
            public var canceledById: Int64?
            /// Reason the transfer was canceled
            public var canceledReason: InventoryReasonTransactionCanceled?
            /// Transfer canceled date
            public var dateCanceled: Date?
            /// Is active
            public var active: Bool
            /// Employee who picked this transfer
            public var pickedById: Int64?
            /// Employee who received this transfer
            public var receivedById: Int64?
            /// Collection of transfer items
            public var items: InventoryTransferItemResponse
            /// Collection of custom fields
            public var customFields: CustomFieldResponse
            /// List of external data attached to this return,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel?
        }
        /// Inventory transfer item response
        public struct InventoryTransferItemResponse: Codable, Identifiable {
            /// Item Id
            public var id: Int64
            /// Sku Id
            public var skuId: Int64
            /// Item description
            public var description: String
            /// system created date
            public var createdOn: Date
            /// last time transfer item was modified date
            public var modifiedOn: Date
            /// Item name
            public var name: String
            /// Item code
            public var code: String
            /// Transfer quantity
            public var quantity: Double
            /// Transfer quantity already picked
            public var quantityPicked: Double
            /// List of serial numbers
            public var serialNumbers: SerialNumberResponse?
            /// Employee who canceled this transfer
            public var createdById: Int64?
            /// Is active
            public var active: Bool
        }
        /// Request model to create PO
        public struct CreatePurchaseOrderRequest: Codable {
            /// Id of the vendor for this PO
            public var vendorId: Int64
            /// Id of the purchase order type for this PO
            public var typeId: Int64
            /// Id of the business unit for this PO
            public var businessUnitId: Int64
            /// Id of the inventory location for this PO
            public var inventoryLocationId: Int64
            /// Id of the job for this PO, if not specified non-job PO will be created
            public var jobId: Int64?
            /// Id of the technician for this PO
            public var technicianId: Int64?
            /// Id of the project for this PO
            public var projectId: Int64?
            /// Address where PO will be shipped
            public var shipTo: CreateAddressRequest
            /// Optional vendor invoice number, you should provide it for auto-received POs
            public var vendorInvoiceNumber: String?
            /// Indicates whether this PO will impact technician's payroll
            public var impactsTechnicianPayroll: Bool
            /// Summary/memo for this PO
            public var memo: String?
            /// PO date
            public var date: Date
            /// PO Required On date
            public var requiredOn: Date
            /// Tax
            public var tax: Double
            /// Shipping cost
            public var shipping: Double
            /// List of PO items
            public var items: CreatePurchaseOrderItemRequest
        }
        /// Request model for address with description
        public struct CreateAddressRequest: Codable {
            /// Description of the shipping address, like customer address or technician's truck for example
            public var description: String
            /// Actual shipping address
            public var address: AddressRequest
        }
        /// Request model for actual address
        public struct AddressRequest: Codable {
            /// Street
            public var street: String
            /// Unit
            public var unit: String
            /// City
            public var city: String
            /// State
            public var state: String
            /// Zip code
            public var zip: String
            /// Country code
            public var country: String
        }
        /// Request model for new PO item
        public struct CreatePurchaseOrderItemRequest: Codable {
            /// Id of the SKU from pricebook, can be any active material or equipment
            public var skuId: Int64
            /// Item description
            public var description: String
            /// Part number of this item for current vendor
            public var vendorPartNumber: String
            /// Item quantity
            public var quantity: Double
            /// Item cost
            public var cost: Double
        }
        /// Represents purchase order response
        public struct PurchaseOrderResponse: Codable, Identifiable {
            /// Purchase order Id
            public var id: Int64
            /// Purchase order number
            public var number: String
            /// Id of invoice associated with PO
            public var invoiceId: Int64?
            /// Id of job associated with PO
            public var jobId: Int64?
            /// Id of project associated with PO
            public var projectId: Int64?
            /// Status of this PO
            public var status: String
            /// The purchase order type Id of this PO
            public var typeId: Int64
            /// Id of vendor for this PO
            public var vendorId: Int64
            /// Id of technician for this PO
            public var technicianId: Int64?
            /// Shipping address for this PO
            public var shipTo: AddressResponse
            /// Id of business unit for this PO
            public var businessUnitId: Int64?
            /// Inventory location Id of PO
            public var inventoryLocationId: Int64?
            /// Batch Id of PO
            public var batchId: Int64?
            /// Vendor document number of PO
            public var vendorDocumentNumber: String
            /// PO date
            public var date: Date
            /// PO required on date
            public var requiredOn: Date?
            /// PO sent on date
            public var sentOn: Date?
            /// PO received on date
            public var receivedOn: Date?
            /// When PO was created, system date
            public var createdOn: Date
            /// When PO was last modified, system date
            public var modifiedOn: Date
            /// PO total, including items cost, tax and shipping cost
            public var total: Double
            /// PO tax
            public var tax: Double
            /// PO shipping cost
            public var shipping: Double
            /// PO summary/memo
            public var summary: String
            /// List of PO items
            public var items: PurchaseOrderItemResponse
            /// List of custom fields for this PO
            public var customFields: CustomFieldResponse
        }
        /// Represents purchase order request response
        public struct PurchaseOrderRequestResponse: Codable, Identifiable {
            /// Purchase order request Id
            public var id: Int64
            /// Purchase order request number
            public var requestNumber: String
            /// Status of this PO request
            public var requestStatus: String
            /// Id of invoice associated with PO request
            public var invoiceId: Int64?
            /// Id of job associated with PO request
            public var jobId: Int64?
            /// Id of project associated with PO request
            public var projectId: Int64?
            /// The purchase order type Id of this PO request
            public var typeId: Int64
            /// Id of vendor for this PO request
            public var vendorId: Int64
            /// Id of technician for this PO request
            public var technicianId: Int64?
            /// Shipping address for this PO request
            public var shipTo: AddressResponse?
            /// Id of business unit for this PO request
            public var businessUnitId: Int64?
            /// Inventory location Id of PO request
            public var inventoryLocationId: Int64?
            /// Batch Id of PO request
            public var batchId: Int64?
            /// Vendor document number of PO
            public var vendorDocumentNumber: String?
            /// PO request date
            public var date: Date
            /// PO request required on date
            public var requiredOn: Date?
            /// When PO request was created, system date
            public var createdOn: Date
            /// When PO request was last modified, system date
            public var modifiedOn: Date
            /// PO request total, including items cost, tax and shipping cost
            public var total: Double
            /// PO request tax
            public var tax: Double
            /// PO request shipping cost
            public var shipping: Double
            /// PO request summary/memo
            public var summary: String?
            /// List of PO request items
            public var items: PurchaseOrderItemResponse
            /// List of custom fields for this PO request
            public var customFields: CustomFieldResponse?
        }
        public enum PurchaseOrderRequestStatus: String, CaseIterable, Identifiable, Codable {
            case PendingApproval, Approved, Rejected
            public var id: String { rawValue }
        }
        /// Represents a request to update single purchase order
        public struct UpdatePurchaseOrderRequest: Codable {
            /// Id of the vendor for this PO
            public var vendorId: Int64
            /// Id of the purchase order type for this PO
            public var typeId: Int64
            /// Id of the business unit for this PO
            public var businessUnitId: Int64
            /// Id of the inventory location for this PO
            public var inventoryLocationId: Int64
            /// Id of the job for this PO, if not specified non-job PO will be created
            public var jobId: Int64
            /// Id of the technician for this PO
            public var technicianId: Int64
            /// Id of the project for this PO
            public var projectId: Int64
            /// Address where PO will be shipped
            public var shipTo: UpdateAddressRequest
            /// Vendor invoice number
            public var vendorInvoiceNumber: String
            /// Indicates whether this PO will impact technician's payroll
            public var impactsTechnicianPayroll: Bool
            /// Summary/memo for this PO
            public var memo: String
            /// PO date
            public var date: Date
            /// PO Required On date
            public var requiredOn: Date
            /// Tax
            public var tax: Double
            /// Shipping cost
            public var shipping: Double
            /// List of new/updated PO items. Every active PO item that is not on this list will be marked as inactive
            public var items: UpdatePurchaseOrderItemRequest
        }
        /// Update address with description request
        public struct UpdateAddressRequest: Codable {
            /// Description of the shipping address, like customer address or technician's truck for example
            public var description: String
            /// Actual shipping address
            public var address: AddressRequest
        }
        /// Update purchase order item request
        public struct UpdatePurchaseOrderItemRequest: Codable, Identifiable {
            /// Id of purchase order item to update
            public var id: Int64
            /// Id of the SKU from pricebook, can be any active material or equipment
            public var skuId: Int64
            /// Item description
            public var description: String
            /// Part number of this item for current vendor
            public var vendorPartNumber: String
            /// Item quantity
            public var quantity: Double
            /// Item cost
            public var cost: Double
        }
        /// Cancel Resource Request
        public struct PurchaseOrderCancellationReason: Codable {
            /// Resource cancellation reason
            public var canceledReason: PurchaseOrderCancellationReasonValue
        }
        public enum PurchaseOrderCancellationReasonValue: String, CaseIterable, Identifiable, Codable {
            case NotRequired, Duplicate, Accidental, VendorIssue, Other, JobCanceled
            public var id: String { rawValue }
        }
        
        public struct PurchaseOrderRequestRejectionArgs: Codable {
            /// Resource rejection reason
            public var rejectionReason: PoApprovalRejectionReason
        }
        public enum PoApprovalRejectionReason: String, CaseIterable, Identifiable, Codable {
            case CostTooHigh, WrongVendor, Other
            public var id: String { rawValue }
        }
        /// Represents purchase order markup response
        public struct PurchaseOrderMarkupResponse: Codable, Identifiable {
            
            public var createdOn: Date
            
            public var modifiedOn: Date
            
            public var from: Double
            
            public var to: Double
            
            public var percent: Double
            
            public var id: Int64
        }
        /// Represents create purchase order markup request
        public struct CreatePurchaseOrderMarkupRequest: Codable {
            
            public var from: Double
            
            public var to: Double
            
            public var percent: Double
        }
        /// Represents update purchase order markup request
        public struct UpdatePurchaseOrderMarkupRequest: Codable {
            
            public var from: Double
            
            public var to: Double
            
            public var percent: Double
        }
        /// Request model to create Purchase Order Types
        ///
        public struct CreatePurchaseOrderTypeRequest: Codable {
            /// Name of the Purchase Order Type
            public var name: String
            /// Active
            public var active: Bool
            /// Include in PO Screen
            public var includeInPoScreen: Bool
            /// Automatically receive purchase order
            public var automaticallyReceive: Bool
            /// Display purchase order type to technician
            public var displayToTechnician: Bool
            /// Exclude Tax From Job Costing
            public var excludeTaxFromJobCosting: Bool
            /// Default Selection for Impact to Technician Payroll on Purchase Order
            public var impactToTechnicianPayroll: Bool
            /// Allow permitted technicians to send and receive POs of this type
            public var allowTechniciansToSendPo: Bool
            /// Default number of days to offset required date
            public var defaultRequiredDateDaysOffset: Int32
            /// Skip weekends
            public var skipWeekends: Bool
            /// Include Purchase Order Total in the Sales Tax Calculation
            public var includeInSalesTax: Bool
            /// Is Purchase Order Type Default
            public var isDefault: Bool
            /// Copy Purchase Order Items To Invoice When Received
            public var copyPurchaseOrderItemsToInvoiceWhenReceived: Bool
            /// Is Default For Consignment
            public var isDefaultForConsignment: Bool
            /// Alert definition for the Purchase Order Type
            public var alertSettings: PoTypeAlertSettings
        }
        /// Purchase Order Type Alert settings
        ///
        public struct PoTypeAlertSettings: Codable {
            /// Send Email To Technician When PO Moved To Send
            public var sendEmailToTechnicianWhenPoMovedToSend: Bool
            /// Send Email To Technician When PO Moved To Receive
            public var sendEmailToTechnicianWhenPoMovedToReceived: Bool
            /// Send Email To PM When PO Moved To Send
            public var sendEmailToPmWhenPoMovedToSend: Bool
            /// Send Email To PM When PO Moved To Receive
            public var sendEmailToPmWhenPoMovedToReceived: Bool
        }
        /// Represents purchase order type response
        public struct PurchaseOrderTypeResponse: Codable, Identifiable {
            /// Purchase order type Id
            public var id: Int64
            /// Purchase order type Name
            public var name: String
            /// Active
            public var active: Bool
            /// Automatically receive purchase order
            public var automaticallyReceive: Bool
            /// Display purchase order type to technicain on mobile
            public var displayToTechnician: Bool
            /// Default Selection for Impact to Technician Payroll on Purchase Order
            public var impactToTechnicianPayroll: Bool
            /// Allow permitted technicians to send and receive POs of this type
            public var allowTechniciansToSendPo: Bool
            /// Default number of days to offset required date
            public var defaultRequiredDateDaysOffset: Int32
            /// Skip weekends
            public var skipWeekends: Bool
            /// Exclude tax from job costing
            public var excludeTaxFromJobCosting: Bool
            /// System created date
            public var createdOn: Date
            /// Last time purchase order type was modified date
            public var modifiedOn: Date
        }
        /// Request model to Update Purchase Order Types
        public struct UpdatePurchaseOrderTypeRequest: Codable {
            /// Is the Purchase Order Type Active
            public var active: Bool
            /// Name of the Purchase Order Type
            public var name: String
            /// Should the Purchase Order Type be included in the Purchase Order screen
            public var includeInPoScreen: Bool
            /// Should the Purchase Order be automatically received
            public var automaticallyReceive: Bool
            /// Should the Purchase Order Type be displayed to the technician on mobile
            public var displayToTechnician: Bool
            /// Should the Purchase Order Type be excluded from job costing
            public var excludeTaxFromJobCosting: Bool
            /// Should the Purchase Order Type impact technician payroll
            public var impactToTechnicianPayroll: Bool
            /// Should the Purchase Order Type allow technicians to send POs
            public var allowTechniciansToSendPo: Bool
            /// Default number of days to offset required date
            public var defaultRequiredDateDaysOffset: Int32
            /// Skip weekends
            public var skipWeekends: Bool
            /// Should the Purchase Order Type be included in sales tax
            public var includeInSalesTax: Bool
            /// Should the Purchase Order Type be the default
            public var isDefault: Bool
            /// Should the Purchase Order Type copy purchase order items to invoice when received
            public var copyPurchaseOrderItemsToInvoiceWhenReceived: Bool
            /// Should the Purchase Order Type be the default for consignment
            public var isDefaultForConsignment: Bool
            /// Alert definition for the Purchase Order Type
            public var alertSettings: PoTypeAlertSettings
        }
        /// Inventory receipt response
        public struct InventoryReceiptResponse: Codable, Identifiable {
            /// Receipt Id
            public var id: Int64
            /// Is active
            public var active: Bool
            /// Number
            public var number: String
            /// Vendor invoice number
            public var vendorInvoiceNumber: String
            /// User who created this receipt
            public var createdById: Int64?
            /// Memo/summary field
            public var memo: String
            /// Id of purchase order
            public var purchaseOrderId: Int64
            /// Id of bill
            public var billId: Int64?
            /// Id of job
            public var jobId: Int64?
            /// Id of business unit
            public var businessUnitId: Int64?
            /// Id of vendor
            public var vendorId: Int64
            /// Id of technician
            public var technicianId: Int64?
            /// Id of inventory location
            public var inventoryLocationId: Int64
            /// Ship to address
            public var shipTo: AddressResponse?
            /// Ship to description
            public var shipToDescription: String
            /// Receipt total, including tax and shipping
            public var receiptAmount: Double
            /// Receipt tax
            public var taxAmount: Double
            /// Receipt shipping cost
            public var shippingAmount: Double
            /// Date received
            public var receivedOn: Date?
            /// System created date
            public var createdOn: Date
            /// last time receipt was modified
            public var modifiedOn: Date
            /// Id of batch
            public var batchId: Int64?
            /// Sync status
            public var syncStatus: SyncStatus
            /// Collection of receipt items
            public var items: InventoryReceiptItemResponse
            /// Collection of custom fields
            public var customFields: CustomFieldResponse
        }
        /// Inventory receipt item response
        public struct InventoryReceiptItemResponse: Codable, Identifiable {
            /// Item Id
            public var id: Int64
            /// Sku Id
            public var skuId: Int64
            /// Item Name
            public var name: String
            /// Item Code
            public var code: String
            /// Item Description
            public var description: String
            /// Receipt quantity
            public var quantity: Double
            /// Item cost
            public var cost: Double
            /// General ledge account information
            public var generalLedgerAccount: GLAccountResponse?
            /// Cost of sale account information
            public var costOfSaleAccount: GLAccountResponse?
            /// Asset account information
            public var assetAccount: GLAccountResponse?
        }
        /// Request model to create Purchase Order Receipt
        public struct ReceivePurchaseOrderRequest: Codable {
            /// Id of the purchase order for this receipt
            public var purchaseOrderId: Int64
            /// Receipt date
            public var dateReceived: Date
            /// Vendor Document number
            public var vendorDocumentNumber: String?
            /// Receipt memo
            public var memo: String?
            /// Receipt tax
            public var tax: Double
            /// Receipt shipping cost
            public var shipping: Double
            /// List of PO items
            public var items: ReceivePurchaseOrderItemRequest
        }
        
        public struct ReceivePurchaseOrderItemRequest: Codable {
            /// Id of purchase order item
            public var purchaseOrderItemId: Int64?
            /// Id of the SKU from pricebook, can be any active material or equipment
            public var skuId: Int64
            /// Item description
            public var description: String?
            /// Part number of this item for current vendor
            public var vendorPartNumber: String?
            /// Item quantity
            public var quantity: Double
            /// Item cost
            public var cost: Double
        }
        /// Cancel Resource Request
        public struct ReceiptCancellationReason: Codable {
            /// Resource cancellation reason
            public var canceledReason: ReceiptCancellationReasonValue
        }
        public enum ReceiptCancellationReasonValue: String, CaseIterable, Identifiable, Codable {
            case NotRequired, Duplicate, Accidental, VendorIssue, Other, JobCanceled
            public var id: String { rawValue }
        }
        /// Inventory return response
        public struct InventoryReturnResponse: Codable, Identifiable {
            /// Return Id
            public var id: Int64
            /// Is active
            public var active: Bool
            /// Number
            public var number: String
            /// Reference number
            public var referenceNumber: String
            /// Status
            public var status: InventoryReturnStatus
            /// Vendor
            public var vendorId: Int64
            /// Purchase order
            public var purchaseOrderId: Int64?
            /// Job
            public var jobId: Int64?
            /// Business unit
            public var businessUnitId: Int64
            /// Inventory location
            public var inventoryLocationId: Int64?
            /// Employee who created this return
            public var createdById: Int64?
            /// Memo/summary field
            public var memo: String
            /// Return total, including tax and shipping
            public var returnAmount: Double
            /// Return tax
            public var taxAmount: Double
            /// Return shipping cost
            public var shippingAmount: Double
            /// Return creation date
            public var returnDate: Date
            /// Date when return was actually processed
            public var returnedOn: Date?
            /// Date when credit was received
            public var creditReceivedOn: Date?
            /// System created date
            public var createdOn: Date
            /// Last time return was modified
            public var modifiedOn: Date
            /// Batch Id (Deprecated - Use Batch instead)
            public var batchId: Int64?
            /// Batch
            public var batch: BatchResponse?
            /// Sync status
            public var syncStatus: SyncStatus
            /// Employee who canceled this transfer
            public var canceledById: Int64?
            /// Reason the transfer was canceled
            public var canceledReason: InventoryReasonTransactionCanceled?
            /// Transfer canceled date
            public var dateCanceled: Date?
            /// Collection of return items
            public var items: InventoryReturnItemResponse
            /// Collection of custom fields
            public var customFields: CustomFieldResponse
            /// List of external data attached to this return,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
        }
        /// Represents request to update return
        public struct UpdateReturnRequest: Codable {
            /// Return type Id
            public var returnTypeId: Int64
            /// Business unit Id
            public var businessUnitId: Int64
            /// Reference Number
            public var referenceNumber: String
            /// Inventory location Id
            public var inventoryLocationId: Int64
            /// Return Date
            public var returnDate: Date
            /// Memo
            public var memo: String
            /// Tax
            public var tax: Double?
            /// Shipping
            public var shipping: Double?
            /// Restocking Fee
            public var restockingFee: Double?
            /// List of return items
            public var items: UpdateReturnItemModel
            /// Contains a list of external data items that should be attached to this return
            public var externalData: ExternalDataUpdateRequest
        }
        
        public struct UpdateReturnItemModel: Codable, Identifiable {
            /// Item ID
            public var id: Int64
            /// SKU ID
            public var skuId: Int64
            /// Item Description
            public var itemDescription: String?
            /// Quantity
            public var quantity: Double
            /// Cost
            public var cost: Double
        }
        /// Cancel Resource Request
        public struct ReturnCancellationReason: Codable {
            /// Resource cancellation reason
            public var canceledReason: ReturnCancellationReasonValue
        }
        public enum ReturnCancellationReasonValue: String, CaseIterable, Identifiable, Codable {
            case NotRequired, Duplicate, Accidental, VendorIssue, Other, JobCanceled
            public var id: String { rawValue }
        }
        /// Represents request to create return
        public struct CreateInventoryReturnRequest: Codable {
            /// Vendor Id
            public var vendorId: Int64
            /// Job Id
            public var jobId: Int64?
            /// Purchase order Id
            public var purchaseOrderId: Int64?
            /// Return type Id
            public var returnTypeId: Int64
            /// Business unit Id
            public var businessUnitId: Int64
            /// Reference number
            public var referenceNumber: String?
            /// Location Id
            public var inventoryLocationId: Int64
            /// Return date
            public var returnDate: Date
            /// Memo/summary field
            public var memo: String?
            /// Tax rate
            public var tax: Double
            /// Shipping cost
            public var shipping: Double
            /// Restocking fee
            public var restockingFee: Double
            
            public var items: CreateInventoryReturnItemRequest?
        }
        /// Inventory return create item request
        public struct CreateInventoryReturnItemRequest: Codable {
            /// Sku Id
            public var skuId: Int64
            /// Item description
            public var description: String?
            /// Quantity
            public var quantity: Double
            /// Cost
            public var cost: Double
        }
        /// Request model to create Return Types
        public struct CreateReturnTypeRequest: Codable {
            /// Name of the Return Type
            public var name: String
            /// Should the return type allow receiving Vendor Credits automatically.
            public var automaticallyReceiveVendorCredit: Bool
            
            public var includeInSalesTax: Bool
            
            public var isDefault: Bool
            
            public var isDefaultForConsignment: Bool
        }
        /// Request model to Update Return Types
        public struct UpdateReturnTypeRequest: Codable, Identifiable {
            /// Id of the Return Type
            public var id: Int64
            /// Is the Return Type Active
            public var active: Bool
            /// Name of the Return Type
            public var name: String
            /// Should the return type allow receiving Vendor Credits automatically.
            public var automaticallyReceiveVendorCredit: Bool
            
            public var includeInSalesTax: Bool
            
            public var isDefault: Bool
            
            public var isDefaultForConsignment: Bool
        }
        
        public struct ListReturnTypesResponse: Codable, Identifiable {
            /// Return Id
            public var id: Int64
            /// Name of the Return Type
            public var name: String?
            /// Should the return type allow receiving Vendor Credits automatically.
            public var automaticallyReceiveVendorCredit: Bool
            
            public var includeInSalesTax: Bool
            
            public var active: Bool
            
            public var isDefault: Bool
            
            public var isDefaultForConsignment: Bool
            /// System created date
            public var createdOn: Date
            /// Last time return type was modified date
            public var modifiedOn: Date
        }
        /// Inventory transfer response
        public struct InventoryTransferResponse: Codable, Identifiable {
            /// Inventory transfer Id
            public var id: Int64
            /// Type
            public var transferType: String
            /// Status
            public var status: String
            /// Number
            public var number: String
            /// Reference number
            public var referenceNumber: String
            /// Inventory location to transfer from
            public var fromLocationId: Int64
            /// Inventory location where transfer is going
            public var toLocationId: Int64
            /// Employee who created this transfer
            public var createdById: Int64?
            /// Memo/summary field
            public var memo: String
            /// Transfer date
            public var date: Date
            /// Transfer picked date
            public var pickedDate: Date?
            /// Transfer recevived date
            public var receivedDate: Date?
            /// system created date
            public var createdOn: Date
            /// last time transfer was modified date
            public var modifiedOn: Date
            /// Batch Id (Deprecated - Use Batch instead)
            public var batchId: Int64?
            /// Batch
            public var batch: BatchResponse?
            /// Sync status
            public var syncStatus: SyncStatus
            /// Transfer required by date
            public var dateRequired: Date?
            /// Id of job associated with transfer
            public var jobId: Int64?
            /// Id of invoice associated with transfer
            public var invoiceId: Int64?
            /// Employee who canceled this transfer
            public var canceledById: Int64?
            /// Reason the transfer was canceled
            public var canceledReason: InventoryReasonTransactionCanceled?
            /// Transfer canceled date
            public var dateCanceled: Date?
            /// Is active
            public var active: Bool
            /// Employee who picked this transfer
            public var pickedById: Int64?
            /// Employee who received this transfer
            public var receivedById: Int64?
            /// Collection of transfer items
            public var items: InventoryTransferItemResponse
            /// Collection of custom fields
            public var customFields: CustomFieldResponse
            /// List of external data attached to this return,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel?
        }
        /// Represents request to update transfer
        public struct UpdateTransferRequest: Codable {
            /// Contains a list of external data items that should be attached to this transfer
            public var externalData: ExternalDataUpdateRequest
        }
        /// Represents truck response
        public struct TruckResponse: Codable, Identifiable {
            /// Truck Id
            public var id: Int64
            /// Truck Name
            public var name: String
            /// Active
            public var active: Bool
            /// Memo
            public var memo: String
            /// Warehouse Id for this truck
            public var warehouseId: Int64?
            /// Technician Ids associated with this truck
            public var technicianIds: Int64
            /// System created date
            public var createdOn: Date
            /// Last time truck was modified date
            public var modifiedOn: Date
            /// List of external data attached to this warehouse,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
        }
        /// Represents a request to update truck
        public struct UpdateTruckRequest: Codable {
            /// Contains a list of external data items that should be attached to this truck
            public var externalData: ExternalDataUpdateRequest
        }
        /// Request model to create vendor
        public struct CreateVendorRequest: Codable {
            /// Name
            public var name: String
            /// Active
            public var active: Bool
            /// Memo
            public var memo: String?
            /// Contact First name
            public var firstName: String?
            /// Contact Last Name
            public var lastName: String?
            /// Contact Phone
            public var phone: String?
            /// Contact Email
            public var email: String?
            /// Contact Fax
            public var fax: String?
            /// Replenishment Vendor
            public var isTruckReplenishment: Bool
            /// Default PO Delivery Method
            public var deliveryOption: PurchaseOrderDeliveryOption?
            /// Default Tax Rate
            public var taxRate: Double
            /// Restrict PO Creation in Mobile
            public var restrictedMobileCreation: Bool
            /// Vendor Quickbooks Item
            public var vendorQuickbooksItem: String?
            /// Payment Term Id
            public var paymentTermId: Int64?
            /// Remittance Vendor Id
            public var remittanceVendorId: Int64?
            /// Address
            public var address: AddressRequest
            /// Optional model that contains a list of external data items
            /// that should be attached to this vendor.
            public var externalData: ExternalDataCreateRequest?
            /// Tags
            public var tags: TagRequest?
            /// Email Recipients
            public var vendorContacts: CreateVendorContactRequest?
        }
        public enum PurchaseOrderDeliveryOption: String, CaseIterable, Identifiable, Codable {
            case Manual, EmailAsExcel, EmailAsPdf, EmailAsPdfRollupView, Electronic, MarkAsSent, EmailAsExcelAndPdf
            public var id: String { rawValue }
        }
        
        public struct ExternalDataCreateRequest: Codable {
            /// Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided.
            public var applicationGuid: String
            /// External data list.
            public var externalData: ExternalDataModel
        }
        /// Represents tag request
        public struct TagRequest: Codable {
            /// Tag Type Id
            public var tagTypeId: Int64
        }
        /// Request model to create vendor contact
        public struct CreateVendorContactRequest: Codable {
            /// Name
            public var name: String
            /// Email
            public var email: String
        }
        /// Vendor response
        public struct VendorResponse: Codable, Identifiable {
            /// Vendor Id
            public var id: Int64
            /// Vendor name
            public var name: String
            /// Active/Inactive status
            public var active: Bool
            /// Indicates if vendor can be used for replenishment
            public var isTruckReplenishment: Bool
            /// Indicates if vendor can be used for purchasing on mobile
            public var isMobileCreationRestricted: Bool
            /// Vendor memo
            public var memo: String
            /// Default delivery option
            public var deliveryOption: String
            /// Default tax rate for this vendor
            public var defaultTaxRate: Double
            /// Vendor contact information
            public var contactInfo: VendorContactInfoResponse
            /// Vendor address
            public var address: AddressResponse
            /// system created date
            public var createdOn: Date
            /// last time adjustment was modified date
            public var modifiedOn: Date
            /// List of external data attached to this vendor,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
        }
        /// Vendor contact info response
        public struct VendorContactInfoResponse: Codable {
            /// Vendor first name
            public var firstName: String
            /// Vendor last name
            public var lastName: String
            /// Vendor phone
            public var phone: String
            /// Vendor email
            public var email: String
            /// Vendor fax
            public var fax: String
        }
        /// Represents request to update vendor
        public struct UpdateVendorRequest: Codable {
            /// Name
            public var name: String
            /// Active
            public var active: Bool
            /// Memo
            public var memo: String
            /// Contact First name
            public var firstName: String
            /// Contact Last Name
            public var lastName: String
            /// Contact Phone
            public var phone: String
            /// Contact Email
            public var email: String
            /// Contact Fax
            public var fax: String
            /// Replenishment Vendor
            public var isTruckReplenishment: Bool
            /// Default PO Delivery Method
            public var deliveryOption: PurchaseOrderDeliveryOption
            /// Default Tax Rate
            public var taxRate: Double
            /// Restrict PO Creation in Mobile
            public var restrictedMobileCreation: Bool
            /// Vendor Quickbooks Item
            public var vendorQuickbooksItem: String
            /// Payment Term Id
            public var paymentTermId: Int64
            /// Remittance Vendor Id
            public var remittanceVendorId: Int64
            /// Address
            public var address: AddressRequest
            /// Tags
            public var tags: TagRequest
            /// Email Recipients
            public var vendorContacts: UpdateVendorContactRequest
            /// Contains a list of external data items that should be attached to this vendor
            public var externalData: ExternalDataUpdateRequest
        }
        /// Represents request to update vendor contact
        public struct UpdateVendorContactRequest: Codable {
            /// Id of Vendor Contact to update
            public var id: Int64?
            /// Name
            public var name: String
            /// Email
            public var email: String
        }
        /// Represents warehouse response
        public struct WarehouseResponse: Codable, Identifiable {
            /// Warehouse Id
            public var id: Int64
            /// Warehouse Name
            public var name: String
            /// Active
            public var active: Bool
            /// Warehouse address
            public var address: AddressResponse
            /// System created date
            public var createdOn: Date
            /// Last time warehouse was modified date
            public var modifiedOn: Date
            /// List of external data attached to this warehouse,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel
        }
        /// Represents a request to update warehouse
        public struct UpdateWarehouseRequest: Codable {
            /// Contains a list of external data items that should be attached to this warehouse
            public var externalData: ExternalDataUpdateRequest
        }
    }
}
public extension APIs {
    class Inventory: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "inventory")
        }
        /// Query Parameters for func adjustmentsGetList
        public struct AdjustmentsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
            /// Number filter
            public var number: String?
            /// Reference number filter
            public var referenceNumber: String?
            /// Format - int64. BatchId filter
            public var batchId: Int64?
            /// Filter by a collection of inventory location Ids
            public var inventoryLocationIds: String?
            /// Filter by a collection of adjustment types
            public var adjustmentTypes: String?
            /// Filter by a collection of business unit Ids
            public var businessUnitIds: String?
            /// Filter by a collection of sync statues
            public var syncStatuses: String?
            /// Format - date-time (as date-time in RFC3339). Return adjustments with date on or after certain date/time
            public var dateOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return adjustments with date before certain date/time
            public var dateBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
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
        public func adjustmentsGetList(tenant: Int64, query: AdjustmentsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.InventoryAdjustmentResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/adjustments"
            return await getReq(Models.PaginatedResponse<Models.Inventory.InventoryAdjustmentResponse>.self, endpoint: endpoint, params: query)
        }
        public func adjustmentsUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdateAdjustmentRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/adjustments/\(id)"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func adjustmentsUpdateCustomFields(tenant: Int64, body: Models.Inventory.CustomFieldUpdateRequest) async -> APIError? {
            let endpoint = "/inventory/v2/tenant/\(tenant)/adjustments/custom-fields"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func exportAdjustments
        public struct ExportAdjustmentsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportAdjustments(tenant: Int64, query: ExportAdjustmentsQuery? = nil) async -> Result<Models.Inventory.ExportAdjustmentsResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/export/adjustments"
            return await getReq(Models.Inventory.ExportAdjustmentsResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportPurchaseOrders
        public struct ExportPurchaseOrdersQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportPurchaseOrders(tenant: Int64, query: ExportPurchaseOrdersQuery? = nil) async -> Result<Models.Inventory.ExportPurchaseOrdersResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/export/purchase-orders"
            return await getReq(Models.Inventory.ExportPurchaseOrdersResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportReturns
        public struct ExportReturnsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportReturns(tenant: Int64, query: ExportReturnsQuery? = nil) async -> Result<Models.Inventory.ExportReturnsResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/export/returns"
            return await getReq(Models.Inventory.ExportReturnsResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportTransfers
        public struct ExportTransfersQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportTransfers(tenant: Int64, query: ExportTransfersQuery? = nil) async -> Result<Models.Inventory.ExportTransfersResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/export/transfers"
            return await getReq(Models.Inventory.ExportTransfersResponse.self, endpoint: endpoint, params: query)
        }
        public func purchaseOrdersCreate(tenant: Int64, body: Models.Inventory.CreatePurchaseOrderRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-orders"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func purchaseOrdersGetList
        public struct PurchaseOrdersGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filters by PO status
            /// \
            /// Available values are: Pending, Sent, PartiallyReceived, Received, Exported, Canceled
            public var status: String?
            /// Filters by PO number
            public var number: String?
            /// Format - int64. Filters by JobId associated with PO
            public var jobId: Int64?
            /// Filters by JobIds associated with PO
            public var jobIds: String?
            /// Format - int64. Filter by TechnicianId associated with PO
            public var technicianId: Int64?
            /// Format - int64. Filter by ProjectId associated with PO
            public var projectId: Int64?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return POs with date on or after certain date/time
            public var dateOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return POs with date before certain date/time
            public var dateBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return POs sent on or after certain date/time
            public var sentOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return POs sent before certain date/time
            public var sentBefore: Date?
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
        public func purchaseOrdersGetList(tenant: Int64, query: PurchaseOrdersGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.PurchaseOrderResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-orders"
            return await getReq(Models.PaginatedResponse<Models.Inventory.PurchaseOrderResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func purchaseOrdersGetRequests
        public struct PurchaseOrdersGetRequestsQuery: URLQueryConvertible {
            public var ids: String?
            /// Filters by PO request status
            /// Available values are: PendingApproval, Rejected\
            /// Values: [PendingApproval, Approved, Rejected]
            public var requestStatus: String?
            /// Filters by PO request number
            public var requestNumber: String?
            /// Format - int64. Filters by JobId associated with PO request
            public var jobId: Int64?
            /// Filters by JobIds associated with PO request
            public var jobIds: String?
            /// Format - int64. Filter by TechnicianId associated with PO request
            public var technicianId: Int64?
            /// Format - int64. Filter by ProjectId associated with PO request
            public var projectId: Int64?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return PO requests with date on or after certain date/time
            public var dateOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return PO requests with date before certain date/time
            public var dateBefore: Date?
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
        public func purchaseOrdersGetRequests(tenant: Int64, query: PurchaseOrdersGetRequestsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.PurchaseOrderRequestResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-orders/requests"
            return await getReq(Models.PaginatedResponse<Models.Inventory.PurchaseOrderRequestResponse>.self, endpoint: endpoint, params: query)
        }
        public func purchaseOrdersGetById(id: Int64, tenant: Int64) async -> Result<Models.Inventory.PurchaseOrderResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-orders/\(id)"
            return await getReq(Models.Inventory.PurchaseOrderResponse.self, endpoint: endpoint)
        }
        public func purchaseOrdersUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdatePurchaseOrderRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-orders/\(id)"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func purchaseOrdersCancel(id: Int64, tenant: Int64, body: Models.Inventory.PurchaseOrderCancellationReason) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-orders/\(id)/cancellation"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func purchaseOrdersApproveRequest(id: Int64, tenant: Int64) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-orders/requests/\(id)/approve"
            return await bodiedRawRequest(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: Data(), method: "PATCH")
        }
        public func purchaseOrdersRejectRequest(id: Int64, tenant: Int64, body: Models.Inventory.PurchaseOrderRequestRejectionArgs) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-orders/requests/\(id)/reject"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func purchaseOrdersMarkupGet
        public struct PurchaseOrdersMarkupGetQuery: URLQueryConvertible {
            public var ids: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - int32.
            public var page: Int32?
            /// Format - int32.
            public var pageSize: Int32?
            public var includeTotal: Bool?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, From, To, Percent
            public var sort: String?
        }
        public func purchaseOrdersMarkupGet(tenant: Int64, query: PurchaseOrdersMarkupGetQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.PurchaseOrderMarkupResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-order-markups"
            return await getReq(Models.PaginatedResponse<Models.Inventory.PurchaseOrderMarkupResponse>.self, endpoint: endpoint, params: query)
        }
        public func purchaseOrdersMarkupCreate(tenant: Int64, body: Models.Inventory.CreatePurchaseOrderMarkupRequest) async -> Result<Models.Inventory.PurchaseOrderMarkupResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-order-markups"
            return await bodiedReq(Models.Inventory.PurchaseOrderMarkupResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func purchaseOrdersMarkupGetById(id: Int64, tenant: Int64) async -> Result<Models.Inventory.PurchaseOrderMarkupResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-order-markups/\(id)"
            return await getReq(Models.Inventory.PurchaseOrderMarkupResponse.self, endpoint: endpoint)
        }
        public func purchaseOrdersMarkupUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdatePurchaseOrderMarkupRequest) async -> Result<Models.Inventory.PurchaseOrderMarkupResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-order-markups/\(id)"
            return await bodiedReq(Models.Inventory.PurchaseOrderMarkupResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func purchaseOrdersMarkupDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-order-markups/\(id)"
            return await delReq(endpoint: endpoint)
        }
        public func purchaseOrderTypesCreate(tenant: Int64, body: Models.Inventory.CreatePurchaseOrderTypeRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-order-types"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func purchaseOrderTypesGetList
        public struct PurchaseOrderTypesGetListQuery: URLQueryConvertible {
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
            /// Available fields are: Id, ModifiedOn, CreatedOn.
            public var sort: String?
        }
        public func purchaseOrderTypesGetList(tenant: Int64, query: PurchaseOrderTypesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.PurchaseOrderTypeResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-order-types"
            return await getReq(Models.PaginatedResponse<Models.Inventory.PurchaseOrderTypeResponse>.self, endpoint: endpoint, params: query)
        }
        public func purchaseOrderTypesUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdatePurchaseOrderTypeRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/purchase-order-types/\(id)"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func receiptsGetList
        public struct ReceiptsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Number filter
            public var number: String?
            /// Vendor invoice number filter
            public var vendorInvoiceNumber: String?
            /// Format - int64. BillId filter
            public var billId: Int64?
            /// Format - int64. BatchId filter
            public var batchId: Int64?
            /// Filter by a collection of vendors
            public var vendorIds: String?
            /// Filter by a collection of business units
            public var businessUnitIds: String?
            /// Filter by a collection of inventory locations
            public var inventoryLocationIds: String?
            /// Filter by a collection of purchase orders
            public var purchaseOrderIds: String?
            /// Filter by a collection of sync statuses
            public var syncStatuses: String?
            /// Format - date-time (as date-time in RFC3339). Return receipts with received date on or after certain date/time
            public var receivedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return receipts with received date before certain date/time
            public var receivedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
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
        public func receiptsGetList(tenant: Int64, query: ReceiptsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.InventoryReceiptResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/receipts"
            return await getReq(Models.PaginatedResponse<Models.Inventory.InventoryReceiptResponse>.self, endpoint: endpoint, params: query)
        }
        public func receiptsCreateReceipt(tenant: Int64, body: Models.Inventory.ReceivePurchaseOrderRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/receipts"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func receiptsUpdateCustomFields(tenant: Int64, body: Models.Inventory.CustomFieldUpdateRequest) async -> APIError? {
            let endpoint = "/inventory/v2/tenant/\(tenant)/receipts/custom-fields"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func receiptsCancelReceipts
        public struct ReceiptsCancelReceiptsQuery: URLQueryConvertible {
            /// Format - int64.
            public var id: Int64
        }
        public func receiptsCancelReceipts(tenant: Int64, id: Int64, query: ReceiptsCancelReceiptsQuery? = nil, body: Models.Inventory.ReceiptCancellationReason) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/receipts/\(id)/cancellation"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func returnsGetList
        public struct ReturnsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Number filter
            public var number: String?
            /// Reference number filter
            public var referenceNumber: String?
            /// Format - int64. Job filter
            public var jobId: Int64?
            /// Format - int64. Purchase order filter
            public var purchaseOrderId: Int64?
            /// Format - int64. Batch filter
            public var batchId: Int64?
            /// Filter by a collection of vendors
            public var vendorIds: String?
            /// Filter by a collection of business units
            public var businessUnitIds: String?
            /// Filter by a collection of inventory locations
            public var inventoryLocationIds: String?
            /// Filter by a collection of sync statuses
            public var syncStatuses: String?
            /// Format - date-time (as date-time in RFC3339). Filters by returns with return date on or after certain date/time
            public var returnDateOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Filters by returns with return date before certain date/time
            public var returnDateBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
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
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
        }
        public func returnsGetList(tenant: Int64, query: ReturnsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.InventoryReturnResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/returns"
            return await getReq(Models.PaginatedResponse<Models.Inventory.InventoryReturnResponse>.self, endpoint: endpoint, params: query)
        }
        public func returnsCreateReturn(tenant: Int64, body: Models.Inventory.CreateInventoryReturnRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/returns"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func returnsUpdateCustomFields(tenant: Int64, body: Models.Inventory.CustomFieldUpdateRequest) async -> APIError? {
            let endpoint = "/inventory/v2/tenant/\(tenant)/returns/custom-fields"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        public func returnsUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdateReturnRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/returns/\(id)"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func returnsCancel(id: Int64, tenant: Int64, body: Models.Inventory.ReturnCancellationReason) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/returns/\(id)/cancellation"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func returnTypesCreate(tenant: Int64, body: Models.Inventory.CreateReturnTypeRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/return-types"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func returnTypesGetList
        public struct ReturnTypesGetListQuery: URLQueryConvertible {
            /// Filter by active only
            public var activeOnly: Bool
            /// Filter by name
            public var name: String?
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
            /// Applies sorting by specified fields
            public var sort: String?
        }
        public func returnTypesGetList(tenant: Int64, query: ReturnTypesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.ListReturnTypesResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/return-types"
            return await getReq(Models.PaginatedResponse<Models.Inventory.ListReturnTypesResponse>.self, endpoint: endpoint, params: query)
        }
        public func returnTypesUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdateReturnTypeRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/return-types/\(id)"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func transfersGetList
        public struct TransfersGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Filter by a collection of statuses
            public var statuses: String?
            /// Number filter
            public var number: String?
            /// Reference number filter
            public var referenceNumber: String?
            /// Format - int64. Batch filter
            public var batchId: Int64?
            /// Filter by a collection of transfer types
            public var transferTypeIds: String?
            /// Filter by a collection of From field locations
            public var fromLocationIds: String?
            /// Filter by a collection of To field locations
            public var toLocationIds: String?
            /// Filter by a collection of sync statuses
            public var syncStatuses: String?
            /// Format - date-time (as date-time in RFC3339). Return transfers with date on or after certain date/time
            public var dateOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return transfers with date before certain date/time
            public var dateBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
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
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
        }
        public func transfersGetList(tenant: Int64, query: TransfersGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.InventoryTransferResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/transfers"
            return await getReq(Models.PaginatedResponse<Models.Inventory.InventoryTransferResponse>.self, endpoint: endpoint, params: query)
        }
        public func transfersUpdateCustomFields(tenant: Int64, body: Models.Inventory.CustomFieldUpdateRequest) async -> APIError? {
            let endpoint = "/inventory/v2/tenant/\(tenant)/transfers/custom-fields"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        public func transfersUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdateTransferRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/transfers/\(id)"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func trucksGetList
        public struct TrucksGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
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
        public func trucksGetList(tenant: Int64, query: TrucksGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.TruckResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/trucks"
            return await getReq(Models.PaginatedResponse<Models.Inventory.TruckResponse>.self, endpoint: endpoint, params: query)
        }
        public func trucksUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdateTruckRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/trucks/\(id)"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func vendorsCreate(tenant: Int64, body: Models.Inventory.CreateVendorRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/vendors"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func vendorsGetList
        public struct VendorsGetListQuery: URLQueryConvertible {
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
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
        public func vendorsGetList(tenant: Int64, query: VendorsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.VendorResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/vendors"
            return await getReq(Models.PaginatedResponse<Models.Inventory.VendorResponse>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func vendorsGetById
        public struct VendorsGetByIdQuery: URLQueryConvertible {
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
        }
        public func vendorsGetById(id: Int64, tenant: Int64, query: VendorsGetByIdQuery? = nil) async -> Result<Models.Inventory.VendorResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/vendors/\(id)"
            return await getReq(Models.Inventory.VendorResponse.self, endpoint: endpoint, params: query)
        }
        public func vendorsUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdateVendorRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/vendors/\(id)"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func warehousesGetList
        public struct WarehousesGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - guid. If this guid is provided, external data corresponding to
            /// this application guid will be returned.
            public var externalDataApplicationGuid: String?
            /// Performs lookup by external data key, 'externalDataValues' must also be provided.
            public var externalDataKey: String?
            /// Performs lookup by external data values (maximum 50), 'externalDataKey' must also be provided.
            public var externalDataValues: String?
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
        public func warehousesGetList(tenant: Int64, query: WarehousesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Inventory.WarehouseResponse>, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/warehouses"
            return await getReq(Models.PaginatedResponse<Models.Inventory.WarehouseResponse>.self, endpoint: endpoint, params: query)
        }
        public func warehousesUpdate(id: Int64, tenant: Int64, body: Models.Inventory.UpdateWarehouseRequest) async -> Result<Models.Inventory.ModificationResponse, APIError> {
            let endpoint = "/inventory/v2/tenant/\(tenant)/warehouses/\(id)"
            return await bodiedReq(Models.Inventory.ModificationResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
    }
}
