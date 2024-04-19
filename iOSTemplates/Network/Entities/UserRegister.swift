import Foundation

class Error: Codable {
    var message: String
}

class UserRegister: Error {
    var password, firstName, lastName, email: String?
    var phoneNumber, gender, dob, address: String?
    var avatar: String?
    
    enum CodingKeys: String, CodingKey {
        case password
        case firstName = "first_name"
        case lastName = "last_name"
        case email
        case phoneNumber = "phone_number"
        case gender, dob, address, avatar
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        email = try container.decodeIfPresent(String.self, forKey: .email).unwrapped(or: "")
        password = try container.decodeIfPresent(String.self, forKey: .password).unwrapped(or: "")
        firstName = try container.decodeIfPresent(String.self, forKey: .firstName).unwrapped(or: "")
        lastName = try container.decodeIfPresent(String.self, forKey: .lastName).unwrapped(or: "")
        phoneNumber = try container.decodeIfPresent(String.self, forKey: .phoneNumber).unwrapped(or: "")
        dob = try container.decodeIfPresent(String.self, forKey: .dob).unwrapped(or: "")
        avatar = try container.decodeIfPresent(String.self, forKey: .avatar).unwrapped(or: "")
        address = try container.decodeIfPresent(String.self, forKey: .address).unwrapped(or: "")
        gender = try container.decodeIfPresent(String.self, forKey: .gender).unwrapped(or: "")
    }
    init(password: String?, firstName: String?, lastName: String?, email: String?, phoneNumber: String?, gender: String?, dob: String?, address: String?, avatar: String?) {
            self.password = password
            self.firstName = firstName
            self.lastName = lastName
            self.email = email
            self.phoneNumber = phoneNumber
            self.gender = gender
            self.dob = dob
            self.address = address
            self.avatar = avatar
        }
}
