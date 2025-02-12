//
//  CustomerInteractions.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
import MemberwiseInit
public extension Models {
    struct CustomerInteractions {
        
        @MemberwiseInit(.public, _optionalsDefaultNil: true) public struct CreateOrUpdateTechnicianAssessmentRequest: Codable {
            /// Rating (0-10)
            public var value: Double
        }
    }
}
public extension APIs {
    class CustomerInteractions: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "customer-interactions")
        }
        public func technicianRatingUpdate(technicianId: Int64, jobId: Int64, tenant: Int64, body: Models.CustomerInteractions.CreateOrUpdateTechnicianAssessmentRequest) async -> APIError? {
            let endpoint = "/customer-interactions/v2/tenant/\(tenant)/technician-rating/technician/\(technicianId)/job/\(jobId)"
            return await bodiedReqNoResponse(endpoint: endpoint, body: body, method: "PUT")
        }
    }
}
