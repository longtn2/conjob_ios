import Foundation
import Alamofire

enum APIService {
    case listPokemons(limit: Int, offset: Int)
    case getPostList(limit: Int, offset: Int)
}

extension APIService: TargetType {

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
        case .listPokemons:
            return "pokemon"
        case .getPostList:
            return "postList"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .listPokemons:
            return .get
        case .getPostList:
            return .get
        }
    }

    var parameters: Parameters? {
        switch self {
        case .listPokemons(let limit, let offset):
            return ["limit": limit, "offset": offset]
        case .getPostList(let limit, let offset):
            return ["limit": limit, "offset": offset]
        }
    }
}
