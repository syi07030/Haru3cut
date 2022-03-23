//
//  FriendPostPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/10.
//

import SwiftUI

struct FriendPostPageView: View {
    @State var searchText = "" 
    var body: some View {
        VStack {
            HStack(spacing: 10) {
                SearchBar(text: $searchText)
            }
                .padding()
                .frame(height: 40)
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
