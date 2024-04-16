import Alamofire
final class APIAuth {

    @discardableResult
    static func getUserLogin(withEmail email: String, password: String, completionHandler: APICompletion<User>?) -> Request? {
        return NetworkingController.shared.performRequest(AuthService.getUserLogin(email: email, password: password), for: User.self) { result in
            completionHandler?(result)
        }
    }
}
