//
//  ContentView.swift
//  HelloCombine
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 kamikaze. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var session: Session
    @ObservedObject private var vm = LoginViewModel()

    var body: some View {
        VStack {
            Text("Learning SwifUI-MVVM")
                .font(.title)

            TextField("User ID", text: $vm.userId)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .autocapitalization(UITextAutocapitalizationType.none)

            SecureField("Password", text: $vm.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            if (!vm.validationText.isEmpty) {
                Text(vm.validationText)
                    .font(.caption)
                    .foregroundColor(Color.red)
            }

            Button(action: {
                _ = self.vm.login()
                    .receive(on: RunLoop.main)
                    .sink(receiveCompletion: { completion in
                        print("receiveCompletion:", completion)
                    }, receiveValue: { user in
                        print("userId:", user.id)
                        self.session.user = user
                        self.session.isLogin = true
                    })
            }) {
                Text(/*@START_MENU_TOKEN@*/"Login"/*@END_MENU_TOKEN@*/)
            }
            .disabled(!vm.canLogin)
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
            .environmentObject(Session())
    }
}
