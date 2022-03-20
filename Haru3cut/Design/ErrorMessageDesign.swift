//
//  ErrorMessageDesign.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/17.
//

import Foundation
import SwiftUI

struct TextFieldErrorMessage: View{
    @State var errorMessage: String
    @State var errorMessageColor = Color.error
    
    var body: some View{
        Text("\(errorMessage)")
            .onChange(of: errorMessage, perform: { value in
                if errorMessage == "ok" {
                    errorMessageColor = Color.green
                } else { errorMessageColor = Color.error }
            })
            .foregroundColor(errorMessageColor)
            .padding(.leading)
    }
}
