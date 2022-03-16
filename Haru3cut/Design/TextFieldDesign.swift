//
//  TextFieldDesign.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/07.
//

import Foundation
import SwiftUI


struct TextStyle: TextFieldStyle{
    @Binding var focused: Bool
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            //.background(Color.ww)
            .cornerRadius(8)
            .background(
                Rectangle()
                    .stroke(focused ? Color.error : Color.ww, lineWidth: 2)
            )
            
        }
}


/*
struct TextStyle: TextFieldStyle{
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(10)
            //.background(Color.ww)
            .cornerRadius(8)
            .background(
                Rectangle()
                    .stroke(Color.ww, lineWidth: 2)
            )
            
        }
}
*/
