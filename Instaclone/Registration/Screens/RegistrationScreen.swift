//
//  RegistrationScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 29.05.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI
import KeyboardObserving

struct RegistrationScreen: View {

    @EnvironmentObject var screenRouter: ScreenRouter
    
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    
    
     private var dataTyped: Bool {
        if username.count > 0 && email.count > 0 && password.count > 0 {
            return true
        }
        return false
     }
    
    var body: some View {
        
        
            VStack {
                
                VStack {
                    VStack {
                        VStack {
                            Spacer()
                            Text("Instaclone").font(.custom("Noteworthy Light", size: 40))
                                .foregroundColor(Color.white)
                                
                            VStack {
                                Text("Registriere dich, um die Fotos deiner Freunde zu sehen.")
                                .multilineTextAlignment(.center)
                                .padding(.top)
                                .padding(.leading)
                                .padding(.trailing)
                                .foregroundColor(Color.white)
                            }
                            
                            
                        }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 250)
                            .edgesIgnoringSafeArea(.all)
                            .background(Color.blue)
                    }
                    
                    
                        
                    
                    
                    VStack {
                        TextField("Benutzername", text: self.$username) {
                            UIApplication.shared.endEditing()
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        
                        TextField("E-Mail Adresse", text: self.$email) {
                            UIApplication.shared.endEditing()
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.emailAddress)
                        
                        SecureField("Passwort", text: self.$password){
                            UIApplication.shared.endEditing()
                        }
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        
                    }
                    .padding()
                    .padding(.top, 20)
                    
                    
                    VStack{
                        Button(action: {
                            self.screenRouter.currentScreen = "homeScreen"
                            self.hideKeyboard()
                        }) {
                            Text("Account erstellen")
                            
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 35)
                            .foregroundColor(Color.white)
                                .background(self.dataTyped ? Color.blue : Color.blue.opacity(0.4) )
                            .cornerRadius(5)
                        }.disabled(!self.dataTyped)
                        
                        
                        
                        
                    }.padding(.horizontal)
                    Spacer()
                }.keyboardObserving()
                
                VStack {
                    
                    Divider()
                        .padding(.trailing)
                        .padding(.leading)
                        
                    HStack{
                        Text("Du hast bereits ein Konto?")
                        Button(action: {
                            self.screenRouter.currentScreen = "loginScreen"
                        }) {
                            Text("Melde dich an.")
                        }
                    }.padding()
                        
                }.padding(.bottom, 20)
                
                
                
            }
            .edgesIgnoringSafeArea(.all)
        
    
            
    }
}

struct RegistrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationScreen().environmentObject(ScreenRouter())
    }
}
