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
    let mySignupVM = SignupViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Divider()
                HStack {
                    Text("Firstname")
                        .bold()
                    TextField("", text: $firstName)
                        .frame(height: 30.0)
                        .background(.ultraThinMaterial)
                }
               
                Divider()
                HStack {
                    Text("Lastname")
                        .bold()
                    TextField("", text: $lastName)
                        .frame(height: 30.0)
                        .background(.ultraThinMaterial)
                }
                Divider()
                HStack {
                    Text("Username")
                        .bold()
                    TextField("", text: $userName)
                        .frame(height: 30.0)
                        .background(.ultraThinMaterial)
                }
                Divider()
                HStack {
                    Text("Password")
                        .bold()
                    SecureField("", text: $password)
                        .frame(height: 30.0)
                        .background(.ultraThinMaterial)
                }
                Divider()
            }
            .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
        
          
            
            Button(action: {
                showProgressBar = true
                mySignupVM.signupButtonAction(fname: firstName, lname: lastName, username: userName, pwd: password) { success in
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
                .navigationTitle("Signup")
                .navigationBarBackButtonHidden()
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
