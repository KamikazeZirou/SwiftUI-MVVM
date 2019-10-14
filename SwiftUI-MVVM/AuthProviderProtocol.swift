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
    case invalidUserNameOrPassword
}

protocol AuthProviderProtocol {
    func login(userName: String, password: String) -> Future<User, Error>
}
