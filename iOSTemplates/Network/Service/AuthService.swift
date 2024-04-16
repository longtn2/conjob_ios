import Foundation
import Alamofire
enum AuthService {
    case getUserLogin(email: String, password: String)
}

extension AuthService: TargetType {
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
        case .getUserLogin:
            return "auth/login"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getUserLogin:
            return .post
        }
    }

    var parameters: Parameters? {
        switch self {
        case .getUserLogin(let email, let password):
            return ["email": email, "password": password]
        }
    }
}
