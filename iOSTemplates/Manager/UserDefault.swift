import Foundation
struct DefaultsKeys {
    static let token = "token"
}
struct UserDefault {
    
    static let tokenKey = DefaultsKeys.token
    private static let userDefault = UserDefaults.standard
    
    struct UserLogin {
        let token: String
        init(_ json: [String: String]) {
            self.token = json[tokenKey] ?? ""
        }
    }
    
    static func save(_ token: String){
        userDefault.set([tokenKey: token],
                        forKey: tokenKey)
    }
    
    static func getToken()-> UserLogin {
        return UserLogin((userDefault.value(forKey: tokenKey) as? [String: String]) ?? [:])
    }
    
    static func clearUserData(){
        userDefault.removeObject(forKey: tokenKey)
    }
}
