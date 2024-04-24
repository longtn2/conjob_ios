import Alamofire
final class APIAuth {

    @discardableResult
    static func getUserLogin(withEmail email: String, password: String, completionHandler: APICompletion<LoginModel>?) -> Request? {
        return NetworkingController.shared.performRequest(AuthService.getUserLogin(email: email, password: password), for: LoginModel.self) { result in
            completionHandler?(result)
        }
    }
    @discardableResult
    static func userRegister(user: Register, completionHandler: APICompletion<RegisterModel>?) -> Request? {
        return NetworkingController.shared.performRequest(AuthService.userRegister(user: user), for: RegisterModel.self) { result in
            completionHandler?(result)
        }
    }
}
