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
    
    @State var gotoRegister = false
    @FocusState private var isFocused: Bool
        
    var body: some View {
        
        NavigationView{
            VStack {
                AppNameText()
//                TextField("E-mail", text: $email, onEditingChanged: { edit in self.textClick = edit }
//                )
                TextField("E-mail", text:$email)
                    .focused($isFocused)
                    .onChange(of: isFocused) { isFocused in
                    .textFieldStyle(TextStyle(focused: isFocused))
                    }
                //    .textFieldStyle(TextStyle(focused: $textClick))
                    .padding(.bottom,10)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 40)
//                            .stroke(Color.error, lineWidth: 2)
//                    )
                SecureField("Password", text: $password)
                    .textFieldStyle(TextStyle(focused: $textClick))
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
            
        }
        .accentColor(Color.black)
        
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
            .tracking(15)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 70)
            .foregroundColor(Color.pp)
    }
}

func buttonTest(){
    return
}
