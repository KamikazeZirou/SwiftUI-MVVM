//
//  Session.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//

import Combine

final class Session: ObservableObject {
    @Published var isLogin: Bool
    @Published var user: User?
    
    init(isLogin: Bool = false, user: User? = nil) {
        self.isLogin = isLogin
        self.user = user
    }
}
