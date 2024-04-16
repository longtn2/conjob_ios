import Foundation
class Role: Decodable {
    //MARK: Propeties
    var id: String?
    var roleName: String?
    var roleDescription: String?

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

