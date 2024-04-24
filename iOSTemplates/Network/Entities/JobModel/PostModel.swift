import Foundation

class PostModel: Codable {
    // MARK: - Propeties
    var title, caption, author, typeFile: String?
    var nameFile: String?
    var urlFile: String?

    enum CodingKeys: String, CodingKey {
        case title, caption, author
        case typeFile = "type_file"
        case nameFile = "name_file"
        case urlFile = "url_file"
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        title = try container.decodeIfPresent(String.self, forKey: .title).unwrapped(or: "")
        caption = try container.decodeIfPresent(String.self, forKey: .caption).unwrapped(or: "")
        author = try container.decodeIfPresent(String.self, forKey: .author).unwrapped(or: "")
        typeFile = try container.decodeIfPresent(String.self, forKey: .typeFile).unwrapped(or: "")
        nameFile = try container.decodeIfPresent(String.self, forKey: .nameFile).unwrapped(or: "")
        urlFile = try container.decodeIfPresent(String.self, forKey: .urlFile).unwrapped(or: "")
    }
}
