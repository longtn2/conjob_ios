import Foundation
import Alamofire

enum PokemonService {
    case listPokemons(limit: Int, offset: Int)
}

extension PokemonService: TargetType {

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
        }
    }

    var method: HTTPMethod {
        switch self {
        case .listPokemons:
            return .get
        }
    }

    var parameters: Parameters? {
        switch self {
        case .listPokemons(let limit, let offset):
            return ["limit": limit, "offset": offset]
        }
    }
}
