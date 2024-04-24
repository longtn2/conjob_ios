import Foundation
final class MatchingViewModel {
    var jobs: [Job] = []
    
    func viewModelForMatching(at index: Int) -> Job {
        return jobs[index]
    }
    
    func removeJob(at index: Int) {
        jobs.remove(at: index)
    }
    
    func getListJob(completion: @escaping APICompletion<JobModel>) {
        APIJob.getAllJob { response in
            switch response {
            case .success(let jobModel):
                if let jobs = jobModel?.data {
                    self.jobs = jobs
                }
                completion(.success(jobModel))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
