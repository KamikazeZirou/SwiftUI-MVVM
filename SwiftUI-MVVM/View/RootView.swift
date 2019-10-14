//
//  RootView.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var session: Session

    var body: some View {
        VStack {
            if self.session.isLogin {
                HomeView()
                    .environmentObject(self.session)
            } else {
                LoginView()
                    .environmentObject(self.session)
            }
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(Session())
    }
}
