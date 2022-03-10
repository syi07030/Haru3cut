//
//  ButtonSmallDesign.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/07.
//

import Foundation
import SwiftUI
import UIKit

class ButtonSmallDesign_light: UIButton {
    
    override init(frame:CGRect){
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView(){
        layer.cornerRadius = 4
        clipsToBounds = true
    }
}

/*
class ButtonSmallDesign_dark: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    init(buttonName: String){
        super.init(frame:CGRect.zero)
        
        self.backgroundColor = UIColor(red: 102/255, green: 103/255, blue: 171/255, alpha: 0.2)
        self.layer.cornerRadius = 2
        self.setTitleColor(.white, for: .normal)
        self.setTitle("\(buttonName)", for: .normal)
    }
}

class ButtonSmallDesign_light: UIButton {
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
}


struct ButtonSmallDesign: View{
    var buttonName: String = ""
    
    var body: some View{
        Button("\(buttonName)", action: buttonTest)
            .textFieldStyle(.roundedBorder)
            .padding()
            
            .border(.black)
    }
}
*/
