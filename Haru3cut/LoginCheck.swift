//
//  LoginCheck.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/16.
//

import Foundation
import SwiftUI

func loginCheck(email: String, password: String) -> String {
    if email == "aa" && password == "aa" {
        return "로그인되었습니다"
    }else {
        return "아이디 또는 비밀번호가 틀렸습니다"
    }
}
