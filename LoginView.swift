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
    @State private var showProgressBar = false
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
            Button(action: {
                
                showProgressBar = true
                GeneralVM.shared.loginButtonAction( username: userName, password: password) { success in
                    if success {
                        ShowNextView = true
                    } else {
                        print("Unable to complete registration for some reason")
                    }
                }
            }) {
                Text("Log in")
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
                   CategoriesView()
                }
                .padding(.bottom, 50)
            hh
        }
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
