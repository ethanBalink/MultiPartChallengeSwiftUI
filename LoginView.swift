//
//  LoginView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import SwiftUI

struct LoginView: View {
    @State var userName: String = ""
    @State var password: String = ""
    @State private var ShowNextView = false
    var body: some View {
        
        NavigationStack {
            
            Form {
                HStack {
                    Text("Username")
                        .bold()
                    TextField("", text: $userName)
                }
                HStack {
                    Text("Password")
                        .bold()
                    TextField("", text: $password)
                }
            }// form
            Spacer()
                Button("Log In") {
                    GeneralVM.shared.loginButtonAction( username: userName, password: password) { success in
                        if success {
                            ShowNextView = true
                        } else {
                            print("Unable to complete registration for some reason")
                        }// else
                    }// if succes
                }// closure
            Spacer()
            .navigationBarHidden(true)
            .navigationDestination(
                isPresented: $ShowNextView) {
                    CategoriesView()
                }
                .padding(.bottom, 50)
               
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
