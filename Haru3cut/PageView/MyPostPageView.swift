//
//  MyPostPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct MyPostPageView: View {
    @State var searchText = ""
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    HStack(spacing: 10) {
                        SearchBar(text: $searchText)
                    }
                        .padding()
                        //.padding(.top,30)
                        .frame(height: 40)
                    Spacer()
                    Text("My post")
                    Spacer()
                    Divider()
                }
                //.ignoresSafeArea()
                .navigationBarTitle("")
                .navigationBarHidden(true)
                
                NavigationLink(destination: WritingPageView(), label:{
                    Image(systemName: "pencil")
                        .padding()
                        .background(Color.pp)
                        .clipShape(Circle())
                        .font(.largeTitle)
                        .foregroundColor(.white)})
                    .padding()
                    .navigationTitle("")
                    .navigationBarTitle("",displayMode: .inline)
                    .navigationBarHidden(true)
            }
        }
    }
}

#if DEBUG
struct MyPostPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostPageView()
    }
}
#endif
