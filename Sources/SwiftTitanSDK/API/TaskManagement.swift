//
//  TaskManagement.swift
//  SwiftTitanSDK
//
//  Created by Robert Sale on 2/11/25.
//

import Foundation
public extension Models {
    struct TaskManagement {
        
        public struct ClientSideDataResponse: Codable {
            
            public var employees: ClientSideEmployeeResponse
            
            public var businessUnits: ClientSideBusinessUnitResponse
            
            public var taskPriorities: ClientSideTaskPriorityResponse
            
            public var taskResolutionTypes: ClientSideTaskResolutionTypeResponse
            
            public var taskStatuses: ClientSideTaskStatusResponse
            
            public var taskTypes: ClientSideTaskTypeResponse
            
            public var taskSources: ClientSideTaskSourceResponse
            
            public var taskResolutions: ClientSideTaskResolutionResponse
        }
        
        public struct ClientSideEmployeeResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var active: Bool
        }
        
        public struct ClientSideBusinessUnitResponse: Codable {
            
            public var name: String
            
            public var value: Int64
        }
        
        public struct ClientSideTaskPriorityResponse: Codable {
            
            public var name: String
        }
        
        public struct ClientSideTaskResolutionTypeResponse: Codable {
            
            public var name: String
        }
        
        public struct ClientSideTaskStatusResponse: Codable {
            
            public var name: String
        }
        
        public struct ClientSideTaskTypeResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var active: Bool
            
            public var excludedTaskResolutionIds: Int64
        }
        
        public struct ClientSideTaskSourceResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var active: Bool
        }
        
        public struct ClientSideTaskResolutionResponse: Codable, Identifiable {
            
            public var id: Int64
            
            public var name: String
            
            public var type: TaskResolutionType
            
            public var active: Bool
            
            public var excludedTaskTypeIds: Int64
        }
        public enum TaskResolutionType: String, CaseIterable, Identifiable, Codable {
            case Custom, Refund
            public var id: String { rawValue }
        }
        
        public struct TaskGetResponse: Codable, Identifiable {
            
            public var reportedById: Int64
            
            public var assignedToId: Int64
            
            public var active: Bool
            
            public var isClosed: Bool
            
            public var closedOn: Date?
            
            public var name: String?
            
            public var businessUnitId: Int64
            
            public var employeeTaskTypeId: Int64
            
            public var employeeTaskSourceId: Int64
            
            public var employeeTaskResolutionId: Int64
            
            public var reportedOn: Date
            
            public var completeBy: Date?
            
            public var involvedEmployeeIdList: Int64?
            
            public var customerId: Int64?
            
            public var jobId: Int64?
            
            public var projectId: Int64?
            
            public var description: String?
            
            public var priority: String?
            
            public var id: Int64
            
            public var taskNumber: Int64
            
            public var customerName: String?
            
            public var jobNumber: String?
            
            public var refundIssued: Double?
            
            public var descriptionModifiedOn: Date?
            
            public var descriptionModifiedById: Int64?
            
            public var createdOn: Date
            
            public var modifiedOn: Date?
            
            public var comments: TaskComment?
            
            public var attachments: TaskAttachmentGroup?
            
            public var subTasksData: SubTasksInfo?
        }
        
        public struct TaskComment: Codable {
            
            public var employeeId: Int64
            
            public var comment: String
            
            public var createdOn: Date
        }
        
        public struct TaskAttachmentGroup: Codable {
            
            public var createdOn: Date
            
            public var createdBy: Int64
            
            public var count: Int64
            
            public var files: TaskAttachment
        }
        
        public struct TaskAttachment: Codable {
            
            public var url: String
            
            public var filename: String
        }
        
        public struct SubTasksInfo: Codable {
            
            public var count: Int32
            
            public var subTasks: SubTaskGet
        }
        
        public struct SubTaskGet: Codable {
            
            public var assignedToId: Int64?
            
            public var reportedById: Int64?
            
            public var active: Bool
            
            public var isClosed: Bool
            
            public var closedOn: Date?
            
            public var name: String
            
            public var createdOn: Date
            
            public var dueDateTime: Date?
            
            public var subtaskNumber: Int64
            
            public var isViewed: Bool
            
            public var assignedDateTime: Date
            
            public var comments: TaskComment
        }
        public enum ActiveRequestArg: String, CaseIterable, Identifiable, Codable {
            case True, any="Any", False
            public var id: String { rawValue }
        }
        
        public struct TaskCreateResponse: Codable, Identifiable {
            
            public var reportedById: Int64
            
            public var assignedToId: Int64
            
            public var isClosed: Bool
            
            public var name: String
            
            public var businessUnitId: Int64
            
            public var employeeTaskTypeId: Int64
            
            public var employeeTaskSourceId: Int64
            
            public var employeeTaskResolutionId: Int64?
            
            public var reportedDate: Date
            
            public var completeBy: Date?
            
            public var involvedEmployeeIdList: Int64?
            
            public var customerId: Int64?
            
            public var jobId: Int64?
            
            public var projectId: Int64?
            
            public var description: String?
            
            public var priority: TaskPriority
            
            public var id: Int64
            
            public var taskNumber: Int64
            
            public var customerName: String?
            
            public var jobNumber: String?
            
            public var refundIssued: Double?
            
            public var descriptionModifiedOn: Date?
            
            public var descriptionModifiedBy: String?
            
            public var createdOn: Date
            
            public var modifiedOn: Date
        }
        public enum TaskPriority: String, CaseIterable, Identifiable, Codable {
            case Low, Normal, High, Urgent
            public var id: String { rawValue }
        }
        
        public struct TaskCreateRequest: Codable {
            
            public var reportedById: Int64
            
            public var assignedToId: Int64
            
            public var isClosed: Bool
            
            public var name: String
            
            public var businessUnitId: Int64
            
            public var employeeTaskTypeId: Int64
            
            public var employeeTaskSourceId: Int64
            
            public var employeeTaskResolutionId: Int64?
            
            public var reportedDate: Date
            
            public var completeBy: Date?
            
            public var involvedEmployeeIdList: Int64?
            
            public var customerId: Int64?
            
            public var jobId: Int64?
            
            public var projectId: Int64?
            
            public var description: String?
            
            public var priority: TaskPriority
        }
        
        public struct SubtaskCreateResponse: Codable {
            
            public var isClosed: Bool
            
            public var name: String
            
            public var assignedToId: Int64
            
            public var dueDateTime: Date?
            
            public var parentTaskId: Int64
            
            public var subtaskNumber: String
            
            public var isViewed: Bool
            
            public var assignedDateTime: Date
            
            public var createdOn: Date
        }
        
        public struct SubtaskCreateRequest: Codable {
            
            public var isClosed: Bool
            
            public var name: String
            
            public var assignedToId: Int64
            
            public var dueDateTime: Date?
        }
    }
}
public extension APIs {
    class TaskManagement: APIBase {
        init(_ sdk: SwiftTitanSDK) {
            super.init(sdk, apiName: "taskmanagement")
        }
        public func clientSideDataGet(tenant: Int64) async -> Result<Models.TaskManagement.ClientSideDataResponse, APIError> {
            let endpoint = "/taskmanagement/v2/tenant/\(tenant)/data"
            return await getReq(Models.TaskManagement.ClientSideDataResponse.self, endpoint: endpoint)
        }
        /// Query Parameters for func tasksGetTasks
        public struct TasksGetTasksQuery: URLQueryConvertible {
            /// Format - int32. The logical number of page to return, starting from 1
            public var page: Int32?
            /// Format - int32. How many records to return (50 by default)
            public var pageSize: Int32?
            /// Whether total count should be returned
            public var includeTotal: Bool?
            /// Values: [True, Any, False]
            public var active: String?
            /// Format - date-time (as date-time in RFC3339). Created date before
            public var createdBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Created date on or after
            public var createdOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Modified date before
            public var modifiedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Modified date on or after
            public var modifiedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Reported date before
            public var reportedBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Reported On or After
            public var reportedOnOrAfter: Date?
            /// Format - date-time (as date-time in RFC3339). Completed Before
            public var completeBefore: Date?
            /// Format - date-time (as date-time in RFC3339). Completed On or After
            public var completeOnOrAfter: Date?
            /// Is Closed
            public var isClosed: Bool?
            /// Task Ids (comma separated Ids)
            public var ids: String?
            /// Name
            public var name: String?
            /// Include Subtasks
            public var includeSubtasks: Bool?
            /// Business Unit Ids (comma separated Ids)
            public var businessUnitIds: String?
            /// EmployeeTaskType Ids (comma separated Ids)
            public var employeeTaskTypeIds: String?
            /// EmployeeTaskSource Ids (comma separated Ids)
            public var employeeTaskSourceIds: String?
            /// EmployeeTaskResolution Ids (comma separated Ids)
            public var employeeTaskResolutionIds: String?
            /// Format - int64. Reported By Id
            public var reportedById: Int64?
            /// Format - int64. Assigned to Id
            public var assignedToId: Int64?
            /// Involved Employee Ids (comma separated Ids)
            public var involvedEmployeeIdList: String?
            /// Format - int64. Customer Id
            public var customerId: Int64?
            /// Format - int64. Job Id
            public var jobId: Int64?
            /// Format - int64. Project Id
            public var projectId: Int64?
            /// Priorities (comma separated values)
            public var priorities: String?
            /// Format - int64. Task Number
            public var taskNumber: Int64?
            /// Job Number
            public var jobNumber: String?
            /// Applies sorting by the specified field:\
            /// "?sort=+FieldName" for ascending order,\
            /// "?sort=-FieldName" for descending order.\
            /// \
            /// Available fields are: Id, CreatedOn, ModifiedOn, CompletedBy, Priority
            public var sort: String?
        }
        public func tasksGetTasks(tenant: Int64, query: TasksGetTasksQuery? = nil) async -> Result<Models.PaginatedResponse<Models.TaskManagement.TaskGetResponse>, APIError> {
            let endpoint = "/taskmanagement/v2/tenant/\(tenant)/tasks"
            return await getReq(Models.PaginatedResponse<Models.TaskManagement.TaskGetResponse>.self, endpoint: endpoint, params: query)
        }
        public func tasksCreate(tenant: Int64, body: Models.TaskManagement.TaskCreateRequest) async -> Result<Models.TaskManagement.TaskCreateResponse, APIError> {
            let endpoint = "/taskmanagement/v2/tenant/\(tenant)/tasks"
            return await bodiedReq(Models.TaskManagement.TaskCreateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
        /// Query Parameters for func tasksGetTask
        public struct TasksGetTaskQuery: URLQueryConvertible {
            public var includeSubtasks: Bool?
        }
        public func tasksGetTask(id: Int64, tenant: Int64, query: TasksGetTaskQuery? = nil) async -> Result<Models.TaskManagement.TaskGetResponse, APIError> {
            let endpoint = "/taskmanagement/v2/tenant/\(tenant)/tasks/\(id)"
            return await getReq(Models.TaskManagement.TaskGetResponse.self, endpoint: endpoint, params: query)
        }
        public func tasksCreateSubtask(id: Int64, tenant: Int64, body: Models.TaskManagement.SubtaskCreateRequest) async -> Result<Models.TaskManagement.SubtaskCreateResponse, APIError> {
            let endpoint = "/taskmanagement/v2/tenant/\(tenant)/tasks/\(id)/subtasks"
            return await bodiedReq(Models.TaskManagement.SubtaskCreateResponse.self, endpoint: endpoint, body: body, method: "POST")
        }
    }
}
