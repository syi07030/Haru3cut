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
   //          .padding(.top,30)
             .accentColor(Color.pp)
             
             }
             .ignoresSafeArea(.all)
                .navigationBarBackButtonHidden(true)
     }

/*    var body: some View{
        VStack{
            VStack(alignment:.center) {

                topView()

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
            
            .onAppear(){
                UITabBar.appearance().backgroundColor = .black
                UITabBar.appearance().barTintColor = .red
                    }
            
            .accentColor(Color.pp)
            .edgesIgnoringSafeArea(.bottom)
        }
        .navigationBarTitle("", displayMode: .automatic)
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        .ignoresSafeArea()
 
    }*/
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
