//
//  PartyPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/11.
//

import SwiftUI

struct PartyPageView: View {
 
    var body: some View {
        NavigationView{
            VStack {
                VStack(alignment:.center) {
                    HStack{
                        NavigationLink(destination: LoginPageView(), label:{Image("profile")})
                           .offset(y:3)
                           .frame(width: 50, height: 50, alignment: .leading)
                        Text("닉네임")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        NavigationLink(destination: LoginPageView(), label:{Image("search")})
                           .offset(y:3)
                           .frame(width: 50, height: 50, alignment: .leading)
                        NavigationLink(destination: LoginPageView(), label:{Image("dots")})
                           .offset(y:3)
                           .frame(width: 50, height: 50, alignment: .leading)
                        
                    }
                        
                    } .padding(.top, 50)
                    .padding(0)
                    .frame(height:100)
                Spacer()
                
                Text("Party")
                
                Spacer()
                
                VStack(alignment:.center) {
                    HStack{
                        NavigationLink(destination: MyPostPageView(),
                                       label:{
                            VStack{
                                Image("myDiary")
                                Text("일기")
                            }
                            
                        })
                           .offset(y:3)
                           .frame(width: 50, height: 50, alignment: .center)
                        
                        Spacer()
                        
                        NavigationLink(destination: FriendPostPageView(),
                                       label:{
                            VStack{
                                Image("friend")
                                Text("친구")
                            }
                            
                        })
                           .offset(y:3)
                           .frame(width: 50, height: 50, alignment: .center)
                        
                        Spacer()
                        
                        NavigationLink(destination: PartyPageView(),
                                       label:{
                            VStack{
                                Image("category")
                                Text("모임")
                            }
                            
                        })
                           .offset(y:3)
                           .frame(width: 50, height: 50, alignment: .center)
                        
                    }
                        
                    } .padding(.bottom, 50)
                    .padding(0)
                    .frame(height:100)
                
                
                }
                .padding()
                .ignoresSafeArea()
                
            } .navigationBarHidden(true)
        }
   }

#if DEBUG
struct PartyPageView_Previews: PreviewProvider {
    static var previews: some View {
        PartyPageView()
    }
}
#endif
