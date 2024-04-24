import Foundation

protocol CommonLogic {
    func loginHandler(withEmail email: String, pass: String, completion: @escaping APICompletion<LoginModel>)
    func registerHandler(with user: Register, completion: @escaping APICompletion<RegisterModel>)
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
    var regis: RegisterModel?
    //MARK: - Functions
    func enableButton() -> Bool {
       return (isFirst && isLast && isPhone && isDate && isAddress && isEmail && isPass)
    }
    
    func loginHandler(withEmail email: String, pass: String, completion: @escaping APICompletion<LoginModel>) {
        
    }
    
    func registerHandler(with user: Register, completion: @escaping APICompletion<RegisterModel>) {
        APIAuth.userRegister(user: user) {  response in
            switch response {
            case .success(let result):
                self.regis = result
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}


