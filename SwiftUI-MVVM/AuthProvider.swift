//
//  AuthProvider.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import Combine

final class AuthProvider: AuthProviderProtocol {
    func login(userName: String, password: String) -> Future<User, Error> {
        return Future<User, Error> { promise in
            if userName == "foobar@example.com" && password == "password" {
                promise(.success(User(id: 1, name: userName)))
            } else {
                promise(.failure(AuthError.invalidUserNameOrPassword))
            }
        }
    }
    
    func logout() -> Future<Void, Error> {
        return Future<Void, Error> { promise in
            promise(.success(()))
        }
    }
}
