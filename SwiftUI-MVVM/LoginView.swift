//
//  ContentView.swift
//  HelloCombine
//
//  Created by kamikaze on 2019/10/14.
//  Copyright © 2019 kamikaze. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var vm = LoginViewModel()

    var body: some View {
        VStack {
            Text("Learning SwifUI-MVVM")
                .font(.title)

            TextField("User Name", text: $vm.userName)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            SecureField("Password", text: $vm.password)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            Button(action: {
            }) {
                Text(/*@START_MENU_TOKEN@*/"Login"/*@END_MENU_TOKEN@*/)
            }
            .disabled(!vm.isValid)
            
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
