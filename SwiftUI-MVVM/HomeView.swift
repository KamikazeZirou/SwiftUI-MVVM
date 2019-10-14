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
    
    var body: some View {
        VStack {
            Text("Hello \(self.session.user!.name)!")
            Button(action: {
                
            }) {
                Text("Logout")
            }
        }
    }
}

struct AfterLoginView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
