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
    
@State private var showingAlert = false
@Binding var gotoLogin: Bool
 
 var body: some View {
         VStack {
             VStack(alignment:.center) {
                 
                ZStack{
                     Text("회원가입")
                         .font(.largeTitle)
                         .fontWeight(.semibold)
                     
                 }
                 .padding(.top, 50)
             }
             .padding(0)
             .frame(height:100)
             Spacer()
             TextField("닉네임", text: $nickName)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,35)
             TextField("E-mail", text: $email)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,35)
             SecureField("Password", text: $password)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,35)
             SecureField("Password check", text: $passwordCheck)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,35)
             TextField("전화번호", text: $phoneNumber)
                 .textFieldStyle(TextStyle())
                 .padding(.bottom,90)
             Button("완료",action: {showingAlert = true})
                 .buttonStyle(buttonDarkStyle())
                 .padding(.bottom,30)
             .alert("회원가입 완료", isPresented: $showingAlert){
                 Button("OK", action: { self.gotoLogin = false })
             } message: {
                 Text("다시 로그인 해주시기 바랍니다")
             }
             
//             NavigationLink(destination: LoginPageView(), label:{Text("완료")})
//                 .buttonStyle(buttonDarkStyle())
//                 .padding(.bottom, 30)
             
         } .padding()
            .ignoresSafeArea()
}
}

/*
#if DEBUG
struct RegisterPageView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPageView()
    }
}
#endif
*/
/*
struct topView: View {
    var body: some View {
        VStack(alignment:.center) {
            ZStack{
                HStack{
                    Image("back")
                        .resizable()
                        .offset(y:3)
                        .frame(width: 30, height: 30, alignment: .center)
                    Spacer()
                }
                Text("회원가입")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
            } .padding(.top, 50)
        }
        .padding(0)
        .frame(height:100)

    }
}
*/
