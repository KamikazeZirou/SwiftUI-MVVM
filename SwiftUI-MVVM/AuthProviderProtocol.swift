//
//  AuthProviderProtocol.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import Combine

enum AuthError: Error {
    case invalidIdOrPassword
}

protocol AuthProviderProtocol {
    func login(userId: String, password: String) -> Future<User, Error>
    func logout() -> Future<Void, Error>
}
