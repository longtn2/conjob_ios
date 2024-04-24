import Foundation

class JobModel: Codable {
    // MARK: - Propeties
    var data: [Job]?
    enum CodingKeys: String, CodingKey {
        case data
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent([Job].self, forKey: .data).unwrapped(or: [])
    }
}

