//
//  MyPostPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI

struct MyPostPageView: View {
    
 //   @Binding var gotoLogin: Bool
 
    var body: some View {
        NavigationView{
            VStack {
                VStack(alignment:.center) {
                    HStack{
                        NavigationLink(destination: LoginPageView(), label:{Image("profile")})
                           .offset(y:3)
                           .frame(width: 50, height: 50, alignment: .leading)
                           .border(.black)
                           .cornerRadius(20)
                        Text("닉네임")
                            .font(.title3)
                            .fontWeight(.semibold)
                        Spacer()
                        NavigationLink(destination: LoginPageView(), label:{Image("search")})
                           .offset(y:3)
                           .frame(width: 70, height: 70, alignment: .leading)
                        NavigationLink(destination: LoginPageView(), label:{Image("dots")})
                           .offset(y:3)
                           .frame(width: 70, height: 70, alignment: .leading)
                        
                    }
                        
                    }
                    .frame(height:100)
                Spacer()
                
                Text("My Post")
                
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
                        
                    }
                    .frame(height:100)
                }
                .padding()
                .ignoresSafeArea()
                
            } .navigationBarHidden(true)
        }
   }

/*
#if DEBUG
struct MyPostPageView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterPageView()
    }
}
#endif
*/
