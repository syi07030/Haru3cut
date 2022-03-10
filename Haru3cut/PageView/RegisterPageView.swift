//
//  RegisterPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct RegisterPageView: View {
 @State var email: String = ""
 @State var nickName: String = ""
 @State var password: String = ""
 @State var passwordCheck: String = ""
 @State var phoneNumber: String = ""
 
 var body: some View {
     NavigationView{
         VStack {
             topView()
             TextField("닉네임", text: $nickName)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,10)
             TextField("E-mail", text: $email)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,10)
             SecureField("Password", text: $password)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,10)
             SecureField("Password check", text: $passwordCheck)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,10)
             TextField("전화번호", text: $phoneNumber)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,30)
             NavigationLink(destination: LoginPageView(), label:{Text("완료")})
                 .buttonStyle(buttonDarkStyle())
             
         } .padding()
     } .navigationBarHidden(true)
}
}

#if DEBUG
struct RegisterPageView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPageView()
    }
}
#endif

struct topView: View {
    var body: some View {
        HStack(
                alignment: .top,
                spacing: 10
            ) {
                //Image("back")
                //    .padding()
                
                Text("회원가입")
                      .font(.largeTitle)
                      .fontWeight(.semibold)
                      .padding(.bottom, 50)
            }
    }
}
