//
//  ContentView.swift
//  LoginApp
//
//  Created by Truett Knox on 11/11/20.
//

import SwiftUI

let lightGrayColor = Color(red: 239.0/255.0,green: 243.0/255.0, blue: 244.0/255.0)

let storedUsername = "Tpk73"
let storedPassword = "asdf"

struct ContentView: View {
    
    @State var userName: String = ""
    @State var password: String = ""
    
    @State var loginFailed: Bool = false
    @State var loginSuccess: Bool = false
    
    var body: some View {
        
        ZStack{
            VStack{
                helloText()
                userImage()
                userNameTF(userName: $userName)
                passwordSecureF(password: $password)
                if loginFailed {
                    Text("Information is incorrect. Try Again!")
                        .offset(y: -10)
                        .foregroundColor(.red)
                }
                Button(action: { if self.userName == storedUsername && self.password == storedPassword { self.loginSuccess = true
                    self.loginFailed = false
                } else {
                    self.loginFailed = true
                    self.loginSuccess = false
                }
                    
                }){
                    login()
                }
            }
            .padding()
            if loginSuccess {
                Text("Login Successful")
                    .font(.headline)
                    .frame(width: 250, height: 80)
                    .background(Color.green)
                    .cornerRadius(20.0)
                    .animation(Animation.default)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct helloText: View {
    var body: some View{
        Text("Hello You!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 20)
    }
}
struct userImage: View{
    var body: some View{
        Image("1")
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 150, height: 150)
            .clipped()
            .cornerRadius(150)
            .padding(.bottom, 75)
    }
}
struct login: View{
    var body: some View{
        Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(Color.black)
            .cornerRadius(20)
    }
}
struct userNameTF: View{
    
    @Binding var userName: String
    
    var body: some View{
        TextField("Username", text: $userName)
            .padding()
            .background(lightGrayColor)
            .cornerRadius(5.0)
            .padding(.bottom, 28)
    }
}

struct passwordSecureF: View {
    
    @Binding var password: String
    
    var body: some View {
        SecureField("Password", text: $password)
            .padding()
            .background(lightGrayColor)
            .cornerRadius(5.0)
            .padding(.bottom, 28)
    }
}
