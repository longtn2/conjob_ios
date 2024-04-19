import Foundation
struct DefaultsKeys {
    static let currentUser = "currentUser"
}

class UserManager {
    static let shared = UserManager()
    func saveUserToUserDefaults(user: User?) {
            do {
                let encodedData = try JSONEncoder().encode(user)
                UserDefaults.standard.set(encodedData, forKey: DefaultsKeys.currentUser)
            } catch {
                print("Error encoding Good: \(error.localizedDescription)")
            }
        }
    
    func getUserFromUserDefaults() -> User? {
            if let savedData = UserDefaults.standard.data(forKey: DefaultsKeys.currentUser) {
                do {
                    let decodedGood = try JSONDecoder().decode(User.self, from: savedData)
                    return decodedGood
                } catch {
                    print("Error decoding Good: \(error.localizedDescription)")
                    return nil
                }
            }
            return nil
        }
    func clearUserManager() {
            UserDefaults.standard.removeObject(forKey: DefaultsKeys.currentUser)
        }
}
