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
            Thread.sleep(forTimeInterval: 1.0)
            promise(.success(User(name: userName)))
        }
    }
}
