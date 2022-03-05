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
    
    var body: some View {
        VStack {
            AppNameText()
            TextField("E-mail", text: $email)
                .padding()
                .padding(.bottom,20)
                .textFieldStyle(.plain)
            SecureField("Password", text: $password)
                .padding()
                .padding(.bottom,20)
                .textFieldStyle(.plain)
            button()
            
        }
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
            .padding(.bottom, 50)
    }
}

struct button: View {
    var body: some View {
        HStack(
            alignment: .bottom,
            spacing: 10
        ){
            Button("회원가입", action: buttonTest)
             .padding()
             .border(.black)
            Button("로그인", action: buttonTest)
             .padding()
             .border(.black)
        }
    }
}

func buttonTest(){
    return
}
