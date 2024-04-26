import Foundation
import Alamofire
enum JobService {
    case getAllJob
}

extension JobService: TargetType {
    var baseURL: String {
        guard let baseURLStr = AppConfiguration.infoForKey(.baseURL) else { fatalError("Missing baseURL") }
        return baseURLStr / version
    }
    var version: String {
        guard let version = AppConfiguration.infoForKey(.apiVersion) else {
            fatalError("Missing version api")
        }
        return version
    }
    
    var path: String? {
        switch self {
        case .getAllJob:
            return "job/getall"
        }
    }
    var headers: HTTPHeaders? {
        switch self {
        case .getAllJob:
            return [ "Authorization": "Bearer eyJhbGciOiJodHRwOi8vd3d3LnczLm9yZy8yMDAxLzA0L3htbGRzaWctbW9yZSNobWFjLXNoYTI1NiIsInR5cCI6IkpXVCJ9.eyJodHRwOi8vc2NoZW1hcy54bWxzb2FwLm9yZy93cy8yMDA1LzA1L2lkZW50aXR5L2NsYWltcy9uYW1laWRlbnRpZmllciI6IjIxIiwiaHR0cDovL3NjaGVtYXMubWljcm9zb2Z0LmNvbS93cy8yMDA4LzA2L2lkZW50aXR5L2NsYWltcy9yb2xlIjoiSm9iIFNlZWtlciIsImV4cCI6MTcxNDEwMDg3M30.y_JzVUwpb09frZ7_pD9uxJ1yh1mRypt-ru6BvCw_KhU"]
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getAllJob:
            return .get
        }
    }
    var parameters: Parameters? {
        switch self {
        case .getAllJob:
            return [:]
        }
    }
}
