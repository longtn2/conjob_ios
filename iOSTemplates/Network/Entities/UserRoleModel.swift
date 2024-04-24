import Foundation
class UserRoleModel: Codable {
    var id, userID, roleID, changeOn: Int?
    var createOn, createdAt, updatedAt: String?
    var isDeleted: Bool?
    
    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case roleID = "role_id"
        case changeOn = "change_on"
        case createOn = "create_on"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case isDeleted = "is_deleted"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id).unwrapped(or: 0)
        userID = try container.decodeIfPresent(Int.self, forKey: .userID).unwrapped(or: 0)
        roleID = try container.decodeIfPresent(Int.self, forKey: .roleID).unwrapped(or: 0)
        changeOn = try container.decodeIfPresent(Int.self, forKey: .changeOn).unwrapped(or: 0)
        createOn = try container.decodeIfPresent(String.self, forKey: .createOn).unwrapped(or: "")
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt).unwrapped(or: "")
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt).unwrapped(or: "")
        isDeleted = try container.decodeIfPresent(Bool.self, forKey: .isDeleted).unwrapped(or: false)
    }
}

