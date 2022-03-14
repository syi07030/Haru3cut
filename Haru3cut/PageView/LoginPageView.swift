//
//  LoginPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct LoginPageView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    @State var textClick = false
    @State var buttonClick = false
    
    @State var gotoRegister = false
    
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
                    )
                    
                    /*
                    NavigationLink(
                        "회원가입", destination: RegisterPageView(shouldPopToRootView: self.$isActive), isActive: self.$isActive
                        )
                        .buttonStyle(buttonDarkStyle())
                      //  .isdetail
                    */
                    NavigationLink(destination: MyPostPageView(), label:{Text("로그인")})
                        .buttonStyle(buttonLightStyle())
                }
                .padding(.horizontal, 20)
                //.fixedSize(horizontal: true, vertical: false)
                
            } .padding()
                .padding(.bottom,100)
                .ignoresSafeArea()
            
        } //.navigationBarHidden(true)
        .accentColor(Color.black)
        .navigationTitle(Text(""))
        
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

func buttonTest(){
    return
}
