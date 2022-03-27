//
//  LoginPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct LoginPageView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: - Variables
    @State var email: String = ""
    @State var password: String = ""
        
    @State var emailClick = false
    @State var passwordclick = false
    
    @State var gotoRegister = false
    
    @State var emailMessage = " "
    @State var emailMessageColor = Color.error
    
    @State var passwordMessage = " "
    
    @State private var showingAlert = false
        
    var body: some View {
        
        NavigationView{
            
            VStack {
                AppNameText()
                
                // MARK: - emailTextField
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
                    })
                        .onChange(of: email, perform: { value in
                            emailMessage = emailCheck(email: email)})
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

                // MARK: - passwordTextField
                VStack{
                    
                    if passwordclick{
                        HStack{
                            Text("Password")
                                .foregroundColor(Color.gray)
                            Spacer()
                        }
                    }
                    
                    SecureField("Password", text: $password, onCommit: { passwordclick = false })
                    
                    // MARK: - need to fix:SecureField tapGesture
                        .onTapGesture {
                            passwordclick = true
                        }
                        .onChange(of: password, perform: { value in
                            passwordMessage = passwordCheck(password: password)
                        })
                        .textFieldStyle(TextStyle(focused: $passwordclick))
                }
                    .padding(.bottom,30)
                    
                // MARK: - Button
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
                    
                   //print(loginCheck(email: email, password: password))
                    
                    Button("로그인", action: {
                        if loginCheck(email: email, password: password) == "ok"{
                            
                            NavigationLink(destination: MyTabView(), label:{})
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        }else{
                            showingAlert = true
                        }
                    }) .buttonStyle(buttonLightStyle())
                        .alert("이메일 또는 패스워드가 틀렸습니다", isPresented: $showingAlert){}
                   // MARK: - need to fix alert
 /*                   if loginCheck(email: email, password: password) == "ok" {
                        NavigationLink(destination: MyTabView(), label:{Text("로그인")})
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .buttonStyle(buttonLightStyle())
                            
                    }else{
                        
                        Button("로그인",action: {showingAlert = true
                            print(loginCheck(email: email, password: password))
                        })
                            .buttonStyle(buttonLightStyle())
                            .alert("이메일 또는 패스워드가 틀렸습니다", isPresented: $showingAlert){}
                    }*/
                }
                .padding(.horizontal, 20)
                
            } .padding()
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
