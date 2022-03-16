//
//  TabView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/16.
//

import SwiftUI

struct MyTabView: View {
    var body: some View{
        
        VStack(alignment:.center) {
            HStack{
                NavigationLink(destination: LoginPageView(), label:{Image("profile")})
                   .offset(y:3)
                   .frame(width: 50, height: 50, alignment: .leading)
                   .border(.black)
                   .cornerRadius(20)
                Text("닉네임")
                    .font(.title3)
                    .fontWeight(.semibold)
                Spacer()
                NavigationLink(destination: LoginPageView(), label:{Image("search")})
                   .offset(y:3)
                   .frame(width: 70, height: 70, alignment: .leading)
                NavigationLink(destination: LoginPageView(), label:{Image("dots")})
                   .offset(y:3)
                   .frame(width: 70, height: 70, alignment: .leading)
                
            }
                
            }
            .frame(height:100)
        
        TabView {
            
            MyPostPageView()
                .tabItem{
                    Image(systemName: "myDiary")
                    Text("일기")
                }
            
            FriendPostPageView()
                .tabItem{
                    Image(systemName: "friend")
                    Text("친구")
                }
            
            PartyPageView()
                .tabItem{
                    Image(systemName: "category")
                    Text("모임")
                }
            
        }
    }
}
