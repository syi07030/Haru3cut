//
//  RegisterPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct RegisterPageView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var email: String = ""
    @State var nickName: String = ""
    @State var password: String = ""
    @State var passwordCheck: String = ""
    @State var phoneNumber: String = ""
        
    @State private var showingAlert = false
    @Binding var gotoLogin: Bool
    @State var textClick = false
    
    @State var nicknameClick = false
    @State var emailClick = false
    @State var passwordclick = false
    @State var passwordCheckClick = false
    @State var phonenumberClick = false
    
    @State var nicknameErrorMessage = " "
    @State var emailErrorMessage = " "
    @State var passwordErrorMessage = " "
    @State var passwordCheckErrorMessage = " "
    @State var phoneNumberErrorMessage = " "
    
    @State var nickNameMessageColor = Color.error
    @State var emailMessageColor = Color.error
    @State var passwordMessageColor = Color.error
    @State var passwordCheckMessageColor = Color.error
    @State var phoneNumberMessageColor = Color.error
     
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
                 .padding(.bottom,20)
                 .frame(height:100)
                 
                 Spacer()
                 
                 VStack{
                     TextField("닉네임", text: $nickName, onEditingChanged: { edit in self.nicknameClick = edit
                         passwordclick = false
                         passwordCheckClick = false
                     })
                         .onChange(of: nickName, perform: {value in
                             nicknameErrorMessage = nicknameCheck(nickName: nickName)
                         })
                         .textFieldStyle(TextStyle(focused: $nicknameClick))
                     
                     Text("\(nicknameErrorMessage)")
                         .onChange(of: nicknameErrorMessage, perform: { value in
                             if nicknameErrorMessage == "ok" {
                                 nickNameMessageColor = Color.green
                             } else { nickNameMessageColor = Color.error }
                         })
                         .foregroundColor(nickNameMessageColor)
                         .padding(.leading)
                 }
                     .padding(.bottom,25)
                 
                 VStack{
                     TextField("E-mail", text: $email, onEditingChanged: { edit in self.emailClick = edit
                         passwordclick = false
                         passwordCheckClick = false
                     })
                         .onChange(of: email, perform: {value in
                             emailErrorMessage = emailCheck(email: email)
                         })
                         .textFieldStyle(TextStyle(focused: $emailClick))
                     
                     Text("\(emailErrorMessage)")
                         .onChange(of: emailErrorMessage, perform: { value in
                             if emailErrorMessage == "ok" {
                                 emailMessageColor = Color.green
                             } else { emailMessageColor = Color.error }
                         })
                         .foregroundColor(emailMessageColor)
                         .padding(.leading)
                 }
                     .padding(.bottom,25)
                 
                 VStack{
                     SecureField("Password", text: $password, onCommit: { passwordclick = false
                     })
                         .onTapGesture {
                             passwordclick = true
                             passwordCheckClick = false
                         }
                         .onChange(of: password, perform: { value in
                             passwordErrorMessage = Haru3cut.passwordCheck(password: password)
                         })
                         .textFieldStyle(TextStyle(focused: $passwordclick))
                     
                     Text("\(passwordErrorMessage)")
                         .onChange(of: passwordErrorMessage, perform: { value in
                             if passwordErrorMessage == "ok" {
                                 passwordMessageColor = Color.green
                             } else { passwordMessageColor = Color.error }
                         })
                         .foregroundColor(passwordMessageColor)
                         .padding(.leading)
                         
                 } .padding(.bottom,25)
                 
                 VStack{
                     SecureField("Password check", text: $passwordCheck, onCommit: { passwordCheckClick = false })
                         .onTapGesture {
                             passwordCheckClick = true
                             passwordclick = false
                         }
                         .onChange(of: passwordCheck, perform: { value in
                             passwordCheckErrorMessage = passwordDoubleCheck(password: passwordCheck)
                         })
                         .textFieldStyle(TextStyle(focused: $passwordCheckClick))
                     
                     Text("\(passwordCheckErrorMessage)")
                         .onChange(of: passwordCheckErrorMessage, perform: { value in
                             if passwordCheckErrorMessage == "ok" {
                                 passwordCheckMessageColor = Color.green
                             } else { passwordCheckMessageColor = Color.error }
                         })
                         .foregroundColor(passwordCheckMessageColor)
                         .padding(.leading)
                 }
                     .padding(.bottom,25)
                 
                 VStack{
                     TextField("전화번호", text: $phoneNumber, onEditingChanged: { edit in self.phonenumberClick = edit
                         passwordclick = false
                         passwordCheckClick = false
                     })
                         .onChange(of: phoneNumber, perform: {value in
                             phoneNumberErrorMessage = phoneNumberCheck(phoneNumber: phoneNumber)
                         })
                         .textFieldStyle(TextStyle(focused: $phonenumberClick))
                     
                     Text("\(phoneNumberErrorMessage)")
                         .onChange(of: phoneNumberErrorMessage, perform: { value in
                             if phoneNumberErrorMessage == "ok" {
                                 phoneNumberMessageColor = Color.green
                             } else { phoneNumberMessageColor = Color.error }
                         })
                         .foregroundColor(phoneNumberMessageColor)
                         .padding(.leading)
                 }
                     .padding(.bottom,25)
                 
                 Button("완료",action: {showingAlert = true})
                     .buttonStyle(buttonDarkStyle())
                     .padding(.bottom,30)
                 .alert("회원가입 완료", isPresented: $showingAlert){
                     Button("OK", action: { self.gotoLogin = false })
                 } message: {
                     Text("다시 로그인 해주시기 바랍니다")
                 }
                 
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

struct TextFieldErrorMessage: View{
    @State var errorMessage: String
    @State var errorMessageColor = Color.error
    
    var body: some View{
        Text("\(errorMessage)")
            .onChange(of: errorMessage, perform: { value in
                if errorMessage == "ok" {
                    errorMessageColor = Color.green
                } else { errorMessageColor = Color.error }
            })
            .foregroundColor(errorMessageColor)
            .padding(.leading)
    }
}
