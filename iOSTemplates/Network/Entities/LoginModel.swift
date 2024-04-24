import Foundation

class LoginModel: Codable {
    //MARK: Propeties
    var data: Login?
    var statusCode: Int?
    
    enum CodingKeys: String, CodingKey {
        case data
        case statusCode = "status_code"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        data = try container.decodeIfPresent(Login.self, forKey: .data).unwrapped(or: Login(from: decoder))
        statusCode = try container.decodeIfPresent(Int.self, forKey: .statusCode).unwrapped(or: 0)
    }
}
