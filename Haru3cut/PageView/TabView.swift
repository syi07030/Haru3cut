//
//  TabView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/16.
//

import SwiftUI
import UIKit

struct MyTabView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
     
     var body: some View {
         VStack {
            topView()
                 .padding()
                 .padding(.top, 70)
                 .frame(height:100)
                 
            Divider().frame(width:500)
                 .padding(.top,30)
                              
             TabView{
                 MyPostPageView()
                     .tabItem {
                         Image("myDiary").renderingMode(.template)
                         Text("일기")
                     }
                 
                 FriendPostPageView()
                     .tabItem {
                         Image("friend").renderingMode(.template)
                         Text("친구")
                     }
                 
                 PartyPageView()
                     .tabItem {
                         Image("category").renderingMode(.template)
                         Text("모임")
                     }
             }
             .accentColor(Color.pp)
             
             }
             .ignoresSafeArea(.all)
                .navigationBarBackButtonHidden(true)
     }
}

struct topView: View{
    var body: some View{
        HStack(spacing:20){
                Image("profile")
                .frame(width: 70, height: 70, alignment: .center)
                .cornerRadius(50)
                .overlay(RoundedRectangle(cornerRadius: 50)
                            .stroke(Color.black, lineWidth: 2))
                Text("\(name)")
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
                 */
                    
        }
    }
}
