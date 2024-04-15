import Foundation
final class LoginViewModel: CommonLogic {
    var isReister: Bool = false
    func loginHandler(withEmail email: String, pass: String) {
        let currentUser = UserDefaults.standard
        currentUser.set(["email": email, "pass": pass],
                                forKey: "currentUser")
    }
    
    func registerHandler() {
        
    }
}
