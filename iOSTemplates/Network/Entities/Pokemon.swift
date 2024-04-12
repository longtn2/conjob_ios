import Foundation

final class Pokemon: Decodable {

    // MARK: - Properties
    var name: String
    var detailURL: String

    enum CodingKeys: String, CodingKey {
        case name
        case detailURL = "url"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decodeIfPresent(String.self, forKey: .name).unwrapped(or: "")
        detailURL = try container.decodeIfPresent(String.self, forKey: .detailURL).unwrapped(or: "")
    }
}

final class PokemonList: Decodable {

    // MARK: - Properties
    var sum: Int
    var nextURL: String
    var results: [Pokemon]

    enum CodingKeys: String, CodingKey {
        case sum = "count"
        case nextURL = "next"
        case results
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        sum = try container.decodeIfPresent(Int.self, forKey: .sum).unwrapped(or: 0)
        nextURL = try container.decodeIfPresent(String.self, forKey: .nextURL).unwrapped(or: "")
        results = try container.decodeIfPresent([Pokemon].self, forKey: .results).unwrapped(or: [])
    }
}
