//
//  LoginViewModel.swift
//  HelloCombine
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 kamikaze. All rights reserved.
//

import Foundation
import Combine

final class LoginViewModel: ObservableObject {
    // MARK: Private
    private let authProvider: AuthProviderProtocol
    
    // MARK: Input
    @Published var userId: String = ""
    @Published var password: String = ""
    
    // MARK: Output
    @Published private(set) var isValid: Bool = false
    
    var validate: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest($userId, $password)
            .map { userId, password in
                return !userId.isEmpty && !password.isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    // MARK: Action
    func login() -> Future<User, Error> {
        return authProvider.login(userId: userId, password: password)
    }
    
    init(authProvider: AuthProviderProtocol = AuthProvider()) {
        self.authProvider = authProvider
        
        _ = validate
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
    }
}
