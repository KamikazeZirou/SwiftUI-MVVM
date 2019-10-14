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
    // MARK: Input
    @Published var userName: String = ""
    @Published var password: String = ""
    
    // MARK: Output
    @Published private(set) var isValid: Bool = false
    
    var validate: AnyPublisher<Bool, Never> {
        Publishers
            .CombineLatest($userName, $password)
            .map { userName, password in
                return !userName.isEmpty && !password.isEmpty
            }
            .eraseToAnyPublisher()
    }
    
    init() {
        _ = validate
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
    }
}
