import Foundation

protocol CommonLogic {
    func loginHandler(withEmail email: String, pass: String)
    func registerHandler()
}

final class RegisterViewModel: CommonLogic {
    var isRegister: Bool = true
    func loginHandler(withEmail email: String, pass: String) {
        
    }
    
    func registerHandler() {
        
    }
}


