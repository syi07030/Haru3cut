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
    let url = "http://3.36.88.174:8000/login"
    let encoder = JSONEncoder()
    //let login = LoginRequest(email: email, password: password)
    //let loginJsonData = try? encoder.encode(login)
    //let param = ["email" : email,"password" : password]
    let param = ["email" : "fnsl2015@naver.com","password" : "cert0188!"]
    if let jsonData = try? encoder.encode(param){
        if let jsonString = String(data:jsonData,encoding: .utf8){
            print(jsonString)
        }
        AF.request(url, method: .post, parameters:param, encoding: JSONEncoding.default).responseJSON(){ response in
            switch response.result{
            case .success:
                if let data = try! response.result.get() as? String{
                    print(data)
                    //return "ok"
                }
            case .failure(let error):
                print("Error:\(error)")
                //return "fail"
            }
    }
    }else{
        return "fail"
    }
    
    /*AF.request(url, method: .post, parameters:jsonData, encoding: URLEncoding.httpBody).responseJSON(){ response in
        switch response.result{
        case .success:
            if let data = try! response.result.get() as? [String: Any] {
                print(data)
                //return "ok"
            }
        case .failure(let error):
            print("Error:\(error)")
            //return "fail"
        }
    }*/
    /*
    let encoder = JSONEncoder()
    let login = LoginRequest(email: email, password: password)
    let loginJsonData = try? encoder.encode(login)
    
    if email == "aa@gmail.com" && password == "aa" {
        return "로그인되었습니다"
    }else {
        return "아이디 또는 비밀번호가 틀렸습니다"
    }
     */
    return "ok"
}

struct LoginRequest: Codable {
    var email: String
    var password: String
}
