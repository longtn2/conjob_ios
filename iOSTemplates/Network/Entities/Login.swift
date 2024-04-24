import Foundation
class Login: Codable {
    //MARK: - Propeties
    var token, refreshToken, email, firstName: String?
    var lastName, phoneNumber, dob, address: String?
    var avatar: String?
    var roles: [RoleModel]?

    enum CodingKeys: String, CodingKey {
        case token, refreshToken, email
        case firstName = "first_name"
        case lastName = "last_name"
        case phoneNumber = "phone_number"
        case dob, address, avatar, roles
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email).unwrapped(or: "")
        token = try container.decodeIfPresent(String.self, forKey: .token).unwrapped(or: "")
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken).unwrapped(or: "")
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName).unwrapped(or: "")
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName).unwrapped(or: "")
        phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber).unwrapped(or: "")
        dob = try container.decodeIfPresent(String.self, forKey: .dob).unwrapped(or: "")
        avatar = try container.decodeIfPresent(String.self, forKey: .avatar).unwrapped(or: "")
        address = try container.decodeIfPresent(String.self, forKey: .address).unwrapped(or: "")
        roles = try container.decodeIfPresent([RoleModel].self, forKey: .roles).unwrapped(or: [])
    }
}
