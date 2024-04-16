import Foundation
final class User: Decodable {

    // MARK: - Properties
    var email: String
    var password: String
    var firstName: String
    var lastName: String
    var phoneNumber: String
    var dob: String
    var address: String
    var avatar: String
    var token: String
    var refreshToken: String
    var roles: [Role]

    enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
        case token = "token"
        case refreshToken = "refreshToken"
        case firstName = "firstName"
        case lastName = "lastName"
        case phoneNumber = "phoneNumber"
        case dob = "dob"
        case address = "address"
        case avatar = "avatar"
        case roles = "roles"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email).unwrapped(or: "")
        password = try container.decodeIfPresent(String.self, forKey: .password).unwrapped(or: "")
        token = try container.decodeIfPresent(String.self, forKey: .token).unwrapped(or: "")
        refreshToken = try container.decodeIfPresent(String.self, forKey: .refreshToken).unwrapped(or: "")
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName).unwrapped(or: "")
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName).unwrapped(or: "")
        phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber).unwrapped(or: "")
        dob = try container.decodeIfPresent(String.self, forKey: .dob).unwrapped(or: "")
        avatar = try container.decodeIfPresent(String.self, forKey: .avatar).unwrapped(or: "")
        address = try container.decodeIfPresent(String.self, forKey: .address).unwrapped(or: "")
        roles = try container.decodeIfPresent([Role].self, forKey: .roles).unwrapped(or: [])
    }

}

final class Role: Decodable {
    //MARK: Propeties
    var id: String
    var roleName: String
    var roleDescription: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case roleName = "roleName"
        case roleDescription = "roleDescription"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(String.self, forKey: .id).unwrapped(or: "")
        roleName = try container.decodeIfPresent(String.self, forKey: .roleName).unwrapped(or: "")
        roleDescription = try container.decodeIfPresent(String.self, forKey: .roleDescription).unwrapped(or: "")
    }
}

