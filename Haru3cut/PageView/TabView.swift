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
    
    @State private var showSearch = false
    @State private var isEditing = false
    @State var searchText = ""
     
     var body: some View {
         ZStack{
         VStack {
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
                 
                 Button(action:{showSearch.toggle()}){
                     Image(systemName: "magnifyingglass")
                     .resizable()
                     .frame(width:25, height:25)
                 }
                     
                     Image("dots")
                     .resizable()
                     .frame(width:40, height:40)
                         
             }
                 .padding()
                 .padding(.top, 70)
                 .frame(height:100)
                 
            Divider()
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
             
             if showSearch{
                 SearchBar(text: $searchText)
             }
            
         }.ignoresSafeArea(.all)
             .navigationBarBackButtonHidden(true)
     }
}

struct topView: View{
    @State private var showSearch = false
    @State private var isEditing = false
    @State var searchText = ""
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
            
            Button(action:{showSearch.toggle()}){
                Image(systemName: "magnifyingglass")
                .resizable()
                .frame(width:25, height:25)
            }
                
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
        
        ZStack{
            if showSearch{
                SearchBar(text: $searchText)
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
 
    @State private var isEditing = false
 
    var body: some View {
        VStack{
        ZStack {
 
            TextField("Search ...", text: $text)
                .padding(7)
                .padding(.horizontal, 25)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal, 10)
                .onTapGesture {
                    self.isEditing = true
                }
                .padding(.top,130)
 
            if isEditing {
                Button(action: {
                    self.text = ""
 
                }) {
                    Image(systemName: "x.circle")
                }
                //.padding(.trailing, 10)
                //.transition(.move(edge: .trailing))
            }
        }
            Spacer()
        }
    }
}
