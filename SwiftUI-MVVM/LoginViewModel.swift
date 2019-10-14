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
    @Published private(set) var validationText: String = ""
    
    // MARK: Action
    func login() -> AnyPublisher<User, Error> {
        return authProvider.login(userId: userId, password: password)
            .handleEvents(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    self.validationText = ""
                case .failure:
                    self.validationText = "Incorrect ID or password"
                }
            })
            .eraseToAnyPublisher()
    }
    
    init(authProvider: AuthProviderProtocol = AuthProvider()) {
        self.authProvider = authProvider
        
        _ = Publishers
            .CombineLatest($userId, $password)
            .map { (userId, password) in
                return !userId.isEmpty && !password.isEmpty
            }
            .eraseToAnyPublisher()
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
    }
}
