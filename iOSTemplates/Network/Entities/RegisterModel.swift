import Foundation

class RegisterModel: Codable {
    //MARK: Propeties
    var message: String?
    var statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case message
        case statusCode = "status_code"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        message = try container.decodeIfPresent(String.self, forKey: .message).unwrapped(or: "")
        statusCode = try container.decodeIfPresent(Int.self, forKey: .statusCode).unwrapped(or: 0)
    }
}
