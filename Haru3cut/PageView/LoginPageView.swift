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
                    
                    Button("????????????"){
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
                    
                    Button("?????????", action: {
                        if loginCheck(email: email, password: password) == "ok"{
                            
                            NavigationLink(destination: MyTabView(), label:{})
                                .navigationBarTitle("")
                                .navigationBarHidden(true)
                        }else{
                            showingAlert = true
                        }
                    }) .buttonStyle(buttonLightStyle())
                        .alert("????????? ?????? ??????????????? ???????????????", isPresented: $showingAlert){}
                   // MARK: - need to fix alert
 /*                   if loginCheck(email: email, password: password) == "ok" {
                        NavigationLink(destination: MyTabView(), label:{Text("?????????")})
                            .navigationBarTitle("")
                            .navigationBarHidden(true)
                            .buttonStyle(buttonLightStyle())
                            
                    }else{
                        
                        Button("?????????",action: {showingAlert = true
                            print(loginCheck(email: email, password: password))
                        })
                            .buttonStyle(buttonLightStyle())
                            .alert("????????? ?????? ??????????????? ???????????????", isPresented: $showingAlert){}
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
        return Text("????????????")
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
