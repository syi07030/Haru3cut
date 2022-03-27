//
//  LoginCheck.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/16.
//

import Foundation
import SwiftUI
import Alamofire

func loginCheck(email: String, password: String) -> String {
    let encoder = JSONEncoder()
    let login = LoginRequest(email: email, password: password)
    let loginJsonData = try? encoder.encode(login)
    
    if email == "aa@gmail.com" && password == "aa" {
        return "로그인되었습니다"
    }else {
        return "아이디 또는 비밀번호가 틀렸습니다"
    }
}

struct LoginRequest: Codable {
    var email: String
    var password: String
}
