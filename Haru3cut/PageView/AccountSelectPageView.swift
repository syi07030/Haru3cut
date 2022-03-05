//
//  AccountSelectPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct AccountSelectPageView: View {
    
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack {
            Button("Kakao", action: buttonTest)
                .padding()
                //.border(.black)
                .padding(.bottom,20)
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
               
            Button("Google", action: buttonTest)
                .padding()
                //.border(.black)
                .padding(.bottom,20)
            Button("Apple", action: buttonTest)
                .padding()
                //.border(.black)
                .padding(.bottom,20)
            Button("Instagram", action: buttonTest)
                .padding()
                //.border(.black)
                .padding(.bottom,20)
            Button("Facebook", action: buttonTest)
                .padding()
                //.border(.black)
                .padding(.bottom,20)
            Button("Naver", action: buttonTest)
                .padding()
                //.border(.black)
                .padding(.bottom,20)
            Button("하루세컷", action: buttonTest)
                .padding()
                //.border(.black)
                .padding(.bottom,20)

        }
    }
}

#if DEBUG
struct AccountSelectPageView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSelectPageView()
    }
}
#endif
