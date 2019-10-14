//
//  HomeViewModel.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//

import Combine

final class HomeViewModel {
    // MARK: Private
    private let authProvider: AuthProviderProtocol
    
    // MARK: Action
    func logout() -> Future<Void, Error> {
        return authProvider.logout()
    }
    
    init(authProvider: AuthProviderProtocol = AuthProvider()) {
        self.authProvider = authProvider
    }
}
