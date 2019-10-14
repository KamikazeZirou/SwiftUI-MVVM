//
//  Session.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//

import Combine
import SwiftUI

final class Session: ObservableObject {
    @Published var isLogin: Bool = false
    @Published var user: User? = nil
}
