import Foundation
import Alamofire
final class APIJob {
    @discardableResult
    static func getAllJob(completionHandler: APICompletion<JobModel>?) -> Request? {
        return NetworkingController.shared.performRequest(JobService.getAllJob, for: JobModel.self) { result in
            completionHandler?(result)
        }
    }
}
