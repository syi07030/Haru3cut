//
//  MyPostPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct MyPostPageView: View {
     
    var body: some View {
        ZStack(alignment: .bottomTrailing){
            VStack{
                Spacer()
                Text("My post")
                Spacer()
                Divider()
            }
            
            writingButton().padding()
            
        }
   }
}

struct writingButton: View{
    var body: some View{
        Button(action: {

        }) {
            Image(systemName: "pencil")
                .padding()
                .background(Color.pp)
                .clipShape(Circle())
                .font(.largeTitle)
                .foregroundColor(.white)
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
