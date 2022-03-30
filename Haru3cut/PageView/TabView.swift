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
    
     var body: some View {
         //NavigationView{
         ZStack {
             VStack {
                 TabView() {
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
                     MyPageView()
                         .tabItem {
                             Image(systemName: "person.fill")
                             Text("마이페이지")
                         }
                 }
                 .accentColor(Color.pp)
                
             }
         }
         //}
     }
}

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ...", text: $text)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    .foregroundColor(.primary)
                if isEditing {
                    Button(action: {
                        self.text = ""
                    }) {
                    Image(systemName: "x.circle")
                }
            }
        }
        .padding(7)
        .foregroundColor(.secondary)
        .background(Color(UIColor.systemGray6))
        .cornerRadius(8)
        }
    }
}
