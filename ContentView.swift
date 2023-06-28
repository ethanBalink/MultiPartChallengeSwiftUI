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
    var body: some View {
        
        Form {
            
            HStack{
                Text("Firstname")
                    .bold()
                TextField("", text: $firstName)
                
            }
            HStack{
                Text("Lastname")
                    .bold()
                TextField("", text: $lastName)
                
            }
            HStack{
                Text("Username")
                    .bold()
                TextField("", text: $userName)
                
            }
            HStack{
                Text("Password")
                    .bold()
                TextField("", text: $password)
                
            }
            Button("Sign Up") {
                print(userName)
                print(password)
                SigninAPI.shared.register(fname: firstName, lname: lastName, username: userName, pwd: password, completion: {
                    success, error in
                    if success {
                        print("succes")
                    } else if error {
                        print("error")
                    }
                    //
                }
                                          
                )
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
