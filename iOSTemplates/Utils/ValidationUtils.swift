import Foundation

class RegexManager {
    static let shared = RegexManager()
    func isValidatePassword(_ pass: String) -> Bool {
        let passRegEx = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,32}$"
        //^ bắt đầu nhập chuỗi
        //[A-Za-z] chuỗi chứa kí tự A-Z và a-z
        //{6,15} chuỗi có 3 - 15 kí tự
        let passPred = NSPredicate(format: "SELF MATCHES %@", passRegEx)
        return passPred.evaluate(with: pass)
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "^[A-Za-z][\\w\\-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$"
        //[A-Za-z] kí tự đầu tiên là chữ
        // [A-Z0-9a-z. : kí tự chữ, số dấu có thể xuất hiện nhiều lần
        //_+ dấu _ có thể có 1 hoặc nhiều
        // - nối
        // +@ : @ xuất hiện 1 lần
        //[A-Za-z0-9.-]kí tự chữ, số dấu có thể xuất hiện nhiều lần
        // + : nối
        // \\ : biến kí tự đặc biệt thành kí tự thường
        // .[A-Za-z]: có dấu chấm và chữ cái
        // {2,64}: email có từ 2 đến 64 kí tự
        let emailPred = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    func isValidName(_ name: String) -> Bool {
        let nameRegEx = "^[A-Za-z]{3,15}"
        //^ bắt đầu nhập chuỗi
        //[A-Za-z] chuỗi chứa kí tự A-Z và a-z
        //{6,15} chuỗi có 3 - 15 kí tự
        let namePred = NSPredicate(format: "SELF MATCHES %@", nameRegEx)
        return namePred.evaluate(with: name)
    }

    func isValidPhone(_ phone: String) -> Bool {
        let phoneRegex = "^[0-9+]{0,1}+[0-9]{9,16}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: phone)
    }
}
