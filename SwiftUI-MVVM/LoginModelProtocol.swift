//
//  LoginModelProtocol.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//

import Foundation
import Combine

enum LoginError: Error {
    case invalidUserNameOrPassword
}

protocol LoginModelProtocol {
    func login(userName: String, password: String) -> Future<User, Error>
}
