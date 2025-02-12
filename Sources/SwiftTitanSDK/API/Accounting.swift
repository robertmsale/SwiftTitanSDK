//
//  Accounting.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/2/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct Accounting {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ApCreditResponse: Codable, Identifiable {
            public var id: Int64
            public var inventoryReturnId: Int64?
            public var jobId: Int64?
            public var active: Bool
            public var createdOn: Date
            public var modifiedOn: Date
            public var date: Date
            public var canceledOn: Date?
            public var number: String?
            public var referenceNumber: String?
            public var memo: String?
            public var amount: Double
            public var appliedAmount: Double
            public var status: VendorCreditStatus
            public var syncStatus: ApCreditSyncStatus
            public var batch: BatchResponse?
            public var businessUnit: NamedFieldResponse?
            public var remittanceVendor: NamedFieldResponse?
            public var vendor: NamedFieldResponse?
            public var paymentStatus: ApPaymentStatus
            public var splits: ApCreditSplitModelResponse
        }
        public enum VendorCreditStatus: String, CaseIterable, Identifiable, Codable {
            case Unreconciled, Canceled
            public var id: String { rawValue }
        }
        public enum ApCreditSyncStatus: String, CaseIterable, Identifiable, Codable {
            case Pending, Posted, Exported
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct BatchResponse: Codable, Identifiable {
            public var id: Int64
            public var number: String?
            public var name: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NamedFieldResponse: Codable, Identifiable {
            public var id: Int64
            public var name: String?
        }
        public enum ApPaymentStatus: String, CaseIterable, Identifiable, Codable {
            case Unpaid, ReadyForApproval, Initiated, Paid, Cancelled, InTransit, Processing
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ApCreditSplitModelResponse: Codable, Identifiable {
            public var id: Int64
            public var active: Bool
            public var createdOn: Date
            public var inventoryBillId: Int64
            public var vendorCreditId: Int64
            public var amount: Double
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MarkApCreditAsExportedUpdateResponse: Codable {
            public var apCreditId: Int64
            public var success: Bool
            public var errorMessage: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MarkApCreditAsExportedUpdateRequest: Codable {
            public var apCreditId: Int64
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ApPaymentResponse: Codable, Identifiable {
            public var id: Int64
            public var active: Bool?
            public var createdOn: Date
            public var modifiedOn: Date
            public var date: Date
            public var approvedDate: Date?
            public var method: ApPaymentMethod
            public var name: String?
            public var printCheck: Bool?
            public var amount: Double
            public var errorMessage: String?
            public var status: ApPaymentStatus
            public var syncStatus: ApPaymentSyncStatus
            public var batch: BatchResponse?
            public var glAccount: GLAccountResponse?
            public var businessUnit: NamedFieldResponse?
            public var vendor: NamedFieldResponse?
            public var remittanceVendor: NamedFieldResponse?
            public var splits: ApPaymentSplitApiModel
        }
        public enum ApPaymentMethod: String, CaseIterable, Identifiable, Codable {
            case AccountingSystem, ServiceTitan
            public var id: String { rawValue }
        }
        public enum ApPaymentSyncStatus: String, CaseIterable, Identifiable, Codable {
            case Pending, Posted, Exported
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GLAccountResponse: Codable, Identifiable {
            public var id: Int64
            public var name: String?
            public var number: String?
            public var type: String?
            public var detailType: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ApPaymentSplitApiModel: Codable, Identifiable {
            public var id: Int64
            public var active: Bool?
            public var createdOn: Date
            public var documentId: Int64?
            public var inventoryBillId: Int64?
            public var amount: Double
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MarkApPaymentAsExportedUpdateResponse: Codable {
            public var apPaymentId: Int64
            public var success: Bool
            public var errorMessage: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MarkApPaymentAsExportedUpdateRequest: Codable {
            public var apPaymentId: Int64
            public var externalId: String?
            public var externalMessage: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportInvoiceResponse: Codable, Identifiable {
            public var id: Int64
            public var syncStatus: String?
            public var summary: String?
            public var referenceNumber: String?
            public var invoiceDate: Date?
            public var dueDate: Date?
            public var subTotal: String?
            public var salesTax: String?
            public var salesTaxCode: SalesTaxResponse?
            public var total: String?
            public var balance: String?
            public var invoiceType: NamedFieldResponse?
            public var customer: NamedFieldResponse?
            public var customerAddress: AddressResponse?
            public var location: NamedFieldResponse?
            public var locationAddress: AddressResponse?
            public var businessUnit: NamedFieldResponse?
            public var termName: String?
            public var createdBy: String?
            public var batch: BatchResponse?
            public var depositedOn: Date?
            public var createdOn: Date
            public var modifiedOn: Date?
            public var adjustmentToId: Int64?
            public var job: JobResponse?
            public var projectId: Int64?
            public var royalty: RoyaltyResponse?
            public var employeeInfo: EmployeeInfoResponse?
            public var commissionEligibilityDate: String?
            public var sentStatus: InvoiceSentStatus
            public var reviewStatus: InvoiceReviewStatus
            public var assignedTo: NamedFieldResponse?
            public var items: InvoiceItemResponse?
            public var customFields: CustomFieldResponse?
            public var active: Bool
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SalesTaxResponse: Codable, Identifiable {
            public var id: Int64
            public var name: String?
            public var taxRate: Double
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AddressResponse: Codable {
            public var street: String?
            public var unit: String?
            public var city: String?
            public var state: String?
            public var zip: String?
            public var country: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JobResponse: Codable, Identifiable {
            public var id: Int64
            public var number: String?
            public var type: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct RoyaltyResponse: Codable {
            public var status: String?
            public var date: Date?
            public var sentOn: Date?
            public var memo: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EmployeeInfoResponse: Codable, Identifiable {
            public var id: Int64
            public var name: String?
            public var modifiedOn: Date
        }
        public enum InvoiceSentStatus: String, CaseIterable, Identifiable, Codable {
            case NotSent, Sent, Opened
            public var id: String { rawValue }
        }
        public enum InvoiceReviewStatus: String, CaseIterable, Identifiable, Codable {
            case NeedsReview, OnHold, Reviewed
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceItemResponse: Codable, Identifiable {
            public var id: Int64
            public var description: String?
            public var quantity: String?
            public var cost: String?
            public var totalCost: String?
            public var inventoryLocation: String?
            public var price: String?
            public var type: InvoiceItemType
            public var skuName: String?
            public var skuId: Int64
            public var total: String?
            public var inventory: Bool
            public var taxable: Bool
            public var generalLedgerAccount: GLAccountResponse?
            public var costOfSaleAccount: GLAccountResponse?
            public var assetAccount: GLAccountResponse?
            public var membershipTypeId: Int64
            public var itemGroup: ItemGroupResponse?
            public var displayName: String?
            public var soldHours: Double?
            public var modifiedOn: Date
            public var serviceDate: Date?
            public var order: Int32
            public var businessUnit: NamedFieldResponse?
        }
        public enum InvoiceItemType: String, CaseIterable, Identifiable, Codable {
            case Service, Material, Equipment, PriceModifier, Unspecified
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ItemGroupResponse: Codable {
            public var rootId: Int64
            public var name: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldResponse: Codable {
            public var name: String?
            public var value: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportInvoiceItemResponse: Codable, Identifiable {
            public var id: Int64
            public var description: String?
            public var quantity: String?
            public var cost: String?
            public var totalCost: String?
            public var inventoryLocation: String?
            public var price: String?
            public var type: InvoiceItemType
            public var skuName: String?
            public var skuId: Int64
            public var total: String?
            public var inventory: Bool
            public var taxable: Bool
            public var generalLedgerAccount: GLAccountResponse?
            public var costOfSaleAccount: GLAccountResponse?
            public var assetAccount: GLAccountResponse?
            public var membershipTypeId: Int64
            public var itemGroup: ItemGroupResponse?
            public var displayName: String?
            public var soldHours: Double?
            public var modifiedOn: Date
            public var serviceDate: Date?
            public var order: Int32
            public var businessUnit: NamedFieldResponse?
            public var active: Bool
            public var invoiceId: Int64
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportPaymentResponse: Codable, Identifiable {
            public var id: Int64
            public var syncStatus: String?
            public var referenceNumber: String?
            public var date: Date?
            public var type: String?
            public var typeId: String?
            public var total: String?
            public var unappliedAmount: String?
            public var memo: String?
            public var customer: NamedFieldResponse?
            public var businessUnit: NamedFieldResponse?
            public var batch: BatchResponse?
            public var createdBy: String?
            public var generalLedgerAccount: GLAccountResponse?
            public var appliedTo: PaymentAppliedResponse?
            public var customFields: CustomFieldModel?
            public var authCode: String?
            public var checkNumber: String?
            public var modifiedOn: Date
            public var createdOn: Date
            public var active: Bool
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentAppliedResponse: Codable {
            public var appliedId: Int64
            public var appliedTo: Int64
            public var appliedAmount: String?
            public var appliedOn: Date?
            public var appliedBy: String?
            public var appliedToReferenceNumber: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldModel: Codable {
            public var name: String
            public var value: String
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportInventoryBillResponse: Codable, Identifiable {
            public var id: Int64
            public var purchaseOrderId: Int64?
            public var syncStatus: String?
            public var referenceNumber: String?
            public var vendorNumber: String?
            public var summary: String?
            public var billDate: Date?
            public var billAmount: String?
            public var taxAmount: String?
            public var shippingAmount: String?
            public var createdBy: String?
            public var createdOn: Date?
            public var termName: String?
            public var dueDate: Date?
            public var shipToDescription: String?
            public var batch: BatchResponse?
            public var businessUnit: NamedFieldResponse?
            public var vendor: NamedFieldResponse?
            public var shipTo: AddressResponse?
            public var items: InventoryBillItemResponse?
            public var customFields: CustomFieldResponse?
            public var jobId: Int64?
            public var jobNumber: String?
            public var active: Bool
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InventoryBillItemResponse: Codable {
            public var order: Int32
            public var name: String?
            public var description: String?
            public var quantity: String?
            public var cost: String?
            public var inventoryLocation: String?
            public var serialNumber: String?
            public var generalLedgerAccount: GLAccountResponse?
            public var costOfSaleAccount: GLAccountResponse?
            public var assetAccount: GLAccountResponse?
            public var skuId: Int64
            public var skuCode: String
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GlAccountExtendedResponse: Codable, Identifiable {
            public var id: Int64
            public var name: String?
            public var number: String?
            public var description: String?
            public var type: String?
            public var subtype: String?
            public var active: Bool
            public var isIntacctGroup: Bool
            public var isIntacctBankAccount: Bool
            public var source: GeneralLedgerAccountSource
            public var defaultAccountType: DefaultAccountType?
            public var createdOn: Date
            public var modifiedOn: Date
        }
        public enum GeneralLedgerAccountSource: String, CaseIterable, Identifiable, Codable {
            case Undefined, AccountingSystem, ManuallyCreated, PublicApi
            public var id: String { rawValue }
        }
        public enum DefaultAccountType: String, CaseIterable, Identifiable, Codable {
            case CheckingAccount, UndepositedFunds, AccountsReceivable, Inventory, AccountsPayable, CustomerRefundsPayable, SalesTaxPayable, CustomerDeposits, MembershipAgreements, RetainedEarnings, Revenue, MembershipRevenue, Refunds, CostOfGoodsSoldMaterials, CostOfGoodsSoldEquipment, CostOfGoodsSoldShipping, CostOfGoodsSoldTax, PayrollLabor, PayrollEmployeeTaxes, EmployeeBenefits, EmployerTaxes, EmployerBenefits, Deductions, InventoryAdjustments
            public var id: String { rawValue }
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any = "Any", False
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GlAccountTypeResponse: Codable, Identifiable {
            public var id: Int64
            public var parentTypeId: Int64?
            public var name: String?
            public var active: Bool
            public var createdOn: Date
            public var modifiedOn: Date
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GlAccountCreateRequest: Codable {
            public var name: String?
            public var number: String?
            public var description: String?
            public var type: String?
            public var subtype: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GlAccountUpdateRequest: Codable {
            public var name: String?
            public var number: String?
            public var description: String?
            public var type: String?
            public var subtype: String?
            public var active: Bool?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InventoryBillResponse: Codable, Identifiable {
            public var id: Int64
            public var purchaseOrderId: Int64?
            public var syncStatus: String?
            public var referenceNumber: String?
            public var vendorNumber: String?
            public var summary: String?
            public var billDate: Date?
            public var billAmount: String?
            public var taxAmount: String?
            public var shippingAmount: String?
            public var createdBy: String?
            public var createdOn: Date?
            public var termName: String?
            public var dueDate: Date?
            public var shipToDescription: String?
            public var batch: BatchResponse?
            public var businessUnit: NamedFieldResponse?
            public var vendor: NamedFieldResponse?
            public var shipTo: AddressResponse?
            public var items: InventoryBillItemResponse?
            public var customFields: CustomFieldResponse?
            public var jobId: Int64?
            public var jobNumber: String?
        }
        public enum LogicalOperator: String, CaseIterable, Identifiable, Codable {
            case And, Or
            public var id: String { rawValue }
        }
        public enum InventoryBillSyncStatus: String, CaseIterable, Identifiable, Codable {
            case Pending, Posted, Exported, PostedAndExported
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldUpdateRequest: Codable {
            public var operations: CustomFieldOperationRequest
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldOperationRequest: Codable {
            public var objectId: Int64
            public var customFields: CustomFieldPairRequest
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomFieldPairRequest: Codable {
            public var name: String
            public var value: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MarkInventoryBillAsExportedUpdateResponse: Codable {
            public var inventoryBillId: Int64
            public var success: Bool
            public var errorMessage: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MarkInventoryBillAsExportedUpdateRequest: Codable {
            public var inventoryBillIds: Int64
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceResponse: Codable, Identifiable {
            public var id: Int64
            public var syncStatus: String?
            public var summary: String?
            public var referenceNumber: String?
            public var invoiceDate: Date?
            public var dueDate: Date?
            public var subTotal: String?
            public var salesTax: String?
            public var salesTaxCode: SalesTaxResponse?
            public var total: String?
            public var balance: String?
            public var invoiceType: NamedFieldResponse?
            public var customer: NamedFieldResponse?
            public var customerAddress: AddressResponse?
            public var location: NamedFieldResponse?
            public var locationAddress: AddressResponse?
            public var businessUnit: NamedFieldResponse?
            public var termName: String?
            public var createdBy: String?
            public var batch: BatchResponse?
            public var depositedOn: Date?
            public var createdOn: Date
            public var modifiedOn: Date?
            public var adjustmentToId: Int64?
            public var job: JobResponse?
            public var projectId: Int64?
            public var royalty: RoyaltyResponse?
            public var employeeInfo: EmployeeInfoResponse?
            public var commissionEligibilityDate: String?
            public var sentStatus: InvoiceSentStatus
            public var reviewStatus: InvoiceReviewStatus
            public var assignedTo: NamedFieldResponse?
            public var items: InvoiceItemResponse?
            public var customFields: CustomFieldResponse?
        }
        public enum TransactionStatus: String, CaseIterable, Identifiable, Codable {
            case Pending, Posted, Exported
            public var id: String { rawValue }
        }
        public enum BalanceComparer: String, CaseIterable, Identifiable, Codable {
            case Equals, NotEquals, Greater, Less
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct AdjustmentInvoiceCreateRequest: Codable {
            public var number: String?
            public var typeId: Int64?
            public var invoicedOn: Date?
            public var subtotal: Double?
            public var tax: Double?
            public var summary: String?
            public var royaltyStatus: RoyaltyStatus?
            public var royaltyDate: Date?
            public var royaltySentOn: Date?
            public var royaltyMemo: String?
            public var exportId: String?
            public var reviewStatus: InvoiceReviewStatus?
            public var assignedToId: Int64?
            public var items: InvoiceItemUpdateRequest?
            public var adjustmentToId: Int64
        }
        public enum RoyaltyStatus: String, CaseIterable, Identifiable, Codable {
            case Pending, Sent, Failed
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceItemUpdateRequest: Codable {
            public var skuId: Int64?
            public var skuName: String?
            public var technicianId: Int64?
            public var description: String
            public var quantity: Double
            public var unitPrice: Double?
            public var cost: Double?
            public var isAddOn: Bool?
            public var signature: String?
            public var technicianAcknowledgementSignature: String?
            public var installedOn: Date?
            public var inventoryWarehouseName: String?
            public var skipUpdatingMembershipPrices: Bool?
            public var itemGroupName: String?
            public var itemGroupRootId: Int64?
            public var inventoryLocationId: Int64?
            public var durationBillingId: Int64?
            public var id: Int64?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoiceUpdateRequest: Codable {
            public var number: String?
            public var typeId: Int64?
            public var invoicedOn: Date?
            public var subtotal: Double?
            public var tax: Double?
            public var summary: String?
            public var royaltyStatus: RoyaltyStatus?
            public var royaltyDate: Date?
            public var royaltySentOn: Date?
            public var royaltyMemo: String?
            public var exportId: String?
            public var reviewStatus: InvoiceReviewStatus?
            public var assignedToId: Int64?
            public var items: InvoiceItemUpdateRequest?
            public var payments: PaymentSettlementUpdateRequest?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentSettlementUpdateRequest: Codable, Identifiable {
            public var id: Int64
            public var settlementStatus: SettlementStatus?
            public var settlementDate: Date?
        }
        public enum SettlementStatus: String, CaseIterable, Identifiable, Codable {
            case NotSettled, Settled
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MarkInvoiceAsExportedUpdateResponse: Codable {
            public var invoiceId: Int64
            public var success: Bool
            public var errorMessage: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MarkInvoiceAsExportedUpdateRequest: Codable {
            public var invoiceId: Int64
            public var externalId: String?
            public var externalMessage: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JournalEntryResponse: Codable {
            public var id: String?
            public var createdOn: Date
            public var modifiedOn: Date
            public var number: Int32
            public var name: String?
            public var status: JournalEntryPostingStatus
            public var postDate: Date?
            public var exportedOn: Date?
            public var exportedBy: NamedFieldResponse?
            public var customFields: CustomFieldResponse?
            public var url: String?
        }
        public enum JournalEntryPostingStatus: String, CaseIterable, Identifiable, Codable {
            case Open, Closed
            public var id: String { rawValue }
        }
        public enum JournalEntryTransactionType: String, CaseIterable, Identifiable, Codable {
            case Invoice, Payment, Bill, VendorCredit, VendorPayment, InventoryAdjustment, PaymentApplication, BankDeposit, RevenueRecognition
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JournalEntrySummaryResponse: Codable {
            public var postDate: Date?
            public var account: GeneralLedgerAccount
            public var credit: Double
            public var debit: Double
            public var memo: String?
            public var businessUnit: NamedFieldResponse?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GeneralLedgerAccount: Codable, Identifiable {
            public var id: Int64
            public var number: String?
            public var name: String?
            public var type: String?
            public var subtype: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JournalEntryDetailsResponse: Codable {
            public var postDate: Date?
            public var account: GeneralLedgerAccount
            public var debit: Double
            public var credit: Double
            public var memo: String?
            public var transaction: JournalEntryTransaction?
            public var businessUnit: NamedFieldResponse?
            public var customer: NamedFieldResponse?
            public var vendor: NamedFieldResponse?
            public var inventoryLocation: NamedFieldResponse?
            public var job: NumberFieldResponse?
            public var customerLocation: NamedFieldResponse?
            public var paymentType: NamedFieldResponse?
            public var project: NumberFieldResponse?
            public var serviceAgreement: NumberFieldResponse?
            public var appliedTo: JournalEntryTransaction?
            public var sku: JournalEntrySku?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JournalEntryTransaction: Codable, Identifiable {
            public var id: Int64
            public var type: JournalEntryTransactionType
            public var refNumber: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct NumberFieldResponse: Codable, Identifiable {
            public var id: Int64
            public var number: String?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JournalEntrySku: Codable, Identifiable {
            public var id: Int64
            public var type: JournalEntrySkuType?
            public var code: String?
        }
        public enum JournalEntrySkuType: String, CaseIterable, Identifiable, Codable {
            case Service, Material, Equipment, PriceModifier
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JournalEntryUpdateRequest: Codable {
            public var status: JournalEntryStatus
            public var customFields: Dictionary<String, String>?
        }
        public enum JournalEntryStatus: String, CaseIterable, Identifiable, Codable {
            case Open, Closed
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DetailedPaymentResponse: Codable, Identifiable {
            public var id: Int64
            public var syncStatus: String?
            public var referenceNumber: String?
            public var date: Date?
            public var type: String?
            public var typeId: String?
            public var total: String?
            public var unappliedAmount: String?
            public var memo: String?
            public var customer: NamedFieldResponse?
            public var businessUnit: NamedFieldResponse?
            public var batch: BatchResponse?
            public var createdBy: String?
            public var generalLedgerAccount: GLAccountResponse?
            public var appliedTo: PaymentAppliedResponse?
            public var customFields: CustomFieldModel?
            public var authCode: String?
            public var checkNumber: String?
            public var modifiedOn: Date
            public var createdOn: Date
        }
        public enum PaymentTransactionType: String, CaseIterable, Identifiable, Codable {
            case Undefined, JournalEntry, ReceivePayment
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentResponse: Codable, Identifiable {
            public var id: Int64
            public var typeId: Int64
            public var active: Bool?
            public var memo: String?
            public var paidOn: Date?
            public var authCode: String?
            public var checkNumber: String?
            public var exportId: String?
            public var transactionStatus: TransactionProcessingStatus?
            public var status: PaymentStatus?
            public var splits: PaymentSplitApiModel
        }
        public enum TransactionProcessingStatus: String, CaseIterable, Identifiable, Codable {
            case Success, Fail, Pending
            public var id: String { rawValue }
        }
        public enum PaymentStatus: String, CaseIterable, Identifiable, Codable {
            case Pending, Posted, Exported
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentSplitApiModel: Codable {
            public var invoiceId: Int64?
            public var amount: Double?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentCreateRequest: Codable {
            public var typeId: Int64
            public var memo: String?
            public var paidOn: Date?
            public var authCode: String?
            public var checkNumber: String?
            public var exportId: String?
            public var status: PaymentStatus?
            public var splits: PaymentSplitApiModel
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentUpdateRequest: Codable {
            public var typeId: Int64
            public var active: Bool
            public var memo: String
            public var paidOn: Date
            public var authCode: String
            public var checkNumber: String
            public var exportId: String
            public var status: PaymentStatus
            public var splits: PaymentSplitApiModel
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentStatusBatchRequest: Codable {
            public var status: PaymentStatus
            public var paymentIds: Int64
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentTermAPIModel: Codable {
            public var id: Int64?
            public var name: String?
            public var dueDayType: PaymentTermDueDayType
            public var dueDay: Int32?
            public var isCustomerDefault: Bool
            public var isVendorDefault: Bool
            public var active: Bool
            public var inUse: Bool?
            public var modifiedOn: Date
            public var paymentTermDiscountModel: PaymentTermDiscountAPIModel
            public var interestSettings: InterestSettingsAPIModel
        }
        public enum PaymentTermDueDayType: String, CaseIterable, Identifiable, Codable {
            case NumberOfDays, CertainDayOfCurrentMonth, CertainDayOfFollowingMonth
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentTermDiscountAPIModel: Codable {
            public var id: Int64?
            public var discountApplyTo: PaymentTermApplyTo?
            public var discount: Double?
            public var discountType: PaymentTermValueType?
            public var account: String?
            public var applyBy: DiscountAppliedBy?
            public var applyByValue: Int32?
        }
        public enum PaymentTermApplyTo: String, CaseIterable, Identifiable, Codable {
            case ApplyToTotalAmount, ApplyToSubtotalAmount, ApplyToRemainingBalance
            public var id: String { rawValue }
        }
        public enum PaymentTermValueType: String, CaseIterable, Identifiable, Codable {
            case Fixed, Percent
            public var id: String { rawValue }
        }
        public enum DiscountAppliedBy: String, CaseIterable, Identifiable, Codable {
            case NumberOfDays, DayOfMonth, DayOfFollowingMonth
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InterestSettingsAPIModel: Codable {
            public var id: Int64?
            public var rateType: InterestRateType
            public var flatRateValue: Double?
            public var percentageRateValue: Double?
            public var chargeMethod: InterestChargeMethod?
            public var frequency: InterestChargeFrequency
            public var gracePeriod: Int32?
            public var targetInvoices: InterestTargetInvoice
            public var taskId: Int64
            public var taskDisplayName: String
        }
        public enum InterestRateType: String, CaseIterable, Identifiable, Codable {
            case Flat, Percentage, MaxOfFlatAndPercentage
            public var id: String { rawValue }
        }
        public enum InterestChargeMethod: String, CaseIterable, Identifiable, Codable {
            case PrincipalOnly, Total
            public var id: String { rawValue }
        }
        public enum InterestChargeFrequency: String, CaseIterable, Identifiable, Codable {
            case Once, Daily, Monthly
            public var id: String { rawValue }
        }
        public enum InterestTargetInvoice: String, CaseIterable, Identifiable, Codable {
            case JobInvoices, MembershipInvoices, ProgressInvoices, PointOfSalesInvoices
            public var id: String { rawValue }
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentTypeResponse: Codable, Identifiable {
            public var id: Int64
            public var name: String
            public var modifiedOn: Date?
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TaxZoneResponse: Codable, Identifiable {
            public var id: Int64
            public var name: String?
            public var color: Int32?
            public var isTaxRateSeparated: Bool
            public var isMultipleTaxZone: Bool
            public var rates: TaxRateResponse
            public var createdOn: Date
            public var modifiedOn: Date
            public var active: Bool
        }
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TaxRateResponse: Codable {
            public var id: Int64?
            public var taxName: String?
            public var taxBaseType: TaxBaseTypeNames
            public var taxRate: Double
            public var salesTaxItem: String?
        }
        public enum TaxBaseTypeNames: String, CaseIterable, Identifiable, Codable {
            case Subtotal, Labor, Material
            public var id: String { rawValue }
        }
    }
}
public extension APIs {
    class Accounting: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "accounting")
        }
        /// Query Parameters for func apCreditsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ApCreditsGetListQuery: URLQueryConvertible {
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
            /// Applies sorting by specified fields
            public var sort: String?
        }
        public func apCreditsGetList(tenant: Int64, query: ApCreditsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Accounting.ApCreditResponse>, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/ap-credits"
            return await getReq(Models.PaginatedResponse<Models.Accounting.ApCreditResponse>.self, endpoint: endpoint, params: query)
        }
        public func apCreditsMarkAsExported(tenant: Int64, body: Models.Accounting.MarkApCreditAsExportedUpdateRequest) async -> Result<Models.Accounting.MarkApCreditAsExportedUpdateResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/ap-credits/markasexported"
            return await bodiedReq(Models.Accounting.MarkApCreditAsExportedUpdateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func apPaymentsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ApPaymentsGetListQuery: URLQueryConvertible {
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
            /// Applies sorting by specified fields
            public var sort: String?
        }
        public func apPaymentsGetList(tenant: Int64, query: ApPaymentsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Accounting.ApPaymentResponse>, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/ap-payments"
            return await getReq(Models.PaginatedResponse<Models.Accounting.ApPaymentResponse>.self, endpoint: endpoint, params: query)
        }
        public func apPaymentsMarkAsExported(tenant: Int64, body: Models.Accounting.MarkApPaymentAsExportedUpdateRequest) async -> Result<Models.Accounting.MarkApPaymentAsExportedUpdateResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/ap-payments/markasexported"
            return await bodiedReq(Models.Accounting.MarkApPaymentAsExportedUpdateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func exportInvoices
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportInvoicesQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportInvoices(tenant: Int64, query: ExportInvoicesQuery? = nil) async -> Result<Models.Accounting.ExportInvoiceResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/export/invoices"
            return await getReq(Models.Accounting.ExportInvoiceResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportInvoiceItems
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportInvoiceItemsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportInvoiceItems(tenant: Int64, query: ExportInvoiceItemsQuery? = nil) async -> Result<Models.Accounting.ExportInvoiceItemResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/export/invoice-items"
            return await getReq(Models.Accounting.ExportInvoiceItemResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportPayments
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportPaymentsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportPayments(tenant: Int64, query: ExportPaymentsQuery? = nil) async -> Result<Models.Accounting.ExportPaymentResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/export/payments"
            return await getReq(Models.Accounting.ExportPaymentResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func exportInventoryBills
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExportInventoryBillsQuery: URLQueryConvertible {
            /// Continuation token received from previous export request in "continueFrom" field.
            /// When not specified, the export process starts from the beginning.\
            /// Use custom date strings, e.g. "2020-01-01" to start the export process from the certain point in time.
            public var from: String?
            /// Use "true" to start receiving the most recent changes quicker.
            /// Note this may cause the same results appearing multiple times on consecutive requests.
            public var includeRecentChanges: Bool?
        }
        public func exportInventoryBills(tenant: Int64, query: ExportInventoryBillsQuery? = nil) async -> Result<Models.Accounting.ExportInventoryBillResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/export/inventory-bills"
            return await getReq(Models.Accounting.ExportInventoryBillResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func glAccountsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GlAccountsGetListQuery: URLQueryConvertible {
            /// Comma-delimited list of account IDs, maximum 50 items
            public var ids: String?
            /// Comma-delimited list of account names, maximum 50 items
            public var names: String?
            /// Comma-delimited list of account numbers, maximum 50 items
            public var numbers: String?
            /// Comma-delimited list of account types, maximum 50 items
            public var types: String?
            /// Comma-delimited list of account subtypes, maximum 50 items
            public var subtypes: String?
            /// A substring that must be contained in the account description
            public var description: String?
            /// Account source\
            /// Values: [Undefined, AccountingSystem, ManuallyCreated, PublicApi]
            public var source: String?
            /// Specify if only active accounts, only inactive accounts, or both, should be retrieved.
            /// By default, only active accounts will be retrieved.\
            /// Values: [True, Any, False]
            public var active: String?
            /// Set to true to retrieve Intacct group accounts only
            public var isIntacctGroup: Bool?
            /// Set to true to retrieve Intacct bank accounts only
            public var isIntacctBankAccount: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
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
            /// Applies sorting by specified fields
            public var sort: String?
        }
        public func glAccountsGetList(tenant: Int64, query: GlAccountsGetListQuery? = nil) async -> Result<Models.Accounting.GlAccountExtendedResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/gl-accounts"
            return await getReq(Models.Accounting.GlAccountExtendedResponse.self, endpoint: endpoint, params: query)
        }
        public func glAccountsCreateAccount(tenant: Int64, body: Models.Accounting.GlAccountCreateRequest) async -> APIError? {
            let endpoint = "/accounting/v2/tenant/\(tenant)/gl-accounts"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        public func glAccountsGetAccount(accountId: Int64, tenant: Int64) async -> Result<Models.Accounting.GlAccountExtendedResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/gl-accounts/\(accountId)"
            return await getReq(Models.Accounting.GlAccountExtendedResponse.self, endpoint: endpoint)
        }
        public func glAccountsUpdateAccount(accountId: Int64, tenant: Int64, body: Models.Accounting.GlAccountUpdateRequest) async -> Result<Models.Accounting.GlAccountExtendedResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/gl-accounts/\(accountId)"
            return await bodiedReq(Models.Accounting.GlAccountExtendedResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func glAccountsGetTypeList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct GlAccountsGetTypeListQuery: URLQueryConvertible {
            /// Comma-delimited list of account type IDs, maximum 50 items
            public var ids: String?
            /// Comma-delimited list of account type names, maximum 50 items
            public var names: String?
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
            /// Applies sorting by specified fields
            public var sort: String?
        }
        public func glAccountsGetTypeList(tenant: Int64, query: GlAccountsGetTypeListQuery? = nil) async -> Result<Models.Accounting.GlAccountTypeResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/gl-accounts/types"
            return await getReq(Models.Accounting.GlAccountTypeResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func inventoryBillsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InventoryBillsGetListQuery: URLQueryConvertible {
            public var ids: String?
            /// Format - int64.
            public var batchId: Int64?
            /// Format - int32.
            public var batchNumber: Int32?
            public var billNumber: String?
            public var businessUnitIds: String?
            /// Format - date-time (as date-time in RFC3339).
            public var dateFrom: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var dateTo: Date?
            public var jobNumber: String?
            public var purchaseOrderNumber: String?
            public var purchaseOrderTypes: String?
            /// Format - decimal.
            public var minCost: Double?
            /// Format - decimal.
            public var maxCost: Double?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func inventoryBillsGetList(tenant: Int64, query: InventoryBillsGetListQuery? = nil) async -> Result<Models.Accounting.InventoryBillResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/inventory-bills"
            return await getReq(Models.Accounting.InventoryBillResponse.self, endpoint: endpoint, params: query)
        }
        public func inventoryBillsUpdateCustomFields(tenant: Int64, body: Models.Accounting.CustomFieldUpdateRequest) async -> APIError? {
            let endpoint = "/accounting/v2/tenant/\(tenant)/inventory-bills/custom-fields"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        public func inventoryBillsMarkAsExported(tenant: Int64, body: Models.Accounting.MarkInventoryBillAsExportedUpdateRequest) async -> Result<Models.Accounting.MarkInventoryBillAsExportedUpdateResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/inventory-bills/markasexported"
            return await bodiedReq(Models.Accounting.MarkInventoryBillAsExportedUpdateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func invoicesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct InvoicesGetListQuery: URLQueryConvertible {
            /// Comma-delimited list of invoice IDs.
            public var ids: String?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - int64. Batch ID associated with invoices.
            public var batchId: Int64?
            /// Format - int32. Batch number associated with invoices.
            public var batchNumber: Int32?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - int64. Job ID associated with invoices. This will be null if the invoice is not linked to a job.
            public var jobId: Int64?
            /// Job number associated with invoices. This will be null if the invoice is not linked to a job.
            public var jobNumber: String?
            /// Format - int64. Business unit ID associated with invoices.
            public var businessUnitId: Int64?
            /// Format - int64. Customer ID associated with invoices.
            public var customerId: Int64?
            /// Format - date-time (as date-time in RFC3339).
            public var invoicedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var invoicedOnBefore: Date?
            /// Format - int64. When searching for adjustment invoices, this field will search for invoices that are adjustments to the specified invoice ID.
            public var adjustmentToId: Int64?
            /// Reference number associated with invoices.
            public var number: String?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - decimal. Retrieve all invoices with a total greater than or equal to the input value.
            public var totalGreater: Double?
            /// Format - decimal. Retrieve all invoices with a total less than or equal to the input value.
            public var totalLess: Double?
            /// Format - date-time (as date-time in RFC3339). Retrieve all invoices with a due date before the input value
            public var dueDateBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Retrieve all invoices with a due date on after or equal the input value
            public var dueDateOnOrAfter: Date?
            /// Field on which you want to order the returned list of invoices.
            public var orderBy: String?
            /// Order direction of the retuned list of invoices.  Values of "desc" or "descending" will order the list in descending order, otherwise the list will be ordered in ascending order.
            public var orderByDirection: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            public var sort: String?
        }
        public func invoicesGetList(tenant: Int64, query: InvoicesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Accounting.InvoiceResponse>, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/invoices"
            return await getReq(Models.PaginatedResponse<Models.Accounting.InvoiceResponse>.self, endpoint: endpoint, params: query)
        }
        public func invoicesCreateAdjustmentInvoice(tenant: Int64, body: Models.Accounting.AdjustmentInvoiceCreateRequest) async -> Result<Int64, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/invoices"
            return await bodiedReq(Int64.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func invoicesUpdateCustomFields(tenant: Int64, body: Models.Accounting.CustomFieldUpdateRequest) async -> APIError? {
            let endpoint = "/accounting/v2/tenant/\(tenant)/invoices/custom-fields"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        public func invoicesUpdateInvoice(id: Int64, tenant: Int64, body: Models.Accounting.InvoiceUpdateRequest) async -> APIError? {
            let endpoint = "/accounting/v2/tenant/\(tenant)/invoices/\(id)"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        public func invoicesUpdateInvoiceItems(invoiceId: Int64, tenant: Int64, body: Models.Accounting.InvoiceItemUpdateRequest) async -> APIError? {
            let endpoint = "/accounting/v2/tenant/\(tenant)/invoices/\(invoiceId)/items"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        public func invoicesDeleteInvoiceItem(invoiceId: Int64, itemId: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/accounting/v2/tenant/\(tenant)/invoices/\(invoiceId)/items/\(itemId)"
            return await delReq(endpoint: endpoint)
        }
        public func invoicesMarkAsExported(tenant: Int64, body: Models.Accounting.MarkInvoiceAsExportedUpdateRequest) async -> Result<Models.Accounting.MarkInvoiceAsExportedUpdateResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/invoices/markasexported"
            return await bodiedReq(Models.Accounting.MarkInvoiceAsExportedUpdateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func journalEntriesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JournalEntriesGetListQuery: URLQueryConvertible {
            /// Comma-delimited list of journal entry IDs, maximum 50 items
            public var ids: String?
            /// Format - date-time (as date-time in RFC3339). Exported on or after certain date/time (in UTC)
            public var exportedFrom: Date?
            /// Format - date-time (as date-time in RFC3339). Exported on or before certain date/time (in UTC)
            public var exportedTo: Date?
            /// Format - date-time (as date-time in RFC3339). Posted on or after certain date/time (in UTC)
            public var postedFrom: Date?
            /// Format - date-time (as date-time in RFC3339). Posted on or before certain date/time (in UTC)
            public var postedTo: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Comma-delimited list of user IDs, maximum 50 items
            public var exportedBy: String?
            /// Name contains
            public var name: String?
            /// Format - int32. Number is greater or equal than
            public var numberFrom: Int32?
            /// Format - int32. Number is less or equal to
            public var numberTo: Int32?
            /// Format - date-time (as date-time in RFC3339). Contains a transaction posted on or after certain date/time (in UTC)
            public var transactionPostedFrom: Date?
            /// Format - date-time (as date-time in RFC3339). Contains a transaction posted on or before certain date/time (in UTC)
            public var transactionPostedTo: Date?
            /// Comma-delimited list of business unit IDs, maximum 50 items
            public var businessUnitIds: String?
            /// Comma-delimited list of service agreement IDs, maximum 50 items
            public var serviceAgreementIds: String?
            /// Contains a transaction for a customer with name containing
            public var customerName: String?
            /// Contains a transaction for a customer location with name containing
            public var locationName: String?
            /// Contains a transaction for a vendor with name containing
            public var vendorName: String?
            /// Contains a transaction for an inventory location with name containing
            public var inventoryLocationName: String?
            /// Contains a transaction with reference number containing
            public var refNumber: String?
            /// Applies sorting by the specified field and direction.\
            /// Options: Id, Number, Name, Status, CreatedOn, ExportedOn, ExportedBy, PostDate.\
            /// Use "+" for ascending order, and "-" for descending order.\
            /// Example: "?sort=-Number" will sort by number in descending order.\
            public var sort: String?
            /// Format - int32. How many records to return (50 by default). Maximum value is 500.
            public var pageSize: Int32?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func journalEntriesGetList(tenant: Int64, query: JournalEntriesGetListQuery? = nil) async -> Result<Models.Accounting.JournalEntryResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/journal-entries"
            return await getReq(Models.Accounting.JournalEntryResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func journalEntriesGetSummary
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JournalEntriesGetSummaryQuery: URLQueryConvertible {
            /// Format - int32. How many records to return (50 by default). Maximum value is 500.
            public var pageSize: Int32?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func journalEntriesGetSummary(id: String, tenant: Int64, query: JournalEntriesGetSummaryQuery? = nil) async -> Result<Models.Accounting.JournalEntrySummaryResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/journal-entries/\(id)/summary"
            return await getReq(Models.Accounting.JournalEntrySummaryResponse.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func journalEntriesGetDetails
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct JournalEntriesGetDetailsQuery: URLQueryConvertible {
            /// Format - int32. How many records to return (50 by default). Maximum value is 500.
            public var pageSize: Int32?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
        }
        public func journalEntriesGetDetails(id: String, tenant: Int64, query: JournalEntriesGetDetailsQuery? = nil) async -> Result<Models.Accounting.JournalEntryDetailsResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/journal-entries/\(id)/details"
            return await getReq(Models.Accounting.JournalEntryDetailsResponse.self, endpoint: endpoint, params: query)
        }
        public func journalEntriesUpdate(id: String, tenant: Int64, body: Models.Accounting.JournalEntryUpdateRequest) async -> Result<Models.Accounting.JournalEntryResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/journal-entries/\(id)"
            return await bodiedReq(Models.Accounting.JournalEntryResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func paymentsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            public var appliedToInvoiceIds: String?
            public var appliedToReferenceNumber: String?
            public var statuses: String?
            /// Format - date-time (as date-time in RFC3339).
            public var paidOnAfter: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var paidOnBefore: Date?
            public var businessUnitIds: String?
            /// Format - int32.
            public var batchNumber: Int32?
            /// Format - int64.
            public var batchId: Int64?
            /// Values: [Undefined, JournalEntry, ReceivePayment]
            public var transactionType: String?
            /// Format - int64.
            public var customerId: Int64?
            /// Format - decimal.
            public var totalGreater: Double?
            /// Format - decimal.
            public var totalLess: Double?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339). Return items modified before certain date/time (in UTC)
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items modified on or after certain date/time (in UTC)
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            public var sort: String?
        }
        public func paymentsGetList(tenant: Int64, query: PaymentsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Accounting.DetailedPaymentResponse>, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/payments"
            return await getReq(Models.PaginatedResponse<Models.Accounting.DetailedPaymentResponse>.self, endpoint: endpoint, params: query)
        }
        public func paymentsCreate(tenant: Int64, body: Models.Accounting.PaymentCreateRequest) async -> Result<Models.Accounting.PaymentResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/payments"
            return await bodiedReq(Models.Accounting.PaymentResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func paymentsUpdateCustomFields(tenant: Int64, body: Models.Accounting.CustomFieldUpdateRequest) async -> APIError? {
            let endpoint = "/accounting/v2/tenant/\(tenant)/payments/custom-fields"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        public func paymentsUpdate(id: Int64, tenant: Int64, body: Models.Accounting.PaymentUpdateRequest) async -> Result<Models.Accounting.PaymentResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/payments/\(id)"
            return await bodiedReq(Models.Accounting.PaymentResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func paymentsUpdateStatus(tenant: Int64, body: Models.Accounting.PaymentStatusBatchRequest) async -> APIError? {
            let endpoint = "/accounting/v2/tenant/\(tenant)/payments/status"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        public func paymentTermsGetPaymentTermModel(paymentTermId: Int64, tenant: Int64) async -> Result<Models.Accounting.PaymentTermAPIModel, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/payment-terms/\(paymentTermId)"
            return await getReq(Models.Accounting.PaymentTermAPIModel.self, endpoint: endpoint)
        }
        /// Query Parameters for func paymentTermsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentTermsGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// Format - date-time (as date-time in RFC3339). Return items created before certain date/time (in UTC)
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Return items created on or after certain date/time (in UTC)
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339).
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
            /// Available fields are: Id, Name, CreatedOn.
            public var sort: String?
        }
        public func paymentTermsGetList(tenant: Int64, query: PaymentTermsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Accounting.PaymentTermAPIModel>, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/payment-terms"
            return await getReq(Models.PaginatedResponse<Models.Accounting.PaymentTermAPIModel>.self, endpoint: endpoint, params: query)
        }
        /// Query Parameters for func paymentTypesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PaymentTypesGetListQuery: URLQueryConvertible {
            /// Perform lookup by multiple IDs (maximum 50)
            public var ids: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
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
        public func paymentTypesGetList(tenant: Int64, query: PaymentTypesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Accounting.PaymentTypeResponse>, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/payment-types"
            return await getReq(Models.PaginatedResponse<Models.Accounting.PaymentTypeResponse>.self, endpoint: endpoint, params: query)
        }
        public func paymentTypesGet(id: Int64, tenant: Int64) async -> Result<Models.Accounting.PaymentTypeResponse, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/payment-types/\(id)"
            return await getReq(Models.Accounting.PaymentTypeResponse.self, endpoint: endpoint)
        }
        /// Query Parameters for func taxZonesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct TaxZonesGetListQuery: URLQueryConvertible {
            /// Tax Zone Ids to pull tax zones for
            public var ids: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Format - date-time (as date-time in RFC3339).
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339).
            public var modifiedOnOrAfter: Date?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, Name, CreatedOn.
            public var sort: String?
        }
        public func taxZonesGetList(tenant: Int64, query: TaxZonesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Accounting.TaxZoneResponse>, APIError> {
            let endpoint = "/accounting/v2/tenant/\(tenant)/tax-zones"
            return await getReq(Models.PaginatedResponse<Models.Accounting.TaxZoneResponse>.self, endpoint: endpoint, params: query)
        }
    }
}
