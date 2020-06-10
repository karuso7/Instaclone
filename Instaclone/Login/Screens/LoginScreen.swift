//
//  LoginScreen.swift
//  Instaclone
//
//  Created by Karsten Krause on 29.05.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import SwiftUI
import KeyboardObserving

struct LoginScreen: View {
    @EnvironmentObject var screenRouter: ScreenRouter
    
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var keyboardHeight: CGFloat = 0
    
    
    private var dataTyped: Bool {
        if username.count > 0 && password.count > 0 {
            return true
        }
        return false
    }
    
    var body: some View {
        
        
        VStack {
            Spacer()
            
            
            VStack {
                VStack {
                    Text("Instaclone").font(.custom("Noteworthy Light", size: 40))
                }
                VStack {
                    TextField("Benutzername", text: self.$username) {
                        UIApplication.shared.endEditing()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.emailAddress)
                    
                    SecureField("Passwort", text: self.$password){
                        UIApplication.shared.endEditing()
                    }
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    
                    VStack {
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                            Text("Passwort vergessen?")
                                .font(.system(size: 15))
                            
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 25, alignment: .bottomTrailing)
                    }.padding(.bottom)
                    
                }.padding()
                
                VStack{
                    Button(action: {
                        self.screenRouter.currentScreen = "homeScreen"
                        self.hideKeyboard()
                    }) {
                        Text("Anmelden")
                            
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 35)
                            .foregroundColor(Color.white)
                            .background(self.dataTyped ? Color.blue : Color.blue.opacity(0.4) )
                            .cornerRadius(5)
                    }.disabled(!self.dataTyped)
                    
                    
                    
                    
                }.padding(.horizontal)
            }.keyboardObserving()
            
            
            Spacer()
            VStack{
                
                Divider()
                    .padding(.trailing)
                    .padding(.leading)
                
                HStack{
                    Text("Du hast kein Konto?")
                    Button(action: {
                        self.screenRouter.currentScreen = "registrationScreen"
                        
                    }) {
                        Text("Registrieren")
                    }
                }.padding()
                
            }.padding(.bottom, 20)
            
            
        }.edgesIgnoringSafeArea(.all)
        
        
    }
}

struct LoginScreen_Previews: PreviewProvider {
    static var previews: some View {
        LoginScreen().environmentObject(ScreenRouter())
    }
}
