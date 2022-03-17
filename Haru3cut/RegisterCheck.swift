//
//  RegisterCheck.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/16.
//

import Foundation
import SwiftUI

public var name = "aa" //nickName
public var emailAddress = ""
public var pw = ""

public func emailCheck(email: String) -> String{
    let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}$"
    let regex = try? NSRegularExpression(pattern: pattern)
    
    if let _ = regex?.firstMatch(in: email, options: [], range: NSRange(location:0,length:email.count)) {
        emailAddress = email
        return "ok"
    } else {
      return "유효하지 않은 이메일 형식입니다"
}
}
    
public func passwordCheck(password: String) -> String{
    let pattern = "^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+=-]).{7,30}"
    let regex = try? NSRegularExpression(pattern: pattern)
    
    if password.count < 7 {
        return "너무 짧은 암호입니다"
    }
    if let _ = regex?.firstMatch(in: password, options: [], range: NSRange(location:0,length:password.count)){
        pw = password
        return "ok"
    } else {
        return "최소 1자리 이상의 숫자와 특수문자가 필요합니다"
    }
}

public func passwordDoubleCheck(password: String) -> String{
    if password == pw {
        return "ok"
    } else {
        return "암호가 다릅니다"
    }
}

public func nicknameCheck(nickName: String) -> String{
    if nickName == "aa" {
        return "이미 있는 이름입니다"
    } else if nickName.count < 4 {
        return "너무 짧은 이름입니다"
    } else if nickName.count > 12 {
        return "너무 긴 이름입니다"
    } else {
        name = nickName
        return "ok"
    }
}

public func phoneNumberCheck(phoneNumber: String) -> String{
    let pattern = "^01([0-9])([0-9]{3,4})([0-9]{4})$"
    let regex = try? NSRegularExpression(pattern: pattern)
    
    if let _ = regex?.firstMatch(in: phoneNumber, options: [], range: NSRange(location:0,length:phoneNumber.count)) {
        return "ok"
    } else {
        return "유효하지 않은 전화번호입니다"
    }
}
