//
//  LoginModel.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import Combine

final class LoginModel: LoginModelProtocol {
    func login(userName: String, password: String) -> Future<User, Error> {
        return Future<User, Error> { [weak self] promise in
            if userName == "foobar@example.com" && password == "password" {
                promise(.success(User(name: userName)))
            } else {
                promise(.failure(LoginError.invalidUserNameOrPassword))
            }
        }
    }
}
