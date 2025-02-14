//
//  Pricebook.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct Pricebook {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ClientSpecificPricingResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var exceptions: ClientSpecificPricingExceptionResponse
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ClientSpecificPricingExceptionResponse: Codable {
            
            public var skuId: Int64
            
            public var skuType: SkuType
            
            public var value: Double
            
            public var valueType: MarkupType
        }
        public enum SkuType: String, CaseIterable, Identifiable, Codable {
            case Service, Material, Equipment, PriceModifier
            public var id: String { rawValue }
        }
        public enum MarkupType: String, CaseIterable, Identifiable, Codable {
            case Percent, Dollar, Multiplier, FlatPrice, DiscountPercent
            public var id: String { rawValue }
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateClientSpecificPricingResponse: Codable {
            
            public var exceptions: UpdateClientSpecificPricingExceptionResponse
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateClientSpecificPricingExceptionResponse: Codable {
            
            public var skuId: Int64
            
            public var value: Double
            
            public var valueType: MarkupType
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct UpdateClientSpecificPricingRequest: Codable {
            
            public var exceptions: ClientSpecificPricingExceptionRequest?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ClientSpecificPricingExceptionRequest: Codable {
            
            public var skuId: Int64
            
            public var value: Double
            
            public var valueType: MarkupType
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public class CategoryResponse: Codable, Identifiable {
            /// The id for the category
            public var id: Int64
            /// The name of the category
            public var name: String
            /// Active shows if this category is currently active
            public var active: Bool
            /// A description that described the category
            public var description: String?
            /// The image to display as the category
            public var image: String?
            /// The id of the category that is the parent of this item
            public var parentId: Int64?
            /// The position location of this item
            public var position: Int32
            /// The category type. This field can be Service or Material.
            public var categoryType: CategoryType
            /// The array of the subcategories
            public var subcategories: [CategoryResponse]?
            /// The business units that are associated with this category
            public var businessUnitIds: [Int64]?
            /// The images that will be used for the SKUs under this category
            public var skuImages: [String]?
            /// The videos that will be used for the videos under this category
            public var skuVideos: [String]?
            /// The source of the category if it was imported from a catalog
            public var source: String?
            /// External id is the id of the original source of the item when it comes from a catalog
            public var externalId: String?
        }
        public enum CategoryType: String, CaseIterable, Identifiable, Codable {
            case Services, Materials
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CategoryCreateRequest: Codable {
            /// The name of the category
            public var name: String
            /// Active shows if this category is currently active
            public var active: Bool?
            /// A description that described the category
            public var description: String?
            /// The id of the category that is the parent of this item
            public var parentId: Int64?
            /// The position location of this item
            public var position: Int32?
            /// The image to display as the category
            public var image: String?
            /// The category type. This field can be Service or Material.
            public var categoryType: CategoryType
            /// The business units that are associated with this category
            public var businessUnitIds: [Int64]?
            /// The images that will be used for the SKUs under this category
            public var skuImages: [String]?
            /// The videos that will be used for the videos under this category
            public var skuVideos: [String]?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CategoryUpdateRequest: Codable {
            /// The name of the category
            public var name: String
            /// Active shows if this category is currently active
            public var active: Bool
            /// A description that described the category
            public var description: String
            /// The id of the category that is the parent of this item
            public var parentId: Int64?
            /// The position location of this item
            public var position: Int32
            /// The image to display as the category
            public var image: String
            /// The category type. This field can be Service or Material.
            public var categoryType: CategoryType
            /// The business units that are associated with this category
            public var businessUnitIds: [Int64]
            /// The images that will be used for the SKUs under this category
            public var skuImages: [String]
            /// The videos that will be used for the videos under this category
            public var skuVideos: [String]
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DiscountAndFeesResponse: Codable, Identifiable {
            /// Unique id for the discount or fee
            public var id: Int64
            /// Type should be entered as Discount or Fee to show the type
            public var type: PriceModifierType
            /// Code used for the discount or fee
            public var code: String
            /// Name for the discount of fee
            public var displayName: String?
            /// Description for the item
            public var description: String
            /// The amount type takes either "percentage" or "flat " and apply the "amount" field accordingly
            public var amountType: PriceModifierAmountType
            /// Amount is either the flat amount or percentage you want discounted/added
            public var amount: Double
            /// The maximum amount that can be applied for this item
            public var limit: Double
            /// Should tax be applied when the item is added on an estimate or invoice
            public var taxable: Bool
            /// The category technicians will use to find the item
            public var categories: [Int64]?
            /// The number of hours associated with the SKU
            public var hours: Double
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetResponse?
            /// The accounting account assigned to the SKU
            public var account: String?
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String?
            /// Active shows if this item is currently active
            public var active: Bool
            /// Flat rate bonus paid for this item
            public var bonus: Double
            /// Percentage rate bonus paid for this item
            public var commissionBonus: Double
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Exclude from payroll
            public var excludeFromPayroll: Bool
            /// List of external data attached to this job,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel?
        }
        public enum PriceModifierType: String, CaseIterable, Identifiable, Codable {
            case Discount, Fee
            public var id: String { rawValue }
        }
        public enum PriceModifierAmountType: String, CaseIterable, Identifiable, Codable {
            case Percentage, Fixed
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuAssetResponse: Codable {
            /// Asset alias
            public var alias: String?
            /// Asset file name when downloaded
            public var fileName: String?
            /// Asset type - image, video or PDF
            public var type: SkuAssetType
            /// Asset URL
            public var url: String
        }
        public enum SkuAssetType: String, CaseIterable, Identifiable, Codable {
            case Other, Image, Video, Attachment, VideoFile
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalDataModel: Codable {
            /// External data key.
            public var key: String
            /// External data value.
            public var value: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DiscountAndFeesCreateRequest: Codable {
            /// Type should be entered as Discount or Fee to show the type
            public var type: PriceModifierType
            /// Code used for the discount or fee
            public var code: String
            /// Name for the discount of fee
            public var displayName: String?
            /// Description for the item
            public var description: String
            /// The amount type takes either "percentage" or "flat " and apply the "amount" field accordingly
            public var amountType: PriceModifierAmountType
            /// Amount is either the flat amount or percentage you want discounted/added
            public var amount: Double
            /// The maximum amount that can be applied for this item
            public var limit: Double?
            /// Should tax be applied when the item is added on an estimate or invoice
            public var taxable: Bool?
            /// The category technicians will use to find the item
            public var categories: [Int64]?
            /// The number of hours associated with the SKU
            public var hours: Double?
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetRequest?
            /// The accounting account assigned to the SKU
            public var account: String?
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String?
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String?
            /// Active shows if this item is currently active
            public var active: Bool?
            /// Flat rate bonus paid for this item
            public var bonus: Double?
            /// Percentage rate bonus paid for this item
            public var commissionBonus: Double?
            /// PaysCommissions shows if for this item commission payed
            public var paysCommission: Bool?
            /// Exclude from payroll
            public var excludeFromPayroll: Bool?
            /// Optional model that contains a list of external data items
            /// that should be attached to this entity.
            public var externalData: ExternalDataCreateRequest?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuAssetRequest: Codable {
            /// Attached asset type - Image, Video, PDF
            public var type: SkuAssetType
            /// Asset file name. Useful when downloading PDFs
            public var alias: String?
            /// Asset URL to download from
            public var url: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ExternalDataCreateRequest: Codable {
            /// Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided.
            public var applicationGuid: String
            /// External data list.
            public var externalData: ExternalDataModel
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DiscountAndFeesUpdateRequest: Codable {
            /// Type should be entered as Discount or Fee to show the type
            public var type: PriceModifierType
            /// Code used for the discount or fee
            public var code: String
            /// Name for the discount of fee
            public var displayName: String
            /// Description for the item
            public var description: String
            /// The amount type takes either "percentage" or "flat " and apply the "amount" field accordingly
            public var amountType: PriceModifierAmountType
            /// Amount is either the flat amount or percentage you want discounted/added
            public var amount: Double
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String
            /// The maximum amount that can be applied for this item
            public var limit: Double
            /// Should tax be applied when the item is added on an estimate or invoice
            public var taxable: Bool
            /// The category technicians will use to find the item
            public var categories: [Int64]
            /// The number of hours associated with the SKU
            public var hours: Double
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetRequest
            /// The accounting account assigned to the SKU
            public var account: String
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String
            /// Active shows if this item is currently active
            public var active: Bool
            /// Flat rate bonus paid for this item
            public var bonus: Double
            /// Percentage rate bonus paid for this item
            public var commissionBonus: Double
            /// PaysCommissions shows if for this item commission payed
            public var paysCommission: Bool
            /// Exclude from payroll
            public var excludeFromPayroll: Bool
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest?
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
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentResponse: Codable, Identifiable {
            /// Unique id for the SKU
            public var id: Int64
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String?
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Active shows if the SKU is active or inactive
            public var active: Bool
            /// Price of this SKU sold
            public var price: Double
            /// The price if the item is sold to a member
            public var memberPrice: Double
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double
            /// Name of the manufactures
            public var manufacturer: String?
            /// The model of the equipment
            public var model: String?
            /// Description of the manufacturer warranty included in this SKU
            public var manufacturerWarranty: SkuWarrantyResponse
            /// Description of the manufacturer warranty included in this SKU
            public var serviceProviderWarranty: SkuWarrantyResponse
            /// Categories that this SKU belongs to
            public var categories: [Int64]
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetResponse
            /// Recommended services and materials to include with this SKU
            public var recommendations: EquipmentRecommendationResponse
            /// Upgrades that can be sold for this SKU
            public var upgrades: [Int64]
            /// Array of materials used with this equipment
            public var equipmentMaterials: SkuLinkResponse
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorResponse?
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: SkuVendorResponse?
            /// The accounting account assigned to the SKU
            public var account: String?
            
            public var costOfSaleAccount: String?
            
            public var assetAccount: String?
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String?
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Flat rate bonus paid for this task
            public var bonus: Double
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double
            /// The number of hours associated with the installing the equipment
            public var hours: Double
            /// Is this SKU taxable
            public var taxable: Bool
            /// The cost paid to acquire the material
            public var cost: Double
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String?
            /// Is this equipment a part of your inventory
            public var isInventory: Bool
            /// Timestamp where the item was last modified
            public var modifiedOn: Date
            /// The source catalog for this SKU.
            public var source: String?
            /// External id is the id of the original source of the item when it comes from a catalog
            public var externalId: String?
            /// List of external data attached to this job,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel?
            /// Shows if is a Configurable Equipment
            public var isConfigurableEquipment: Bool
            /// List of added Variations if is a Configurable Equipment, or else the List of Configurable Equipment assigned to
            public var variationsOrConfigurableEquipment: [Int64]?
            /// Shows Equipment's Type Id
            public var typeId: Int64?
            /// Shows if it should be displayed in the amount
            public var displayInAmount: Bool
            /// The General Ledger Account assigned to the SKU
            public var generalLedgerAccountId: Int64?
            /// Shows Equipment's Created On Date
            public var createdOn: Date
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuWarrantyResponse: Codable {
            /// Warranty duration
            public var duration: Int32
            /// Description of the warranty included in this SKU
            public var description: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentRecommendationResponse: Codable {
            /// SKU unique identifier
            public var skuId: Int64
            /// Recommended SKU type (Service or Material)
            public var type: EquipmentRecommendationType
        }
        public enum EquipmentRecommendationType: String, CaseIterable, Identifiable, Codable {
            case Service, Material
            public var id: String { rawValue }
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuLinkResponse: Codable {
            /// Linked SKU unique id
            public var skuId: Int64
            /// Quantity of linked SKUs
            public var quantity: Double
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuVendorResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var vendorName: String
            
            public var vendorId: Int64
            
            public var memo: String?
            
            public var vendorPart: String?
            
            public var cost: Double
            
            public var active: Bool
            
            public var primarySubAccount: SkuVendorSubAccountResponse?
            
            public var otherSubAccounts: SkuVendorSubAccountResponse?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuVendorSubAccountResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var cost: Double
            
            public var accountName: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentCreateRequest: Codable {
            /// Array of materials used with this equipment
            public var equipmentMaterials: SkuLinkRequest?
            /// Recommended services and materials to include with this SKU
            public var recommendations: EquipmentRecommendationRequest?
            /// Upgrades that can be sold for this SKU
            public var upgrades: [Int64]?
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String?
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Price of this SKU sold
            public var price: Double?
            /// The price if the item is sold to a member
            public var memberPrice: Double?
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double?
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double?
            /// Active shows if the SKU is active or inactive
            public var active: Bool?
            /// Name of the manufactures
            public var manufacturer: String?
            /// The model of the equipment
            public var model: String?
            /// Description of the manufacturer warranty included in this SKU
            public var manufacturerWarranty: SkuWarrantyRequest?
            /// Description of the manufacturer warranty included in this SKU
            public var serviceProviderWarranty: SkuWarrantyRequest?
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetRequest?
            /// Categories that this SKU belongs to
            public var categories: [Int64]?
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorRequest?
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: SkuVendorRequest?
            /// The accounting account assigned to this SKU
            public var account: String?
            
            public var costOfSaleAccount: String?
            
            public var assetAccount: String?
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String?
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String?
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool?
            /// Flat rate bonus paid for this task
            public var bonus: Double?
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double?
            /// The number of hours associated with the installing the equipment
            public var hours: Double?
            /// Is this SKU taxable
            public var taxable: Bool?
            /// The cost paid to acquire the material
            public var cost: Double?
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String?
            /// Is this equipment a part of your inventory
            public var isInventory: Bool?
            /// Optional model that contains a list of external data items
            /// that should be attached to this entity.
            public var externalData: ExternalDataCreateRequest?
            /// Is this a Configurable Equipment
            public var isConfigurableEquipment: Bool?
            /// Variations to add
            public var variationEquipment: [Int64]?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuLinkRequest: Codable {
            /// Linked SKU unique Id
            public var skuId: Int64
            /// Linked SKUs quantity
            public var quantity: Double
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentRecommendationRequest: Codable {
            
            public var skuId: Int64
            
            public var type: EquipmentRecommendationType
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuWarrantyRequest: Codable {
            /// Warranty duration
            public var duration: Int32
            /// Description of the warranty included in this SKU
            public var description: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuVendorRequest: Codable {
            
            public var vendorId: Int64
            
            public var memo: String?
            
            public var vendorPart: String?
            
            public var cost: Double
            
            public var active: Bool
            
            public var primarySubAccount: SkuVendorSubAccountRequest?
            
            public var otherSubAccounts: SkuVendorSubAccountRequest?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuVendorSubAccountRequest: Codable {
            
            public var cost: Double
            
            public var accountName: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentUpdateRequest: Codable {
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Price of this SKU sold
            public var price: Double
            /// The price if the item is sold to a member
            public var memberPrice: Double
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double
            /// Active shows if the SKU is active or inactive
            public var active: Bool
            /// Name of the manufactures
            public var manufacturer: String
            /// The model of the equipment
            public var model: String
            /// Description of the manufacturer warranty included in this SKU
            public var manufacturerWarranty: SkuWarrantyRequest
            /// Description of the manufacturer warranty included in this SKU
            public var serviceProviderWarranty: SkuWarrantyRequest
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetRequest
            /// Recommended services and materials to include with this SKU
            public var recommendations: EquipmentRecommendationRequest
            /// Upgrades that can be sold for this SKU
            public var upgrades: [Int64]
            /// Array of materials used with this equipment
            public var equipmentMaterials: SkuLinkRequest
            /// Categories that this SKU belongs to
            public var categories: [Int64]
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorRequest
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: SkuVendorRequest
            /// The accounting account assigned to this SKU
            public var account: String
            
            public var costOfSaleAccount: String
            
            public var assetAccount: String
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Flat rate bonus paid for this task
            public var bonus: Double
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double
            /// The number of hours associated with the installing the equipment
            public var hours: Double
            /// Is this SKU taxable
            public var taxable: Bool
            /// The cost paid to acquire the material
            public var cost: Double
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String
            /// Is this equipment a part of your inventory
            public var isInventory: Bool
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest?
            /// Is this a Configurable Equipment
            public var isConfigurableEquipment: Bool
            /// Added Variations
            public var variationEquipment: [Int64]
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ImageUploadResponse: Codable {
            /// The storage path where the image was uploaded
            public var path: String
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialResponse: Codable, Identifiable {
            /// Unique id for the SKU
            public var id: Int64
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String?
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// The cost paid to acquire the material
            public var cost: Double
            /// Active shows if the SKU is active or inactive
            public var active: Bool
            /// Price of this SKU sold
            public var price: Double
            /// The price if the item is sold to a member
            public var memberPrice: Double
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double
            /// The number of hours associated with the installing the material
            public var hours: Double
            /// Flat rate bonus paid for this task
            public var bonus: Double
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Is this deducted as job cost
            public var deductAsJobCost: Bool
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String?
            /// Is this material a part of your inventory
            public var isInventory: Bool
            /// The accounting account assigned to the SKU
            public var account: String?
            
            public var costOfSaleAccount: String?
            
            public var assetAccount: String?
            /// Is this SKU taxable
            public var taxable: Bool?
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorResponse?
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: SkuVendorResponse?
            /// Categories that this SKU belongs to
            public var categories: [Int64]
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetResponse
            /// Timestamp where the item was last modified
            public var modifiedOn: Date
            /// The source catalog for this SKU.
            public var source: String?
            /// External id is the id of the original source of the item when it comes from a catalog
            public var externalId: String?
            /// List of external data attached to this job,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel?
            /// Shows if is a Configurable Material
            public var isConfigurableMaterial: Bool
            /// Shows if material is going to be chargeable by default on Estimate or Invoice
            public var chargeableByDefault: Bool
            /// List of added Variations if is a Configurable Material, or else the List of Configurable Materials assigned to
            public var variationsOrConfigurableMaterials: [Int64]?
            /// Material's business unit id
            public var businessUnitId: Int64?
            /// Material's created by user id
            public var createdById: Int64
            /// Date Material was created
            public var createdOn: Date
            /// Shows if material is going to be displayed in amount
            public var displayInAmount: Bool
            /// Material's General Ledger Account Id
            public var generalLedgerAccountId: Int64?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialCreateRequest: Codable {
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String?
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// The cost paid to acquire the material
            public var cost: Double?
            /// Active shows if the SKU is active or inactive
            public var active: Bool?
            /// Price of this SKU sold
            public var price: Double?
            /// The price if the item is sold to a member
            public var memberPrice: Double?
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double?
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double?
            /// The number of hours associated with the installing the material
            public var hours: Double?
            /// Flat rate bonus paid for this task
            public var bonus: Double?
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double?
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool?
            /// Is this deducted as job cost
            public var deductAsJobCost: Bool?
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String?
            /// Is this equipment a part of your inventory
            public var isInventory: Bool?
            /// The accounting account assigned to this SKU
            public var account: String?
            
            public var costOfSaleAccount: String?
            
            public var assetAccount: String?
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String?
            /// Is this SKU taxable
            public var taxable: Bool?
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorRequest?
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: SkuVendorRequest?
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetRequest?
            /// Categories that this SKU belongs to
            public var categories: [Int64]?
            /// Optional model that contains a list of external data items
            /// that should be attached to this entity.
            public var externalData: ExternalDataCreateRequest?
            /// Is this a Configurable Material
            public var isConfigurableMaterial: Bool?
            /// Is this Chargeable by default
            public var chargeableByDefault: Bool?
            /// Variations to add
            public var variationMaterials: [Int64]?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialUpdateRequest: Codable {
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// The cost paid to acquire the material
            public var cost: Double
            /// Active shows if the SKU is active or inactive
            public var active: Bool
            /// Price of this SKU sold
            public var price: Double
            /// The price if the item is sold to a member
            public var memberPrice: Double
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double
            /// The number of hours associated with the installing the material
            public var hours: Double
            /// Flat rate bonus paid for this task
            public var bonus: Double
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Is this deducted as job cost
            public var deductAsJobCost: Bool
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String
            /// Is this material a part of your inventory
            public var isInventory: Bool
            /// The accounting account assigned to this SKU
            public var account: String
            
            public var costOfSaleAccount: String
            
            public var assetAccount: String
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String
            /// Is this SKU taxable
            public var taxable: Bool
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorRequest
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: SkuVendorRequest
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetRequest
            /// Categories that this SKU belongs to
            public var categories: [Int64]
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest?
            /// Is this a Configurable Material
            public var isConfigurableMaterial: Bool
            /// Is this Chargeable by default
            public var chargeableByDefault: Bool
            /// Added Variations
            public var variationMaterials: [Int64]
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialsMarkupResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var from: Double
            
            public var to: Double
            
            public var percent: Double
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialsMarkupCreatedResponse: Codable {
            
            public var data: MaterialsMarkupResponse
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialsMarkupRequest: Codable, Identifiable {
            
            public var id: Int64
            
            public var from: Double
            
            public var to: Double
            
            public var percent: Double
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PricebookBulkCreateResponse: Codable {
            
            public var services: CustomIdMappingModel?
            
            public var equipment: CustomIdMappingModel?
            
            public var materials: CustomIdMappingModel?
            
            public var discountAndFees: CustomIdMappingModel?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CustomIdMappingModel: Codable, Identifiable {
            
            public var customId: String
            
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PricebookBulkCreateRequest: Codable {
            
            public var services: [ServiceBulkCreateRequest]?
            
            public var equipment: [EquipmentBulkCreateRequest]?
            
            public var materials: [MaterialBulkCreateRequest]?
            
            public var discountAndFees: [DiscountAndFeesBulkCreateRequest]?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ServiceBulkCreateRequest: Codable {
            /// Array of materials linked to the service
            public var serviceMaterials: [SkuLinkBulkCreateRequest]?
            /// Array of equipment linked to the service
            public var serviceEquipment: [SkuLinkBulkCreateRequest]?
            /// Recommended services and materials to include with this SKU
            public var recommendations: [ServiceRecommendationBulkCreateRequest]?
            /// Upgrades that can be sold for this SKU
            public var upgrades: [SkuUpgradeBulkCreateRequest]?
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String?
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Description of the warranty included in this SKU
            public var warranty: SkuWarrantyRequest?
            /// Categories that this SKU belongs to
            public var categories: [Int64]?
            /// Price of this SKU sold
            public var price: Double?
            /// The price if the item is sold to a member
            public var memberPrice: Double?
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double?
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double?
            /// Is this SKU taxable
            public var taxable: Bool?
            /// The accounting account assigned to this SKU
            public var account: String?
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String?
            /// Hours needed to complete this service
            public var hours: Double?
            /// Is a labor service
            public var isLabor: Bool?
            /// Images, videos or PDFs attached to SKU
            public var assets: [SkuAssetRequest]?
            /// Active shows if the SKU is active or inactive
            public var active: Bool?
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String?
            /// True if this task pays commission
            public var paysCommission: Bool?
            /// Flat rate bonus paid for this task
            public var bonus: Double?
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double?
            /// Optional model that contains a list of external data items
            /// that should be attached to this entity.
            public var externalData: ExternalDataCreateRequest?
            
            public var customId: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuLinkBulkCreateRequest: Codable {
            /// Linked SKU unique Id
            public var skuId: Int64?
            /// Linked SKU custom Id
            public var customId: String?
            /// Linked SKUs quantity
            public var quantity: Double
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ServiceRecommendationBulkCreateRequest: Codable {
            /// Linked SKU unique Id
            public var skuId: Int64?
            /// Linked SKU custom Id
            public var customId: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuUpgradeBulkCreateRequest: Codable {
            /// Linked SKU unique Id
            public var skuId: Int64?
            /// Linked SKU custom Id
            public var customId: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentBulkCreateRequest: Codable {
            /// Array of materials used with this equipment
            public var equipmentMaterials: [SkuLinkBulkCreateRequest]?
            /// Recommended services and materials to include with this SKU
            public var recommendations: [EquipmentRecommendationBulkCreateRequest]?
            /// Upgrades that can be sold for this SKU
            public var upgrades: [SkuUpgradeBulkCreateRequest]?
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String?
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Price of this SKU sold
            public var price: Double?
            /// The price if the item is sold to a member
            public var memberPrice: Double?
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double?
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double?
            /// Active shows if the SKU is active or inactive
            public var active: Bool?
            /// Name of the manufactures
            public var manufacturer: String?
            /// The model of the equipment
            public var model: String?
            /// Description of the manufacturer warranty included in this SKU
            public var manufacturerWarranty: SkuWarrantyRequest?
            /// Description of the manufacturer warranty included in this SKU
            public var serviceProviderWarranty: SkuWarrantyRequest?
            /// Images, videos or PDFs attached to SKU
            public var assets: [SkuAssetRequest]?
            /// Categories that this SKU belongs to
            public var categories: [Int64]?
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorRequest?
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: [SkuVendorRequest]?
            /// The accounting account assigned to this SKU
            public var account: String?
            
            public var costOfSaleAccount: String?
            
            public var assetAccount: String?
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String?
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String?
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool?
            /// Flat rate bonus paid for this task
            public var bonus: Double?
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double?
            /// The number of hours associated with the installing the equipment
            public var hours: Double?
            /// Is this SKU taxable
            public var taxable: Bool?
            /// The cost paid to acquire the material
            public var cost: Double?
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String?
            /// Is this equipment a part of your inventory
            public var isInventory: Bool?
            /// Optional model that contains a list of external data items
            /// that should be attached to this entity.
            public var externalData: ExternalDataCreateRequest?
            /// Is this a Configurable Equipment
            public var isConfigurableEquipment: Bool?
            /// Variations to add
            public var variationEquipment: [Int64]?
            
            public var customId: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentRecommendationBulkCreateRequest: Codable {
            /// Linked SKU unique Id
            public var skuId: Int64?
            /// Linked SKU custom Id
            public var customId: String?
            
            public var type: EquipmentRecommendationType
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialBulkCreateRequest: Codable {
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String?
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// The cost paid to acquire the material
            public var cost: Double?
            /// Active shows if the SKU is active or inactive
            public var active: Bool?
            /// Price of this SKU sold
            public var price: Double?
            /// The price if the item is sold to a member
            public var memberPrice: Double?
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double?
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double?
            /// The number of hours associated with the installing the material
            public var hours: Double?
            /// Flat rate bonus paid for this task
            public var bonus: Double?
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double?
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool?
            /// Is this deducted as job cost
            public var deductAsJobCost: Bool?
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String?
            /// Is this equipment a part of your inventory
            public var isInventory: Bool?
            /// The accounting account assigned to this SKU
            public var account: String?
            
            public var costOfSaleAccount: String?
            
            public var assetAccount: String?
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String?
            /// Is this SKU taxable
            public var taxable: Bool?
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorRequest?
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: [SkuVendorRequest]?
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetRequest?
            /// Categories that this SKU belongs to
            public var categories: [Int64]?
            /// Optional model that contains a list of external data items
            /// that should be attached to this entity.
            public var externalData: ExternalDataCreateRequest?
            /// Is this a Configurable Material
            public var isConfigurableMaterial: Bool?
            /// Is this Chargeable by default
            public var chargeableByDefault: Bool?
            /// Variations to add
            public var variationMaterials: [Int64]?
            
            public var customId: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DiscountAndFeesBulkCreateRequest: Codable {
            /// Type should be entered as Discount or Fee to show the type
            public var type: PriceModifierType
            /// Code used for the discount or fee
            public var code: String
            /// Name for the discount of fee
            public var displayName: String?
            /// Description for the item
            public var description: String
            /// The amount type takes either "percentage" or "flat " and apply the "amount" field accordingly
            public var amountType: PriceModifierAmountType
            /// Amount is either the flat amount or percentage you want discounted/added
            public var amount: Double
            /// The maximum amount that can be applied for this item
            public var limit: Double?
            /// Should tax be applied when the item is added on an estimate or invoice
            public var taxable: Bool?
            /// The category technicians will use to find the item
            public var categories: [Int64]?
            /// The number of hours associated with the SKU
            public var hours: Double?
            /// Images, videos or PDFs attached to SKU
            public var assets: SkuAssetRequest?
            /// The accounting account assigned to the SKU
            public var account: String?
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String?
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String?
            /// Active shows if this item is currently active
            public var active: Bool?
            /// Flat rate bonus paid for this item
            public var bonus: Double?
            /// Percentage rate bonus paid for this item
            public var commissionBonus: Double?
            /// PaysCommissions shows if for this item commission payed
            public var paysCommission: Bool?
            /// Exclude from payroll
            public var excludeFromPayroll: Bool?
            /// Optional model that contains a list of external data items
            /// that should be attached to this entity.
            public var externalData: ExternalDataCreateRequest?
            
            public var customId: String?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct PricebookBulkUpdateRequest: Codable {
            
            public var services: [ServiceBulkUpdateRequest]?
            
            public var equipment: [EquipmentBulkUpdateRequest]?
            
            public var materials: [MaterialBulkUpdateRequest]?
            
            public var discountAndFees: [DiscountAndFeesBulkUpdateRequest]?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ServiceBulkUpdateRequest: Codable, Identifiable {
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Description of the warranty included in this SKU
            public var warranty: SkuWarrantyRequest
            /// Categories that this SKU belongs to
            public var categories: [Int64]
            /// Price of this SKU sold
            public var price: Double
            /// The price if the item is sold to a member
            public var memberPrice: Double
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double
            /// Is this SKU taxable
            public var taxable: Bool
            /// The accounting account assigned to this SKU
            public var account: String
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String
            /// Hours needed to complete this service
            public var hours: Double
            /// Is a labor service
            public var isLabor: Bool
            /// Recommended other services to include with this SKU
            public var recommendations: Int64
            /// Upgrades that can be sold for this SKU
            public var upgrades: Int64
            /// Images, videos or PDFs attached to SKU
            public var assets: [SkuAssetRequest]
            /// Array of materials linked to the service
            public var serviceMaterials: [SkuLinkRequest]
            /// Array of equipment linked to the service
            public var serviceEquipment: [SkuLinkRequest]
            /// Active shows if the SKU is active or inactive
            public var active: Bool
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Flat rate bonus paid for this task
            public var bonus: Double
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest?
            
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentBulkUpdateRequest: Codable, Identifiable {
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Price of this SKU sold
            public var price: Double
            /// The price if the item is sold to a member
            public var memberPrice: Double
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double
            /// Active shows if the SKU is active or inactive
            public var active: Bool
            /// Name of the manufactures
            public var manufacturer: String
            /// The model of the equipment
            public var model: String
            /// Description of the manufacturer warranty included in this SKU
            public var manufacturerWarranty: SkuWarrantyRequest
            /// Description of the manufacturer warranty included in this SKU
            public var serviceProviderWarranty: SkuWarrantyRequest
            /// Images, videos or PDFs attached to SKU
            public var assets: [SkuAssetRequest]
            /// Recommended services and materials to include with this SKU
            public var recommendations: [EquipmentRecommendationRequest]
            /// Upgrades that can be sold for this SKU
            public var upgrades: [Int64]
            /// Array of materials used with this equipment
            public var equipmentMaterials: [SkuLinkRequest]
            /// Categories that this SKU belongs to
            public var categories: Int64
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorRequest
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: [SkuVendorRequest]
            /// The accounting account assigned to this SKU
            public var account: String
            
            public var costOfSaleAccount: String
            
            public var assetAccount: String
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Flat rate bonus paid for this task
            public var bonus: Double
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double
            /// The number of hours associated with the installing the equipment
            public var hours: Double
            /// Is this SKU taxable
            public var taxable: Bool
            /// The cost paid to acquire the material
            public var cost: Double
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String
            /// Is this equipment a part of your inventory
            public var isInventory: Bool
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest?
            /// Is this a Configurable Equipment
            public var isConfigurableEquipment: Bool
            /// Added Variations
            public var variationEquipment: [Int64]
            
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialBulkUpdateRequest: Codable, Identifiable {
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// The cost paid to acquire the material
            public var cost: Double
            /// Active shows if the SKU is active or inactive
            public var active: Bool
            /// Price of this SKU sold
            public var price: Double
            /// The price if the item is sold to a member
            public var memberPrice: Double
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double
            /// The number of hours associated with the installing the material
            public var hours: Double
            /// Flat rate bonus paid for this task
            public var bonus: Double
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Is this deducted as job cost
            public var deductAsJobCost: Bool
            /// The unit of measure used for this SKU
            public var unitOfMeasure: String
            /// Is this material a part of your inventory
            public var isInventory: Bool
            /// The accounting account assigned to this SKU
            public var account: String
            
            public var costOfSaleAccount: String
            
            public var assetAccount: String
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String
            /// Is this SKU taxable
            public var taxable: Bool
            /// The primary vendor you use to acquire this SKU
            public var primaryVendor: SkuVendorRequest
            /// Other vendors that you might go to acquire this SKU
            public var otherVendors: [SkuVendorRequest]
            /// Images, videos or PDFs attached to SKU
            public var assets: [SkuAssetRequest]
            /// Categories that this SKU belongs to
            public var categories: [Int64]
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest?
            /// Is this a Configurable Material
            public var isConfigurableMaterial: Bool
            /// Is this Chargeable by default
            public var chargeableByDefault: Bool
            /// Added Variations
            public var variationMaterials: [Int64]
            
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DiscountAndFeesBulkUpdateRequest: Codable, Identifiable {
            /// Type should be entered as Discount or Fee to show the type
            public var type: PriceModifierType
            /// Code used for the discount or fee
            public var code: String
            /// Name for the discount of fee
            public var displayName: String
            /// Description for the item
            public var description: String
            /// The amount type takes either "percentage" or "flat " and apply the "amount" field accordingly
            public var amountType: PriceModifierAmountType
            /// Amount is either the flat amount or percentage you want discounted/added
            public var amount: Double
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String
            /// The maximum amount that can be applied for this item
            public var limit: Double
            /// Should tax be applied when the item is added on an estimate or invoice
            public var taxable: Bool
            /// The category technicians will use to find the item
            public var categories: [Int64]
            /// The number of hours associated with the SKU
            public var hours: Double
            /// Images, videos or PDFs attached to SKU
            public var assets: [SkuAssetRequest]
            /// The accounting account assigned to the SKU
            public var account: String
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String
            /// Active shows if this item is currently active
            public var active: Bool
            /// Flat rate bonus paid for this item
            public var bonus: Double
            /// Percentage rate bonus paid for this item
            public var commissionBonus: Double
            /// PaysCommissions shows if for this item commission payed
            public var paysCommission: Bool
            /// Exclude from payroll
            public var excludeFromPayroll: Bool
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest?
            
            public var id: Int64
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ServiceResponse: Codable, Identifiable {
            /// Unique id for the SKU
            public var id: Int64
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String?
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Description of the warranty included in this SKU
            public var warranty: SkuWarrantyResponse?
            /// Categories that this SKU belongs to
            public var categories: [SkuCategoryResponse]
            /// Price of this SKU sold
            public var price: Double
            /// The price if the item is sold to a member
            public var memberPrice: Double
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double
            /// Is this SKU taxable
            public var taxable: Bool
            /// The accounting account assigned to this SKU
            public var account: String?
            /// Hours needed to complete this service
            public var hours: Double
            /// Is a labor service
            public var isLabor: Bool?
            /// Recommended other service or materials to include with this SKU
            public var recommendations: [Int64]
            /// Upgrades that can be sold for this SKU
            public var upgrades: [Int64]
            /// Images, videos or PDFs attached to SKU
            public var assets: [SkuAssetResponse]
            /// Array of materials that is used with this service
            public var serviceMaterials: [SkuLinkResponse]
            /// Array of equipment used with this service
            public var serviceEquipment: [SkuLinkResponse]
            /// Active shows if the SKU is active or inactive
            public var active: Bool
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String?
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Flat rate bonus paid for this task
            public var bonus: Double
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double
            /// Timestamp when the item was last modified
            public var modifiedOn: Date
            /// The source catalog for this SKU.
            public var source: String?
            /// External id is the id of the original source of the item when it comes from a catalog
            public var externalId: String?
            /// List of external data attached to this job,
            /// that corresponds to the application guid provided in the request.
            public var externalData: ExternalDataModel?
            /// Service's Bussiness Unit Id
            public var businessUnitId: Int64?
            /// Service Cost
            public var cost: Double
            /// Timestamp when the item was created
            public var createdOn: Date
            /// Sold by commission
            public var soldByCommission: Double
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct SkuCategoryResponse: Codable, Identifiable {
            /// Unique Category Id
            public var id: Int64
            /// Category name
            public var name: String
            /// Active shows if the Category is active or inactive
            public var active: Bool
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ServiceCreateRequest: Codable {
            /// Array of materials linked to the service
            public var serviceMaterials: [SkuLinkRequest]?
            /// Array of equipment linked to the service
            public var serviceEquipment: [SkuLinkRequest]?
            /// Recommended services and materials to include with this SKU
            public var recommendations: [Int64]?
            /// Upgrades that can be sold for this SKU
            public var upgrades: [Int64]?
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String?
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Description of the warranty included in this SKU
            public var warranty: SkuWarrantyRequest?
            /// Categories that this SKU belongs to
            public var categories: [Int64]?
            /// Price of this SKU sold
            public var price: Double?
            /// The price if the item is sold to a member
            public var memberPrice: Double?
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double?
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double?
            /// Is this SKU taxable
            public var taxable: Bool?
            /// The accounting account assigned to this SKU
            public var account: String?
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String?
            /// Hours needed to complete this service
            public var hours: Double?
            /// Is a labor service
            public var isLabor: Bool?
            /// Images, videos or PDFs attached to SKU
            public var assets: [SkuAssetRequest]?
            /// Active shows if the SKU is active or inactive
            public var active: Bool?
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String?
            /// True if this task pays commission
            public var paysCommission: Bool?
            /// Flat rate bonus paid for this task
            public var bonus: Double?
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double?
            /// Optional model that contains a list of external data items
            /// that should be attached to this entity.
            public var externalData: ExternalDataCreateRequest?
        }
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ServiceUpdateRequest: Codable {
            /// Code for the SKU
            public var code: String
            /// Name that displays with the SKU
            public var displayName: String
            /// Description on the SKU that is displayed with the item
            public var description: String
            /// Description of the warranty included in this SKU
            public var warranty: SkuWarrantyRequest
            /// Categories that this SKU belongs to
            public var categories: [Int64]
            /// Price of this SKU sold
            public var price: Double
            /// The price if the item is sold to a member
            public var memberPrice: Double
            /// The price of the SKU is sold as an add-on item
            public var addOnPrice: Double
            /// The price if the SKU is sold to a member as an add-on item
            public var addOnMemberPrice: Double
            /// Is this SKU taxable
            public var taxable: Bool
            /// The accounting account assigned to this SKU
            public var account: String
            /// Intacct GL Group Name
            ///
            public var intacctGlGroupAccount: String
            /// Hours needed to complete this service
            public var hours: Double
            /// Is a labor service
            public var isLabor: Bool
            /// Recommended other services to include with this SKU
            public var recommendations: [Int64]
            /// Upgrades that can be sold for this SKU
            public var upgrades: [Int64]
            /// Images, videos or PDFs attached to SKU
            public var assets: [SkuAssetRequest]
            /// Array of materials linked to the service
            public var serviceMaterials: [SkuLinkRequest]
            /// Array of equipment linked to the service
            public var serviceEquipment: [SkuLinkRequest]
            /// Active shows if the SKU is active or inactive
            public var active: Bool
            /// A grouping of similar items that you'll then be able to track as a separate columns on the Technical Performance Board.
            public var crossSaleGroup: String
            /// PaysCommissions shows if this task pays commission
            public var paysCommission: Bool
            /// Flat rate bonus paid for this task
            public var bonus: Double
            /// Percentage rate bonus paid for this task
            public var commissionBonus: Double
            /// External data update model.
            public var externalData: ExternalDataUpdateRequest?
        }
    }
}
public extension APIs {
    class Pricebook: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "pricebook")
        }
        /// Query Parameters for func clientSpecificPricingGetAllRateSheets
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ClientSpecificPricingGetAllRateSheetsQuery: URLQueryConvertible {
            public var ids: String?
            public var searchTerm: String?
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - int32.
            public var page: Int32?
            /// Format - int32.
            public var pageSize: Int32?
            public var includeTotal: Bool?
        }
        public func clientSpecificPricingGetAllRateSheets(tenant: Int64, query: ClientSpecificPricingGetAllRateSheetsQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Pricebook.ClientSpecificPricingResponse>, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/clientspecificpricing"
            return await getReq(Models.PaginatedResponse<Models.Pricebook.ClientSpecificPricingResponse>.self, endpoint: endpoint, params: query)
        }
        public func clientSpecificPricingUpdateRateSheet(rateSheetId: Int64, tenant: Int64, body: Models.Pricebook.UpdateClientSpecificPricingRequest) async -> Result<Models.Pricebook.UpdateClientSpecificPricingResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/clientspecificpricing/\(rateSheetId)"
            return await bodiedReq(Models.Pricebook.UpdateClientSpecificPricingResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func categoriesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CategoriesGetListQuery: URLQueryConvertible {
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
            /// Available fields are: Id, Name.
            public var sort: String?
            /// Category type\
            /// Values: [Services, Materials]
            public var categoryType: String?
            /// What kind of items should be returned (only active items will be returned by default)\
            /// Values: [True, Any, False]
            public var active: String?
        }
        public func categoriesGetList(tenant: Int64, query: CategoriesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Pricebook.CategoryResponse>, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/categories"
            return await getReq(Models.PaginatedResponse<Models.Pricebook.CategoryResponse>.self, endpoint: endpoint, params: query)
        }
        public func categoriesCreate(tenant: Int64, body: Models.Pricebook.CategoryCreateRequest) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/categories"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        public func categoriesGet(id: Int64, tenant: Int64) async -> Result<Models.Pricebook.CategoryResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/categories/\(id)"
            return await getReq(Models.Pricebook.CategoryResponse.self, endpoint: endpoint)
        }
        public func categoriesUpdate(id: Int64, tenant: Int64, body: Models.Pricebook.CategoryUpdateRequest) async -> Result<Models.Pricebook.CategoryResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/categories/\(id)"
            return await bodiedReq(Models.Pricebook.CategoryResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func categoriesDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/categories/\(id)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func discountAndFeesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DiscountAndFeesGetListQuery: URLQueryConvertible {
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
            /// Available fields are: Id, Code, DisplayName, CreatedOn, ModifiedOn, Price, MemberPrice, AddOnPrice, AddOnMemberPrice, MaterialsCost, PrimaryVendor, Cost, Manufacturer, Priority.
            public var sort: String?
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
            /// Format - guid. Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided
            public var externalDataApplicationGuid: String?
            /// Allows filtering by external data key
            public var externalDataKey: String?
            /// Allows filtering by external data values
            public var externalDataValues: String?
        }
        public func discountAndFeesGetList(tenant: Int64, query: DiscountAndFeesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Pricebook.DiscountAndFeesResponse>, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/discounts-and-fees"
            return await getReq(Models.PaginatedResponse<Models.Pricebook.DiscountAndFeesResponse>.self, endpoint: endpoint, params: query)
        }
        public func discountAndFeesCreate(tenant: Int64, body: Models.Pricebook.DiscountAndFeesCreateRequest) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/discounts-and-fees"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func discountAndFeesGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct DiscountAndFeesGetQuery: URLQueryConvertible {
            /// Format - guid. Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided.
            public var externalDataApplicationGuid: String?
        }
        public func discountAndFeesGet(id: Int64, tenant: Int64, query: DiscountAndFeesGetQuery? = nil) async -> Result<Models.Pricebook.DiscountAndFeesResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/discounts-and-fees/\(id)"
            return await getReq(Models.Pricebook.DiscountAndFeesResponse.self, endpoint: endpoint, params: query)
        }
        public func discountAndFeesUpdate(id: Int64, tenant: Int64, body: Models.Pricebook.DiscountAndFeesUpdateRequest) async -> Result<Models.Pricebook.DiscountAndFeesResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/discounts-and-fees/\(id)"
            return await bodiedReq(Models.Pricebook.DiscountAndFeesResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func discountAndFeesDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/discounts-and-fees/\(id)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func equipmentGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentGetListQuery: URLQueryConvertible {
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
            /// Available fields are: Id, Code, DisplayName, CreatedOn, ModifiedOn, Price, MemberPrice, AddOnPrice, AddOnMemberPrice, MaterialsCost, PrimaryVendor, Cost, Manufacturer, Priority.
            public var sort: String?
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
            /// Format - guid. Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided
            public var externalDataApplicationGuid: String?
            /// Allows filtering by external data key
            public var externalDataKey: String?
            /// Allows filtering by external data values
            public var externalDataValues: String?
        }
        public func equipmentGetList(tenant: Int64, query: EquipmentGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Pricebook.EquipmentResponse>, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/equipment"
            return await getReq(Models.PaginatedResponse<Models.Pricebook.EquipmentResponse>.self, endpoint: endpoint, params: query)
        }
        public func equipmentCreate(tenant: Int64, body: Models.Pricebook.EquipmentCreateRequest) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/equipment"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func equipmentGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct EquipmentGetQuery: URLQueryConvertible {
            /// Format - guid. Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided.
            public var externalDataApplicationGuid: String?
        }
        public func equipmentGet(id: Int64, tenant: Int64, query: EquipmentGetQuery? = nil) async -> Result<Models.Pricebook.EquipmentResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/equipment/\(id)"
            return await getReq(Models.Pricebook.EquipmentResponse.self, endpoint: endpoint, params: query)
        }
        public func equipmentUpdate(id: Int64, tenant: Int64, body: Models.Pricebook.EquipmentUpdateRequest) async -> Result<Models.Pricebook.EquipmentResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/equipment/\(id)"
            return await bodiedReq(Models.Pricebook.EquipmentResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func equipmentDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/equipment/\(id)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func imagesGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ImagesGetQuery: URLQueryConvertible {
            /// The storage path of the pricebook image to retrieve, as returned by other pricebook API endpoints.
            /// The path is case sensitive and must begin with "Images/".
            public var path: String
        }
        public func imagesGet(tenant: Int64, query: ImagesGetQuery? = nil) async -> Result<Data, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/images"
            return await getRawReq(endpoint: endpoint, params: query)
        }
        public func imagesPost(tenant: Int64, body: Data) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/images"
            return await bodiedRawReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func materialsGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialsGetListQuery: URLQueryConvertible {
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
            /// Available fields are: Id, Code, DisplayName, CreatedOn, ModifiedOn, Price, MemberPrice, AddOnPrice, AddOnMemberPrice, MaterialsCost, PrimaryVendor, Cost, Manufacturer, Priority.
            public var sort: String?
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
            /// Format - guid. Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided
            public var externalDataApplicationGuid: String?
            /// Allows filtering by external data key
            public var externalDataKey: String?
            /// Allows filtering by external data values
            public var externalDataValues: String?
        }
        public func materialsGetList(tenant: Int64, query: MaterialsGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Pricebook.MaterialResponse>, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/materials"
            return await getReq(Models.PaginatedResponse<Models.Pricebook.MaterialResponse>.self, endpoint: endpoint, params: query)
        }
        public func materialsCreate(tenant: Int64, body: Models.Pricebook.MaterialCreateRequest) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/materials"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func materialsGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialsGetQuery: URLQueryConvertible {
            /// Format - guid. Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided.
            public var externalDataApplicationGuid: String?
        }
        public func materialsGet(id: Int64, tenant: Int64, query: MaterialsGetQuery? = nil) async -> Result<Models.Pricebook.MaterialResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/materials/\(id)"
            return await getReq(Models.Pricebook.MaterialResponse.self, endpoint: endpoint, params: query)
        }
        public func materialsUpdate(id: Int64, tenant: Int64, body: Models.Pricebook.MaterialUpdateRequest) async -> Result<Models.Pricebook.MaterialResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/materials/\(id)"
            return await bodiedReq(Models.Pricebook.MaterialResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func materialsDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/materials/\(id)"
            return await delReq(endpoint: endpoint)
        }
        /// Query Parameters for func materialsMarkupGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct MaterialsMarkupGetListQuery: URLQueryConvertible {
            /// Format - int32.
            public var page: Int32?
            /// Format - int32.
            public var pageSize: Int32?
        }
        public func materialsMarkupGetList(tenant: Int64, query: MaterialsMarkupGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Pricebook.MaterialsMarkupResponse>, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/materialsmarkup"
            return await getReq(Models.PaginatedResponse<Models.Pricebook.MaterialsMarkupResponse>.self, endpoint: endpoint, params: query)
        }
        public func materialsMarkupCreate(tenant: Int64, body: Models.Pricebook.MaterialsMarkupRequest) async -> Result<Models.Pricebook.MaterialsMarkupCreatedResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/materialsmarkup"
            return await bodiedReq(Models.Pricebook.MaterialsMarkupCreatedResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        public func materialsMarkupGet(id: Int64, tenant: Int64) async -> Result<Models.Pricebook.MaterialsMarkupResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/materialsmarkup/\(id)"
            return await getReq(Models.Pricebook.MaterialsMarkupResponse.self, endpoint: endpoint)
        }
        public func materialsMarkupUpdate(id: Int64, tenant: Int64, body: Models.Pricebook.MaterialsMarkupRequest) async -> Result<Models.Pricebook.MaterialsMarkupCreatedResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/materialsmarkup/\(id)"
            return await bodiedReq(Models.Pricebook.MaterialsMarkupCreatedResponse.self, endpoint: endpoint, body: body, method: "PUT")
        }
        public func pricebookBulkCreate(tenant: Int64, body: Models.Pricebook.PricebookBulkCreateRequest) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/pricebook"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        public func pricebookBulkUpdate(tenant: Int64, body: Models.Pricebook.PricebookBulkUpdateRequest) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/pricebook"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PATCH")
        }
        /// Query Parameters for func servicesGetList
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ServicesGetListQuery: URLQueryConvertible {
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
            /// Available fields are: Id, Code, DisplayName, CreatedOn, ModifiedOn, Price, MemberPrice, AddOnPrice, AddOnMemberPrice, MaterialsCost, PrimaryVendor, Cost, Manufacturer, Priority.
            public var sort: String?
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
            /// Format - guid. Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided
            public var externalDataApplicationGuid: String?
            /// Allows filtering by external data key
            public var externalDataKey: String?
            /// Allows filtering by external data values
            public var externalDataValues: String?
        }
        public func servicesGetList(tenant: Int64, query: ServicesGetListQuery? = nil) async -> Result<Models.PaginatedResponse<Models.Pricebook.ServiceResponse>, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/services"
            return await getReq(Models.PaginatedResponse<Models.Pricebook.ServiceResponse>.self, endpoint: endpoint, params: query)
        }
        public func servicesCreate(tenant: Int64, body: Models.Pricebook.ServiceCreateRequest) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/services"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func servicesGet
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct ServicesGetQuery: URLQueryConvertible {
            /// Format - guid. Items that are created with a specific guid, could be fetched/updated/removed
            /// only when the same application guid is provided.
            public var externalDataApplicationGuid: String?
        }
        public func servicesGet(id: Int64, tenant: Int64, query: ServicesGetQuery? = nil) async -> Result<Models.Pricebook.ServiceResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/services/\(id)"
            return await getReq(Models.Pricebook.ServiceResponse.self, endpoint: endpoint, params: query)
        }
        public func servicesUpdate(id: Int64, tenant: Int64, body: Models.Pricebook.ServiceUpdateRequest) async -> Result<Models.Pricebook.ServiceResponse, APIError> {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/services/\(id)"
            return await bodiedReq(Models.Pricebook.ServiceResponse.self, endpoint: endpoint, body: body, method: "PATCH")
        }
        public func servicesDelete(id: Int64, tenant: Int64) async -> APIError? {
            let endpoint = "/pricebook/v2/tenant/\(tenant)/services/\(id)"
            return await delReq(endpoint: endpoint)
        }
    }
}
