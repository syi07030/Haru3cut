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
     VStack {
         topView()
         TextField("닉네임", text: $nickName)
             .padding()
             .padding(.bottom,20)
             .textFieldStyle(.plain)
         TextField("E-mail", text: $email)
             .padding()
             .padding(.bottom,20)
             .textFieldStyle(.plain)
         SecureField("Password", text: $password)
             .padding()
             .padding(.bottom,20)
             .textFieldStyle(.plain)
         SecureField("Password check", text: $passwordCheck)
             .padding()
             .padding(.bottom,20)
             .textFieldStyle(.plain)
         TextField("전화번호", text: $phoneNumber)
             .padding()
             .padding(.bottom,20)
             .textFieldStyle(.plain)
         Button("완료", action: buttonTest)
             .padding()
             //.border(.black)
         
     }
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
                Image("back")
                    .padding()
                
                Text("회원가입")
                      .font(.largeTitle)
                      .fontWeight(.semibold)
                      .padding(.bottom, 50)
            }
    }
}
