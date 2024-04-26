import Foundation

class JobModel: Codable {
    // MARK: - Propeties
    var data: [Job]?
    var responseType, message: String?
    enum CodingKeys: String, CodingKey {
        case data
        case responseType, message
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent([Job].self, forKey: .data).unwrapped(or: [])
        responseType = try container.decodeIfPresent(String.self, forKey: .responseType).unwrapped(or: "")
        message = try container.decodeIfPresent(String.self, forKey: .message).unwrapped(or: "")
    }
}

