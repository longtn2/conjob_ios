import Foundation
class Role: Codable {
    //MARK: Propeties
    var id: Int
    var roleName: String?
    var roleDescription: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case roleName = "roleName"
        case roleDescription = "roleDescription"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id).unwrapped(or: 0)
        roleName = try container.decodeIfPresent(String.self, forKey: .roleName).unwrapped(or: "")
        roleDescription = try container.decodeIfPresent(String.self, forKey: .roleDescription).unwrapped(or: "")
    }
}

