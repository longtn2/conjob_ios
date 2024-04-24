import Foundation
import Alamofire
enum AuthService {
    case getUserLogin(email: String, password: String)
    case userRegister(user: Register)
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
        case .userRegister:
            return "auth/register"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .getUserLogin:
            return .post
        case .userRegister:
            return .post
        }
    }

    var parameters: Parameters? {
        switch self {
        case .getUserLogin(let email, let password):
            return ["email": email, "password": password]
        case .userRegister(let user):
            return ["email": user.email ?? "",
                    "password": user.password ?? "",
                    "first_name": user.firstName ?? "",
                    "last_name": user.lastName ?? "",
                    "phone_number": user.phoneNumber ?? "",
                    "gender": user.gender ?? "",
                    "dob": user.dob ?? "",
                    "address": user.address ?? "",
                    "avatar": user.avatar ?? ""
                ]
        }
    }
}
