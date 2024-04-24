import Foundation
class RoleModel: Codable {
    //MARK: Propeties
    var id: Int?
    var roleName: String?
    var userRoles: [UserRoleModel]?
    var changeOn: Int?
    var createOn: String?
    var createdAt, updatedAt: String?
    var isDeleted: Bool?
    var userID, roleID: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case roleName = "role_name"
        case userRoles = "user_roles"
        case changeOn = "change_on"
        case createOn = "create_on"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case isDeleted = "is_deleted"
        case userID = "user_id"
        case roleID = "role_id"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id).unwrapped(or: 0)
        roleName = try container.decodeIfPresent(String.self, forKey: .roleName).unwrapped(or: "")
        userRoles = try container.decodeIfPresent([UserRoleModel].self, forKey: .userRoles).unwrapped(or: [])
        changeOn = try container.decodeIfPresent(Int.self, forKey: .changeOn).unwrapped(or: 0)
        createOn = try container.decodeIfPresent(String.self, forKey: .createOn).unwrapped(or: "")
        createdAt = try container.decodeIfPresent(String.self, forKey: .createdAt).unwrapped(or: "")
        updatedAt = try container.decodeIfPresent(String.self, forKey: .updatedAt).unwrapped(or: "")
        isDeleted = try container.decodeIfPresent(Bool.self, forKey: .isDeleted).unwrapped(or: false)
        userID = try container.decodeIfPresent(Int.self, forKey: .userID).unwrapped(or: 0)
        roleID = try container.decodeIfPresent(Int.self, forKey: .roleID).unwrapped(or: 0)


    }
}

