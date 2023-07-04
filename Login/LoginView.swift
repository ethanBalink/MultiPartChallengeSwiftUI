//
//  LoginView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 02/07/2023.
//

import SwiftUI

struct LoginView: View {
    
    
    @StateObject var myLoginVM = LoginViewModel()
    @State private var showView = false
    var body: some View {
        
        NavigationStack {
            
            Form {
                HStack {
                    Text("Username")
                        .bold()
                    TextField("", text: $myLoginVM.userName)
                }
                HStack {
                    Text("Password")
                        .bold()
                    SecureField("", text: $myLoginVM.password)
                }
            }// form
            Spacer()
            Button(action: {
                myLoginVM.showProgressBar = true
                myLoginVM.loginButtonAction()
                // { success in
                //                    if success {
                //                        ShowNextView = true
                //                        showProgressBar = true
                //                    } else {
                //                        print("Unable to complete registration for some reason")
                //                    }
                //                }
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
            if myLoginVM.showProgressBar{
                ProgressView() // Display the progress bar
                    .progressViewStyle(CircularProgressViewStyle())
            }
            Spacer()
                .navigationBarHidden(true)
                .navigationDestination(isPresented: $myLoginVM.showNextView) {
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
