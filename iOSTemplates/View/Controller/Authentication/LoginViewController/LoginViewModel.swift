import Foundation
final class LoginViewModel: CommonLogic {
    var isReister: Bool = false
    var user: User?
    func loginHandler(withEmail email: String, pass: String, completion: @escaping APICompletion<User>) {
        let _ = APIPokemon.getUserLogin(withEmail: email, password: pass ) { response in
            switch response {
            case .success(let user):
                if let user = user {
                    self.user = user
                    UserDefault.save(user.token)
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
