//
//  PartyPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/11.
//

import SwiftUI

struct PartyPageView: View {
 
    var body: some View {
        VStack{
            Spacer()
            Text("My party")
            Spacer()
            Divider()
        }
        }
   }

#if DEBUG
struct PartyPageView_Previews: PreviewProvider {
    static var previews: some View {
        PartyPageView()
    }
}
#endif
