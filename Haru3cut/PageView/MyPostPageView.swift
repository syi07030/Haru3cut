//
//  MyPostPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct MyPostPageView: View {
     
    var body: some View {
        VStack{
            Spacer()
            Text("My post")
            Spacer()
            Divider()
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
