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
    func login(userId: String, password: String) -> Future<User, Error> {
        
        return Future<User, Error> { promise in
            // This closure is unexpectedly called synchronously.
            // Therefore, wrap it with DispatchQueue.global().async
            DispatchQueue.global().async {
                // Intended to network communicate
                Thread.sleep(forTimeInterval: 1.0)
                
                 if userId == "foobar@example.com" && password == "password" {
                     promise(.success(User(id: userId, name: "foobar")))
                 } else {
                     promise(.failure(AuthError.invalidIdOrPassword))
                 }
            }
        }
    }
    
    func logout() -> Future<Void, Error> {
        // This closure is unexpectedly called synchronously.
        // Therefore, wrap it with DispatchQueue.global().async
        return Future<Void, Error> { promise in
            DispatchQueue.global().async {
                promise(.success(()))
            }
        }
    }
}
