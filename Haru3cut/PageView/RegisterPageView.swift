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
                 
                 TextField("닉네임", text: $nickName, onEditingChanged: { edit in self.nicknameClick = edit
                     passwordclick = false
                     passwordCheckClick = false
                 })
                     .onChange(of: nickName, perform: {value in
                         print("\(nickName)")
                     })
                     .textFieldStyle(TextStyle(focused: $nicknameClick))
                     .padding(.bottom,35)
                 
                 TextField("E-mail", text: $email, onEditingChanged: { edit in self.emailClick = edit
                     passwordclick = false
                     passwordCheckClick = false
                 })
                     .onChange(of: email, perform: {value in
                         print("\(email)")
                     })
                     .textFieldStyle(TextStyle(focused: $emailClick))
                     .padding(.bottom,35)
                 
                 SecureField("Password", text: $password, onCommit: { passwordclick = false
                 })
                     .onTapGesture {
                         passwordclick = true
                         passwordCheckClick = false
                     }
                     .onChange(of: password, perform: { value in
                         print("password final text = \(password)")
                     })
                     .textFieldStyle(TextStyle(focused: $passwordclick))
                     .padding(.bottom,35)
                 
                 SecureField("Password check", text: $passwordCheck, onCommit: { passwordCheckClick = false })
                     .onTapGesture {
                         passwordCheckClick = true
                         passwordclick = false
                     }
                     .onChange(of: passwordCheck, perform: { value in
                         print("passwordcheck final text = \(passwordCheck)")
                     })
                     .textFieldStyle(TextStyle(focused: $passwordCheckClick))
                     .padding(.bottom,35)
                 
                 TextField("전화번호", text: $phoneNumber, onEditingChanged: { edit in self.phonenumberClick = edit
                     passwordclick = false
                     passwordCheckClick = false
                 })
                     .onChange(of: phoneNumber, perform: {value in
                         print("\(phoneNumber)")
                     })
                     .textFieldStyle(TextStyle(focused: $phonenumberClick))
                     .padding(.bottom,35)
                 
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
