import Foundation

protocol CommonLogic {
    func loginHandler(withEmail email: String, pass: String, completion: @escaping APICompletion<User>)
    func registerHandler(with user: UserRegister, completion: @escaping APICompletion<UserRegister>)
}

final class RegisterViewModel: CommonLogic {
    //MARK: - Propeties
    var isFirst: Bool = false
    var isLast: Bool = false
    var isPhone: Bool = false
    var isDate: Bool = false
    var isAddress: Bool = false
    var isEmail: Bool = false
    var isPass: Bool = false
    
    //MARK: - Functions
    func enableButton() -> Bool {
       return (isFirst && isLast && isPhone && isDate && isAddress && isEmail && isPass)
    }
    
    func loginHandler(withEmail email: String, pass: String, completion: @escaping APICompletion<User>) {
        
    }
    
    func registerHandler(with user: UserRegister, completion: @escaping APICompletion<UserRegister>) {
        APIAuth.userRegister(user: user) {  response in
            switch response {
            case .success(let user):
                completion(.success(user))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


