//
//  ButtonDesign.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/10.
//

import Foundation
import SwiftUI

struct buttonDarkStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(Color.pp)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
    }
}

struct buttonLightStyle: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(Color.pp)
            .frame(height: 44)
            .frame(maxWidth: .infinity)
            .background(Color.ww)
            .cornerRadius(8)
            .scaleEffect(configuration.isPressed ? 1.2 : 1)
            .animation(.easeOut(duration: 0.2), value: configuration.isPressed)
        
    }
}
