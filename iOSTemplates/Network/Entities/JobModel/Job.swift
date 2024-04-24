import Foundation

class Job: Codable {
    // MARK: - Propeties
    var id: Int?
    var title, description: String?
    var budget: Int?
    var jobType, location, expiredDay: String?
    var quanlity: Int?
    var status: String?
    var posts: [PostModel]?

    enum CodingKeys: String, CodingKey {
        case id, title, description, budget
        case jobType = "job_type"
        case location
        case expiredDay = "expired_day"
        case quanlity, status, posts
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(Int.self, forKey: .id).unwrapped(or: 0)
        title = try container.decodeIfPresent(String.self, forKey: .title).unwrapped(or: "")
        description = try container.decodeIfPresent(String.self, forKey: .description).unwrapped(or: "")
        budget = try container.decodeIfPresent(Int.self, forKey: .budget).unwrapped(or: 0)
        jobType = try container.decodeIfPresent(String.self, forKey: .jobType).unwrapped(or: "")
        location = try container.decodeIfPresent(String.self, forKey: .location).unwrapped(or: "")
        expiredDay = try container.decodeIfPresent(String.self, forKey: .expiredDay).unwrapped(or: "")
        quanlity = try container.decodeIfPresent(Int.self, forKey: .quanlity).unwrapped(or: 0)
        status = try container.decodeIfPresent(String.self, forKey: .status).unwrapped(or: "")
        posts = try container.decodeIfPresent([PostModel].self, forKey: .posts).unwrapped(or: [])

    }
}

