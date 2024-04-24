import Foundation
class Register: Codable {
    //MARK: - Propeties
    var password, firstName, lastName, email: String?
    var phoneNumber, gender, dob, address: String?
    var avatar: String?

    init(password: String?, firstName: String?, lastName: String?, email: String?, phoneNumber: String?, gender: String?, dob: String?, address: String?, avatar: String?) {
        self.password = password
        self.firstName = firstName
        self.lastName = lastName
        self.email = email
        self.phoneNumber = phoneNumber
        self.gender = gender
        self.dob = dob
        self.address = address
        self.avatar = avatar
    }
}
