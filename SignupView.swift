//
//  SignupView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 28/06/2023.
//

import SwiftUI

struct SignupView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var userName: String = ""
    @State var password: String = ""
    
    @State private var ShowNextView = false
    
    var body: some View {
        // TODO: name var in vm
        NavigationStack {
            
            Form {
                HStack {
                    Text("Firstname")
                        .bold()
                    TextField("", text: $firstName)
                }
                HStack {
                    Text("Lastname")
                        .bold()
                    TextField("", text: $lastName)
                }
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
                Button("Sign Up") {
                    GeneralVM.shared.signupButtonAction(fname: firstName, lname: lastName, username: userName, pwd: password) { success in
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
                    LoginView()
                }
                .padding(.bottom, 50)
               
        }// navigationstack
    }// view
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
