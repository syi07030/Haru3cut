//
//  test.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/04/04.
//

import SwiftUI

struct test: View {
 
    var body: some View {
        NavigationView{
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
                        .border(Color.pp)
                }.accentColor(Color.pp)
            }
            .padding()
            .frame(height:85)
            
            List{
                Text("hi")
                Text("hello0")
                Text("test")
            }
            /*
            List{
                Section(header: Text("친구 관리"), content: {
                    NavigationLink(destination: DetailPageView(message: "친구 추가"), label: {Text("친구 추가")})
                    Button("친구 삭제",action: {})
                    Button("친구 차단",action: {})
                })
                .listRowSeparator(.hidden)
                //.padding(.top,10)
                Section(header: Text("모임 관리"), content: {
                    Button("모임 가입",action: {})
                    Button("모임 탈퇴",action: {})
                    Button("모임 생성",action: {})
                    Button("모임 검색",action: {})
                })
                Section(header: Text("목표 설정"), content: {
                    Button("목표 추가",action: {})
                    Button("목표 수정",action: {})
                })
                Section(header: Text("태그 관리"), content: {
                    Button("태그 추가",action: {})
                    Button("태그 삭제",action: {})
                    Button("태그 순서 변경",action: {})
                })
                Section(header: Text("일반 설정"), content: {
                    Button("화면 모드 설정",action: {})
                    Button("알림 설정",action: {})
                    Button("언어 설정",action: {})
                    Button("로그아웃",action: {})
                    Button("회원탈퇴",action: {})
                })
                Section(header: Text("정보"), content: {
                    Button("앱 정보",action: {})
                    Button("웹 정보",action: {})
                    Button("프로젝트 정보",action: {})
                })
            }
            .listStyle(SidebarListStyle())*/
            
        }
        //.hiddenNavigationBarStyle()
            
        }
    }
}

#if DEBUG
struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
#endif
