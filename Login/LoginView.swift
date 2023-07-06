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
            VStack {
//                Form {
                VStack(spacing: 20) {
                    Divider()
                    HStack {
                        Text("Username")
                            .bold()
                        TextField("", text: $myLoginVM.userName)
                            .frame(height: 30.0)
                            .background(.ultraThinMaterial)
                    }
                    Divider()
                    HStack {
                        Text("Password")
                            .bold()
                        SecureField("", text: $myLoginVM.password)
                            .frame(height: 30.0)
                            .background(.ultraThinMaterial)
                    }
                    Divider()
                }
                .cornerRadius(10)
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
                
//                }
                
                
//                Spacer()
                Button(action: {
                    myLoginVM.showProgressBar = true
                    myLoginVM.loginButtonAction()
                }) {
                    Text("Log in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                
                if myLoginVM.showProgressBar{
                    ProgressView() // Display the progress bar
                        .progressViewStyle(CircularProgressViewStyle())
                }
                Spacer()
                    .navigationTitle("Login")
                    .navigationBarBackButtonHidden()
                    .navigationDestination(isPresented: $myLoginVM.showNextView) {
                        CategoriesView()
                    }
                                    
            }
        }
       
        
    }
}


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
