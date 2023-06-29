//
//  ContentView.swift
//  multiPartChallengeSwiftUI
//
//  Created by EthanBalink on 28/06/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var userName: String = ""
    @State var password: String = ""
    
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
                Button("Sign Up") {
                    GeneralVM.shared.loginButtonAction(fname: firstName, lname: lastName, username: userName, pwd: password) { success in
                        if success {
                            ShowNextView = true
                        } else {
                            print("Unable to complete registration for some reason")
                        }// else
                    }// if succes
                }// closure
            }// func
            .navigationBarHidden(true)
            .navigationDestination(
                isPresented: $ShowNextView) {
                    
                    CategoriesView()
                }
            //                    NavigationLink(
            //                        destination: CategoriesView()
            //                            .navigationBarBackButtonHidden(true),
            //                        isActive: $ShowNextView
            //                    ) {
            //                        EmptyView()
            //                    }
            //                        .hidden()
            
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
