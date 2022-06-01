//
//  PostCheck.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/04/13.
//

/*
import Foundation
import SwiftUI
import Alamofire

func postSave(nickName: String, nickNameTag: String, image: String, tag: String, privatePost: Bool) -> String {
    let url = URL+"/post" //확인 필요
    let encoder = JSONEncoder()
    
    let param = ["nickName" : nickName, "nickNameTag" : nickNameTag, "image" : image, "tag": tag, "privatePost" : privatePost, "createdAt" : "" , "updatedAt" : ""] as [String : String]
    
    var message = ""
    if let jsonData = try? encoder.encode(param){
        if let jsonString = String(data:jsonData,encoding: .utf8){
            print(jsonString)
        }
        AF.request(url, method: .post, parameters:param, encoding: JSONEncoding.default).responseJSON(){ response in
            switch response.result{
            case .success:
                if let data = try! response.result.get() as? String{
                    message = "ok"
                }
            case .failure(let error):
                message = "Error:\(error)"
                //return "fail"
            }
    }
    } else {
        return "fail"
    }
    
    print(message)
    return "ok"
}

func postShow() -> [Dictionary<String,String>] {
    let url = URL+"/post" //확인 필요
    let decoder = JSONDecoder()
    var returnJson = [Dictionary<String,String>]()
    
    let almo = AF.request(url, method: .post).validate(statusCode: 200..<300)
    
    almo.responseJSON(){ response in
        switch response.result
        {
        case .success(let value):
            
            if let jsonObj = value as? [Dictionary<String,String>]
            {
                returnJson = jsonObj
            }
            
        case .failure(let error):
            print("error: \(String(describing: error.errorDescription))")
        }
    }
    
    return returnJson
  
    /*
    AF.request(url).responseJson { (response) in
        switch response.result {
        case .success(let res):
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
            }
        }
    }*/
}

struct PostRequest: Codable {
    var nickName: String
    var nickNameTag: String
    var image: String
    var tag: String
    var privatePost: String //bool 형태일 경우 위에서 params value 값이 any가 되어버리고 encoding을 할 수가 없음
    var createdAt: String
    var updatedAt: String
}
*/
