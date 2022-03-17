//
//  FriendPostPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/10.
//

import SwiftUI

struct FriendPostPageView: View {
 
    var body: some View {
        VStack{
            Spacer()
            Text("My friends")
            Spacer()
            Divider()
        }
        }
   }

#if DEBUG
struct FriendPostPageView_Previews: PreviewProvider {
    static var previews: some View {
        FriendPostPageView()
    }
}
#endif
