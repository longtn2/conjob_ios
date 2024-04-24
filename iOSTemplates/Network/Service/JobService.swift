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
            return "job/getAll"
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
