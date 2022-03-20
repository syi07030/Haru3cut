//
//  RegisterPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

//public var passwordClick = false
//public var passwordCheckClick = false

struct RegisterPageView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: - Variables
    
    @State var email: String = ""
    @State var nickName: String = ""
    @State var password: String = ""
    @State var passwordCheck: String = ""
    @State var phoneNumber: String = ""
        
    @State private var showingAlert = false
    @Binding var gotoLogin: Bool
    
    @State var nicknameClick = false
    @State var emailClick = false
    @State var phonenumberClick = false
    @State var passwordClick = false
    @State var passwordCheckClick = false
    
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
                     if nicknameClick{
                         HStack{
                             Text("닉네임")
                                 .foregroundColor(Color.gray)
                             Spacer()
                         }
                     }
                     TextField("닉네임", text: $nickName, onEditingChanged: { edit in self.nicknameClick = edit
                         passwordClick = false
                         passwordCheckClick = false
                     })
                         .onChange(of: nickName, perform: {value in
                             nicknameErrorMessage = nicknameCheck(nickName: nickName)
                         })
                         .textFieldStyle(TextStyle(focused: $nicknameClick))
                     
                     HStack{
                         Text("\(nicknameErrorMessage)")
                             .onChange(of: nicknameErrorMessage, perform: { value in
                                 if nicknameErrorMessage == "ok" {
                                     nickNameMessageColor = Color.green
                                 } else { nickNameMessageColor = Color.error }
                             })
                             .foregroundColor(nickNameMessageColor)
                         Spacer()
                     }
                     
                 }
                     .padding(.bottom,25)
                 
                 VStack{
                     if emailClick{
                         HStack{
                             Text("E-mail")
                                 .foregroundColor(Color.gray)
                             Spacer()
                         }
                     }
                     TextField("E-mail", text: $email, onEditingChanged: { edit in self.emailClick = edit
                         passwordClick = false
                         passwordCheckClick = false
                     })
                         .onChange(of: email, perform: {value in
                             emailErrorMessage = emailCheck(email: email)
                         })
                         .textFieldStyle(TextStyle(focused: $emailClick))
                     
                     HStack{
                         Text("\(emailErrorMessage)")
                             .onChange(of: emailErrorMessage, perform: { value in
                                 if emailErrorMessage == "ok" {
                                     emailMessageColor = Color.green
                                 } else { emailMessageColor = Color.error }
                             })
                             .foregroundColor(emailMessageColor)
                         Spacer()
                     }
                 }
                     .padding(.bottom,25)
                 
                 VStack{
                     if passwordClick{
                         HStack{
                             Text("Password")
                                 .foregroundColor(Color.gray)
                             Spacer()
                         }
                     }
                     SecureField("Password", text: $password, onCommit: { passwordClick = false
                     })
                         .onTapGesture {
                             passwordClick = true
                             passwordCheckClick = false
                         }
                         .onChange(of: password, perform: { value in
                             passwordErrorMessage = Haru3cut.passwordCheck(password: password)
                         })
                         .textFieldStyle(TextStyle(focused: $passwordClick))
                     
                     HStack{
                         Text("\(passwordErrorMessage)")
                             .onChange(of: passwordErrorMessage, perform: { value in
                                 if passwordErrorMessage == "ok" {
                                     passwordMessageColor = Color.green
                                 } else { passwordMessageColor = Color.error }
                             })
                             .foregroundColor(passwordMessageColor)
                         Spacer()
                     }
                         
                 } .padding(.bottom,25)
                 
                 VStack{
                     if passwordCheckClick{
                         HStack{
                             Text("Password check")
                                 .foregroundColor(Color.gray)
                             Spacer()
                         }
                     }
                     SecureField("Password check", text: $passwordCheck, onCommit: { passwordCheckClick = false })
                         .onTapGesture {
                             passwordCheckClick = true
                             passwordClick = false
                         }
                         .onChange(of: passwordCheck, perform: { value in
                             passwordCheckErrorMessage = passwordDoubleCheck(password: passwordCheck)
                         })
                         .textFieldStyle(TextStyle(focused: $passwordCheckClick))
                     
                     HStack{
                         Text("\(passwordCheckErrorMessage)")
                             .onChange(of: passwordCheckErrorMessage, perform: { value in
                                 if passwordCheckErrorMessage == "ok" {
                                     passwordCheckMessageColor = Color.green
                                 } else { passwordCheckMessageColor = Color.error }
                             })
                             .foregroundColor(passwordCheckMessageColor)
                         Spacer()
                     }
                 }
                     .padding(.bottom,25)
                 
                 VStack{
                     if phonenumberClick{
                         HStack{
                             Text("전화번호")
                                 .foregroundColor(Color.gray)
                             Spacer()
                         }
                     }
                     TextField("전화번호", text: $phoneNumber, onEditingChanged: { edit in self.phonenumberClick = edit
                         passwordClick = false
                         passwordCheckClick = false
                     })
                         .onChange(of: phoneNumber, perform: {value in
                             phoneNumberErrorMessage = phoneNumberCheck(phoneNumber: phoneNumber)
                         })
                         .textFieldStyle(TextStyle(focused: $phonenumberClick))
                     
                     HStack{
                         Text("\(phoneNumberErrorMessage)")
                             .onChange(of: phoneNumberErrorMessage, perform: { value in
                                 if phoneNumberErrorMessage == "ok" {
                                     phoneNumberMessageColor = Color.green
                                 } else { phoneNumberMessageColor = Color.error }
                             })
                             .foregroundColor(phoneNumberMessageColor)
                         Spacer()
                     }
                 }
                 
                 Spacer()
                 
                 Button("완료",action: {showingAlert = true})
                     .buttonStyle(buttonDarkStyle())
                     .padding(.bottom,20)
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
struct Register_TextField: View{
    @State var click: Bool
    @State var textName: String
    @State var errorMessage: String
    @State var errorMessageColor: Color
    
    var body: some View{
        VStack{
            if click{
                HStack{
                    Text("\(textName)")
                        .foregroundColor(Color.gray)
                    Spacer()
                }
            }
            TextField("\(textName)", text: $textName, onEditingChanged: { edit in self.click = edit
                passwordClick = false
                passwordCheckClick = false
            })
                .onChange(of: textName, perform: {value in
                    if textName == "nickName"{
                        errorMessage = nicknameCheck(nickName: textName)
                    }else if textName == "email"{
                        errorMessage = emailCheck(email: textName)
                    }else if textName == "phoneNumber"{
                        errorMessage = phoneNumberCheck(phoneNumber: textName)
                    }
                })
                .textFieldStyle(TextStyle(focused: $click))
            
            HStack{
                Text("\(errorMessage)")
                    .onChange(of: errorMessage, perform: { value in
                        if errorMessage == "ok" {
                            errorMessageColor = Color.green
                        } else { errorMessageColor = Color.error }
                    })
                    .foregroundColor(errorMessageColor)
                Spacer()
            }
            
        }
            .padding(.bottom,25)
    }
}
*/
 
/*
#if DEBUG
struct RegisterPageView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPageView()
    }
}
#endif
*/
