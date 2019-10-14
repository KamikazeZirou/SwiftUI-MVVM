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
    @Published private var isBusy: Bool = false
    
    // MARK: Input
    @Published var userId: String = ""
    @Published var password: String = ""
    
    // MARK: Output
    @Published private(set) var canLogin: Bool = false
    @Published private(set) var validationText: String = ""
    
    // MARK: Action
    func login() -> AnyPublisher<User, Error> {
        isBusy = true
        validationText = ""
        
        return authProvider.login(userId: userId, password: password)
            .receive(on: RunLoop.main)
            .handleEvents(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    self?.validationText = ""
                case .failure:
                    self?.validationText = "Incorrect ID or password"
                }
                
                self?.isBusy = false
            })
            .eraseToAnyPublisher()
    }
    
    init(authProvider: AuthProviderProtocol = AuthProvider()) {
        self.authProvider = authProvider
        
        _ = Publishers
            .CombineLatest3($userId, $password, $isBusy)
            .map { (userId, password, isBusy) in
                return !(userId.isEmpty || password.isEmpty || isBusy)
            }
            .receive(on: RunLoop.main)
            .assign(to: \.canLogin, on: self)
    }
}
