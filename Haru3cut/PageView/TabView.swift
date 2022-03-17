//
//  TabView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/16.
//

import SwiftUI
import UIKit

struct MyTabView: View {
    var body: some View{
        VStack{
        VStack(alignment:.center) {
            HStack(spacing:20){
                    Image("profile")
                    .frame(width: 70, height: 70, alignment: .center)
                    .cornerRadius(50)
                    .overlay(RoundedRectangle(cornerRadius: 50)
                                .stroke(Color.black, lineWidth: 2))
                    Text("aa")
                    .font(.title)
                    Spacer()
                    Image(systemName: "pencil")
                    .resizable()
                    .frame(width:25, height:25)
                    .padding()
                    Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width:25, height:25)
                    Image("dots")
                    .resizable()
                    .frame(width:40, height:40)
                    /*
                        NavigationLink(destination: LoginPageView(), label:{Image(systemName: "person.circle")})
                           .offset(y:3)
                           .border(Color.black)
                           .frame(width: 50, height: 50, alignment: .leading)
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
                     */
                        
            }.padding()
                        
                    }
        .frame(height:80)
        Divider().frame(height:2).background(Color.black)
        
        Spacer()
        
        TabView {
            MyPostPageView()
                .tabItem {
                    Image(systemName: "person.crop.rectangle.stack")
                    Text("일기")
                }
            FriendPostPageView()
                .tabItem {
                    Image(systemName: "person.3.fill")
                    Text("친구")
                }
            PartyPageView()
                .tabItem {
                    Image(systemName: "camera.filters")
                    Text("모임")
                }
        }
        .navigationBarTitle("", displayMode: .automatic)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
        
        .onAppear(){
            UITabBar.appearance().backgroundColor = .black
            UITabBar.appearance().barTintColor = .red
                }
        
        .accentColor(Color.pp)
        .edgesIgnoringSafeArea(.bottom)
        }
    }
    
}
