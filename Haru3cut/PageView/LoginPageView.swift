//
//  LoginPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI
import Foundation
import UIKit

struct LoginPageView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var clickCheck = false
    
    var body: some View {
        
        NavigationView{
            VStack {
                AppNameText()
                TextField("E-mail", text: $email)
                    .textFieldStyle(TextStyle())
                    .padding(.bottom,10)
                SecureField("Password", text: $password)
                    .textFieldStyle(TextStyle())
                    .padding(.bottom,30)
                    
                HStack(spacing:20){
                    
                    NavigationLink(destination: RegisterPageView(), label:{Text("회원가입")})
                        .buttonStyle(buttonDarkStyle())
                    
                    NavigationLink(destination: MyPostPageView(), label:{Text("로그인")})
                        .buttonStyle(buttonLightStyle())
                }
                .padding(.horizontal, 20)
                //.fixedSize(horizontal: true, vertical: false)
                
            } .padding()
        } .navigationBarHidden(true)
    }
}

#if DEBUG
struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
#endif

struct AppNameText: View {
    var body: some View{
        return Text("하루세컷")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 70)
            .foregroundColor(Color.pp)
    }
}

struct buttonDarkStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(Color.pp)
            .cornerRadius(8)
    }
}

struct buttonLightStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.pp)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(Color.ww)
            .cornerRadius(8)
    }
}

struct TextStyle: TextFieldStyle{
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            //.background(Color.ww)
            .cornerRadius(8)
        }
}

extension Color {
    static let pp = Color(red:102/255, green:103/255, blue:171/255)
    static let ww = Color(red: 240/255, green: 240/255, blue: 240/255)
}

func buttonTest(){
    return
}
