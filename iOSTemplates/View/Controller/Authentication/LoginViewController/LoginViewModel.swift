//
//  LoginViewModel.swift
//  iOSTemplates
//
//  Created by Admin on 10/04/2024.
//  Copyright © 2024 Monstar Lab VietNam Co., Ltd. All rights reserved.
//

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
