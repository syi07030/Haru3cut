//
//  MyPostPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI
import Alamofire

struct MyPostPageView: View {
    @State var searchText = ""
    
    //let almo = AF.request("http://3.36.88.174:8000/mock/postall",method: .post).validate(statusCode: 200..<300)
    
    var body: some View {
        NavigationView{
            ZStack(alignment: .bottomTrailing) {
                VStack {
                    HStack(spacing: 10) {
                        SearchBar(text: $searchText)
                    }
                        .padding()
                        .frame(height: 40)
                    Spacer()
                    Text("\(postMethod2())")
                   /* List {
                        ForEach(allTags, id: \.self) { tag in
                            Button(action: {
                                if tags.contains(tag) == false {
                                    tags.append(tag)
                                }
                            }, label: {
                                Text(tag)
                                    .padding()
                            })
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .listRowBackground(Color(UIColor.systemGray6))
                        }
                    }
                    .listStyle(.inset)*/
                    //Text("\(postShow())")
                    //Text("My post")
                    Spacer()
                    Divider()
                }
                
                NavigationLink(destination: WritingPageView(), label:{
                    Image(systemName: "pencil")
                        .padding()
                        .background(Color.pp)
                        .clipShape(Circle())
                        .font(.largeTitle)
                        .foregroundColor(.white)})
                    .padding()
            }
            .hiddenNavigationBarStyle()
        }
    }
}

func postShow() -> String {
    let url = "http://3.36.88.174:8000/post/getMyDiary"
    let param: [String:Any] = ["nickName" : "test003","nickNameTag" : 6881]
    let encoder = JSONEncoder()
    let decoder = JSONDecoder()
    var str = ""
    //var returnJson = [Dictionary<String,String>]()
    
    let almo = AF.request(url, method: .post, parameters:param, encoding: JSONEncoding.default).validate(statusCode: 200..<300)
    
    almo.responseJSON(){ response in
        switch response.result
        {
        case .success(let value):
            
            if let jsonObj = value as? [Dictionary<String,Any>]
            {
                print("success")
                str = "success"
            }
            
        case .failure(let error):
            print( "error: \(String(describing: error.errorDescription))")
            str = "error"
        }
    }
    
    //return returnJson
  
    /*
    AF.request(url).responseJson { (response) in
        switch response.result {
        case .success(let res):
            do {
                let jsonData = try JSONSerialization.data(withJSONObject: res, options: .prettyPrinted)
            }
        }
    }*/
    return str
}

struct postResult: Codable {
    var nickNameTag: Int
    var avatar: String
    var id: String
    var image: String
    var tag: [String]
    var privatePost: Bool
    var createdAt: String
    var updatedAt: String
    var nickName: String
}

struct APIResponse: Codable {
    let postResults: [postResult]
}

func postMethod() -> String {
    let param: [String:Any] = ["nickName" : "test003","nickNameTag" : 6881]
    AF.request("http://3.36.88.174:8000/post/getMyDiary", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
        switch AFdata.result {
        case .success(let obj):
            do {
                print(AFdata.data!)
                let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                print(dataJson)
                let test = try dataJson as? [String:Any]
                print(test)
             /*   let getData = try JSONDecoder().decode(APIResponse.self, from:dataJson)
                for result in getData.postResults{
                    print(result)
                }*/
                /*
                guard let jsonObject = try JSONSerialization.jsonObject(with: AFdata.data!) as? [String: Any] else {
                    print("Error: Cannot convert data to JSON object")
                    return
                }
                print("------------------------------------------------")
                print(jsonObject)
                guard let prettyJsonData = try? JSONSerialization.data(withJSONObject: jsonObject, options: .prettyPrinted) else {
                    print("Error: Cannot convert JSON object to Pretty JSON data")
                    return
                }
                print("------------------------------------------------")
                print(prettyJsonData)
                guard let prettyPrintedJson = String(data: prettyJsonData, encoding: .utf8) else {
                    print("Error: Could print JSON in String")
                    return
                }
                print("------------------------------------------------")
                print(prettyPrintedJson)


                guard let results = try? JSONDecoder().decode(APIResponse.self,from:prettyJsonData) else{
                    print("error error error")
                    return
                }
                */
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        default:
            return
        }
        
    }
    return ""
}


func postMethod2() -> String {
    let param: [String:Any] = ["nickName" : "test003","nickNameTag" : 6881]
    AF.request("http://3.36.88.174:8000/post/getMyDiary", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseDecodable(of:APIResponse.self) { response in
        print(response)
        guard let result = response.value else {
            print("ERROR")
            return}
        print(result.postResults[0].nickName)
        
    }
    return ""
}



#if DEBUG
struct MyPostPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostPageView()
    }
}
#endif
