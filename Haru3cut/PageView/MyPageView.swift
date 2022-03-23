//
//  MyPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/23.
//

import SwiftUI

struct MyPageView: View {
 
    var body: some View {
        VStack{
            Spacer()
            Text("My page")
            Spacer()
            Divider()
        }
        }
   }

#if DEBUG
struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        PartyPageView()
    }
}
#endif
