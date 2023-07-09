//
//  SignupView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 28/06/2023.
//

import SwiftUI

struct SignupView: View {
    
    @StateObject var mySignupVM = SignupViewModel()
    
    var body: some View {
        
        NavigationStack {
            
            inputFields()
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
            
            signupButton()
                .padding(.vertical, 20)
                .padding(.horizontal, 50)
            
            if mySignupVM.showProgressBar {
                ProgressView() // Display the progress bar
                    .progressViewStyle(CircularProgressViewStyle())
            }
            
            Spacer()
                .navigationTitle("Signup")
                .navigationDestination(isPresented: $mySignupVM.showNextView) {
                    LoginView()
                }
                .padding(.bottom, 50)
            
        }
    }
    
    @ViewBuilder
    private func inputFields() -> some View {
        
        VStack(spacing: 20) {
            Divider()
            HStack {
                Text("Firstname")
                    .bold()
                TextField("", text: $mySignupVM.firstName)
                    .frame(height: 30.0)
                    .background(.ultraThinMaterial)
            }
            
            Divider()
            HStack {
                Text("Lastname")
                    .bold()
                TextField("", text: $mySignupVM.lastName)
                    .frame(height: 30.0)
                    .background(.ultraThinMaterial)
            }
            Divider()
            HStack {
                Text("Username")
                    .bold()
                TextField("", text: $mySignupVM.userName)
                    .frame(height: 30.0)
                    .background(.ultraThinMaterial)
            }
            Divider()
            HStack {
                Text("Password")
                    .bold()
                SecureField("", text: $mySignupVM.password)
                    .frame(height: 30.0)
                    .background(.ultraThinMaterial)
            }
            Divider()
        }
    }
    
    @ViewBuilder
    private func signupButton() -> some View {
        
        Button(action: {
            mySignupVM.showProgressBar = true
            Task {
               await mySignupVM.signupButtonAction()
            }
            },label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            })
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
