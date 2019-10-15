//
//  HomeViewModel.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//
import Foundation
import Combine

final class HomeViewModel: ObservableObject  {
    // MARK: Private
    private let authProvider: AuthProviderProtocol
    
    // MARK: Output
    @Published private(set) var canLogin: Bool = true
    
    // MARK: Action
    func logout() -> AnyPublisher<Void, Error> {
        canLogin = false
        
        return authProvider.logout()
            .receive(on: RunLoop.main)
            .handleEvents(receiveCompletion: { [weak self] completion in
                self?.canLogin = true
            })
            .eraseToAnyPublisher()
    }
    
    init(authProvider: AuthProviderProtocol = AuthProvider()) {
        self.authProvider = authProvider
    }
}
