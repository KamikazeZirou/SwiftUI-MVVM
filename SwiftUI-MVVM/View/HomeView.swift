//
//  AfterLoginView.swift
//  SwiftUI-MVVM
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 example. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var session: Session
    @ObservedObject private var vm = HomeViewModel()
    
    var body: some View {
        VStack {
            Text("Hello \(self.session.user?.name ?? "")!")
            Button(action: {
                _ = self.vm.logout()
                    .sink(receiveCompletion: { err in
                        self.session.user = nil
                        self.session.isLogin = false
                    }, receiveValue: {})
            }) {
                Text("Logout")
            }.disabled(!vm.canLogin)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(Session(isLogin: true, user: User(id: "userId", name: "foobar")))
    }
}
