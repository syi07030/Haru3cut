//
//  MyPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/23.
//

import SwiftUI

struct MyPageView: View {
 
    var body: some View {
        VStack{
            HStack(spacing:20){
                Image("profile")
                    .frame(width: 70, height: 70, alignment: .center)
                    .cornerRadius(50)
                    .overlay(RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.black, lineWidth: 2))
                Text("\(name)")
                    .font(.title)
                Spacer()
                Button(action:{}){
                    Text("프로필 수정")
                        .padding()
                        .font(.caption)
                        .background(RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 2))
                }.accentColor(Color.pp)
            }
            .padding()
            .frame(height:80)
            
            List{
                Section(header: Text("header"), footer: Text("footer"), content: { Button("친구 관리",action: {})
                    Button("모임 관리",action: {})
                    Button("목표 설정",action: {})
                    Button("자주 쓰는 태그 관리",action: {})
                    Button("일반 설정",action: {})
                    Button("앱/웹/프로젝트 정보",action: {})
                    
                }).listStyle(DefaultListStyle())

            }
        }
    }
}

#if DEBUG
struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        PartyPageView()
    }
}
#endif
