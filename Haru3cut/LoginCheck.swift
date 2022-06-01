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
    let url = URL+"/login"
    let encoder = JSONEncoder()
    //let login = LoginRequest(email: email, password: password)
    //let loginJsonData = try? encoder.encode(login)
    //let param = ["email" : email,"password" : password]
    let param = ["email" : email,"passWord" : password]
    var message = ""
    if let jsonData = try? encoder.encode(param){
        if let jsonString = String(data:jsonData,encoding: .utf8){
            print(jsonString)
        }
        AF.request(url, method: .post, parameters:param, encoding: JSONEncoding.default).responseJSON(){ response in
            switch response.result{
            case .success:
                if let data = try! response.result.get() as? String{
                    print(data == "로그인 성공")
                    message = "ok"
                    print(message)
                }
            case .failure(let error):
                print("Error:\(error)")
                message = "Error:\(error)"
                //return "fail"
            }
    }
    }else{
        return "fail"
    }
    print("aaaaaaaaaaaa")
    print(message)
    return "ok"
}

struct LoginRequest: Codable {
    var email: String
    var password: String
}
