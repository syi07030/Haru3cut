//
//  LoginPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct LoginPageView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var textClick = false
    @State var buttonClick = false
    
    @State var emailClick = false
    @State var passwordclick = false
    
    @State var gotoRegister = false
    
    @State var emailMessage = " "
    @State var emailMessageColor = Color.error
    
    @State var passwordMessage = " "
//    @State var passwordMessageColor = Color.error
    
    @State private var showingAlert = false
    @State private var showingLoginPage = false
        
    var body: some View {
        
        NavigationView{
            VStack {
                AppNameText()
                
                VStack{
                    if emailClick{
                        HStack{
                            Text("E-mail")
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                    }
                    TextField("E-mail", text:$email,onEditingChanged: { edit in self.emailClick = edit
                        if emailClick == true {
                            passwordclick = false
                        }
                    }
                    )
                        .onChange(of: email, perform: { value in
                            emailMessage = emailCheck(email: email)
                        })
                        .textFieldStyle(TextStyle(focused: $emailClick))
                   
                    HStack{
                        Text("\(emailMessage)")
                            .onChange(of: emailMessage, perform: { value in
                                if emailMessage == "ok" {
                                    emailMessageColor = Color.white
                                } else { emailMessageColor = Color.error }
                            })
                            .foregroundColor(emailMessageColor)
                        Spacer()
                    }
                }
                .padding(.bottom,10)

                VStack{
                    
                    if passwordclick{
                        HStack{
                            Text("Password")
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                    }
                    SecureField("Password", text: $password, onCommit: { passwordclick = false })
                        .onTapGesture {
                            passwordclick = true
                        }
/*                    SecureField("Password", text: Binding<String>(
                        get: {self.password},
                        set: {self.password = $0
                            self.passwordclick = true
                        }
                    ))*/
                        .onChange(of: password, perform: { value in
                            passwordMessage = passwordCheck(password: password)
                        })
                        .textFieldStyle(TextStyle(focused: $passwordclick))
/*                    Text("\(passwordMessage)")
                        .onChange(of: passwordMessage, perform: { value in
                            if passwordMessage == "ok" {
                                passwordMessageColor = Color.green
                            } else { passwordMessageColor = Color.error }
                        })
                        .foregroundColor(passwordMessageColor)
                        .padding(.leading)
 */
                }
                    .padding(.bottom,30)
                    
                HStack(spacing:20){
                    
                    Button("회원가입"){
                        gotoRegister = true
                    }
                    .buttonStyle(buttonDarkStyle())
                    .background(
                        NavigationLink(
                            destination: RegisterPageView(gotoLogin: $gotoRegister),
                            isActive: $gotoRegister,
                            label: {EmptyView()}
                        )
                            .isDetailLink(false)
                            .navigationBarTitle("")
                    )
                    
                    let loginMessage = loginCheck(email: email, password: password)
                    
                   // MARK: - need alert fix
                    if loginMessage == "로그인되었습니다" {
                        NavigationLink(destination: MyTabView(), label:{Text("로그인")})
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .buttonStyle(buttonLightStyle())
                            
                    }else{
                        Button("로그인",action: {showingAlert = true})
                            .buttonStyle(buttonLightStyle())
                            .alert("\(loginMessage)", isPresented: $showingAlert){}
                    }
                    // End_need alert fix

                }
                .padding(.horizontal, 20)
                //.fixedSize(horizontal: true, vertical: false)
                
            } .padding()
                .navigationBarTitle("", displayMode: .automatic)
                .navigationBarHidden(true)
                .padding(.bottom,100)
                .ignoresSafeArea()
            
        }
        .accentColor(Color.black)
        
    }
            
}

struct AppNameText: View {
    var body: some View{
        return Text("하루세컷")
            .tracking(15)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 70)
            .foregroundColor(Color.pp)
    }
}

#if DEBUG
struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
#endif
