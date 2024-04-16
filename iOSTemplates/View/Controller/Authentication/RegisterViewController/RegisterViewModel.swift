import Foundation

protocol CommonLogic {
    func loginHandler(withEmail email: String, pass: String, completion: @escaping APICompletion<User>)
    func registerHandler()
}

final class RegisterViewModel: CommonLogic {
    func loginHandler(withEmail email: String, pass: String, completion: @escaping APICompletion<User>) {
        
    }
    
    var isRegister: Bool = true
    
    func registerHandler() {
        
    }
}


