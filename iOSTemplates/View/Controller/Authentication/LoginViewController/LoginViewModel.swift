import Foundation
final class LoginViewModel: CommonLogic {
    var user: User?
    func loginHandler(withEmail email: String, pass: String, completion: @escaping APICompletion<User>) {
        APIAuth.getUserLogin(withEmail: email, password: pass) { response in
            switch response {
            case .success(let user):
                if let user = user {
                    self.user = user
                    UserManage.shared.saveUserToUserDefaults(user: user)
                }
                completion(.success(nil))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    func registerHandler() {

    }
}
