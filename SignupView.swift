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
    @State private var showProgressBar = false
    @State private var ShowNextView = false
    
    var body: some View {
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
            }
            
            Spacer()
            
            Button(action: {
                showProgressBar = true
                GeneralVM.shared.signupButtonAction(fname: firstName, lname: lastName, username: userName, pwd: password) { success in
                    if success {
                        ShowNextView = true
                    } else {
                        print("Unable to complete registration for some reason")
                    }
                }
            }) {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 50)
            if showProgressBar {
                ProgressView() // Display the progress bar
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            Spacer()
                .navigationBarHidden(true)
                .navigationDestination(isPresented: $ShowNextView) {
                    LoginView()
                }
                .padding(.bottom, 50)
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
