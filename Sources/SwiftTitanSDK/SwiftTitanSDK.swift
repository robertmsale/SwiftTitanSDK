//
//  SwiftTitanSDK.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 1/29/25.
//
import Foundation

public class SwiftTitanSDK {
    // MARK: Internal State Objects
    let auth = AuthManager()
    let session: URLSession
    let encoder: JSONEncoder = {
        let e = JSONEncoder()
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        e.dateEncodingStrategy = .formatted(RFC3339DateFormatter)
        return e
    }()
    let decoder: JSONDecoder = {
        let d = JSONDecoder()
        let RFC3339DateFormatter = DateFormatter()
        RFC3339DateFormatter.locale = Locale(identifier: "en_US_POSIX")
        RFC3339DateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        RFC3339DateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        d.dateDecodingStrategy = .formatted(RFC3339DateFormatter)
        return d
    }()
    let requestBuilder: () -> URLRequest
    
    // MARK: ServiceTitan API Data
    let tenant: Int64
    let appKey: String
    let clientId: String
    let clientSecret: String
    private var integrationMode: Bool = false
    var host: String {
        if integrationMode {
            return "api-integration.servicetitan.io"
        }
        return "api.servicetitan.io"
    }
    
    // MARK: API Endpoint Objects
    private lazy var _accounting: APIs.Accounting! = {
        return APIs.Accounting(self)
    }()
    public var accounting: APIs.Accounting { _accounting }
    
    private lazy var _crm: APIs.Crm! = {
        return APIs.Crm(self)
    }()
    public var crm: APIs.Crm { _crm }
    
    private lazy var _customerInteractions: APIs.CustomerInteractions! = {
        return APIs.CustomerInteractions(self)
    }()
    public var customerInteractions: APIs.CustomerInteractions { _customerInteractions }
    
    private lazy var _dispatch: APIs.Dispatch! = {
        return APIs.Dispatch(self)
    }()
    public var dispatch: APIs.Dispatch { _dispatch }
    
    private lazy var _equipmentSystems: APIs.EquipmentSystems! = {
        return APIs.EquipmentSystems(self)
    }()
    public var equipmentSystems: APIs.EquipmentSystems { _equipmentSystems }
    
    private lazy var _forms: APIs.Forms! = {
        return APIs.Forms(self)
    }()
    public var forms: APIs.Forms { _forms }
    
    private lazy var _inventory: APIs.Inventory! = {
        return APIs.Inventory(self)
    }()
    public var inventory: APIs.Inventory { _inventory }
    
    private lazy var _jobBooking: APIs.JobBooking! = {
        return APIs.JobBooking(self)
    }()
    public var jobBooking: APIs.JobBooking { _jobBooking }
    
    private lazy var _jobPlanning: APIs.JobPlanningAndManagement! = {
        return APIs.JobPlanningAndManagement(self)
    }()
    public var jobPlanning: APIs.JobPlanningAndManagement { _jobPlanning }
    
    private lazy var _marketing: APIs.Marketing! = {
        return APIs.Marketing(self)
    }()
    public var marketing: APIs.Marketing { _marketing }
    
    private lazy var _marketingAds: APIs.MarketingAds! = {
        return APIs.MarketingAds(self)
    }()
    public var marketingAds: APIs.MarketingAds { _marketingAds }
    
    private lazy var _memberships: APIs.Memberships! = {
        return APIs.Memberships(self)
    }()
    public var memberships: APIs.Memberships { _memberships }
    
    private lazy var _payroll: APIs.Payroll! = {
        return APIs.Payroll(self)
    }()
    public var payroll: APIs.Payroll { _payroll}
    
    private lazy var _pricebook: APIs.Pricebook! = {
        return APIs.Pricebook(self)
    }()
    public var pricebook: APIs.Pricebook { _pricebook }
    
//    private lazy var _reporting: APIs.Reporting! = {
//        return APIs.Reporting(self)
//    }()
//    public var reporting: APIs.Reporting { _reporting }
    
    private lazy var _salesEstimates: APIs.SalesEstimates! = {
        return APIs.SalesEstimates(self)
    }()
    public var salesEstimates: APIs.SalesEstimates { _salesEstimates }
    
    private lazy var _schedulingPro: APIs.SchedulingPro! = {
        return APIs.SchedulingPro(self)
    }()
    public var schedulingPro: APIs.SchedulingPro { _schedulingPro }
    
    private lazy var _serviceAgreements: APIs.ServiceAgreements! = {
        return APIs.ServiceAgreements(self)
    }()
    public var serviceAgreements: APIs.ServiceAgreements { _serviceAgreements }
    
    private lazy var _settings: APIs.Settings! = {
        return APIs.Settings(self)
    }()
    public var settings: APIs.Settings { _settings }
    
    private lazy var _taskManagement: APIs.TaskManagement! = {
        return APIs.TaskManagement(self)
    }()
    public var taskManagement: APIs.TaskManagement { _taskManagement }
    
    private lazy var _telecom: APIs.Telecom! = {
        return APIs.Telecom(self)
    }()
    public var telecom: APIs.Telecom { _telecom }
    
    // MARK: Initialization
    public init(appKey: String, tenant: Int64, clientId: String, clientSecret: String, requestBuilder: @escaping () -> URLRequest) {
        self.appKey = appKey
        self.tenant = tenant
        self.clientId = clientId
        self.clientSecret = clientSecret
        session = URLSession(configuration: .default)
        session.configuration.httpAdditionalHeaders = [
            "Content-Type": "application/json"
        ]
        self.requestBuilder = requestBuilder
    }
    
    public func getAuthToken() async -> String? {
        return await auth.getAuthToken(clientId: clientId, clientSecret: clientSecret)
    }
    
    public func setIntegrationMode(to: Bool) async {
        self.integrationMode = to
        await auth.setIntegrationMode(to: to)
    }
    public func getIntegrationMode() async -> Bool {
        return integrationMode
    }
}
