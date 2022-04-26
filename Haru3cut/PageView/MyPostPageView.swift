//
//  MyPostPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI
import Alamofire
import Combine

/*
extension UIImageView {
    func load(url: URL){
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url){
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                } else {
                    print("uiimage image error")
                }
            } else {
                print("uiimage data error")
            }
        }
    }
}*/
struct MyDiaryRow: View{
    //@StateObject private var imageLoader = URLImageLoader()
    var diary: postResult
    //var image: UIImageView!
    var body: some View{
        VStack{
            HStack{
                Image("profile")
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(50)
                    .overlay(RoundedRectangle(cornerRadius: 50)
                    .stroke(Color.black, lineWidth: 2))
                VStack{
                    Text("\(diary.nickName)")
                    Text("#\(diary.nickNameTag)")
                }
                Spacer()
                Image(systemName: "eye.slash.fill")
                Image(systemName: "pencil")
                //Text("tags: \(diary.tag)")
            }
            
            HStack{
                ForEach(diary.tag, id: \.self ){ tag in
                    Text("\(tag)")
                }
                Spacer()
            }
            //image.load(url: URL(string: diary.image)!)
            AsyncImage(url:URL(string:diary.image)!){ image in
                image.resizable()
            } placeholder: {
                Color.ww
            }
            .frame(width: 300, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 25))
            //Image(diary.image)
                //.resizable()
                //.frame(width: 300, height: 300)
                //.padding(.bottom,10)
                //.padding(.leading,10)
            //Text("image: \(diary.image)")
        }
    }
}

struct MyPostPageView: View {
    @State var searchText = ""
    
    let postResults = postMethod()
    
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
                    List(postResults) { result in
                        MyDiaryRow(diary: result)
                        /*ForEach(postResults, id: \.self) { diary in
                            Text(diary)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .listRowBackground(Color(UIColor.systemGray6))
                        }*/
                         
                    }
                    .listStyle(.inset)
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

public struct postResult: Identifiable { //codable로,,
    var nickNameTag: Int = 0
    var avatar: String = ""
    public var id: String = ""
    var image: String = ""
    var tag: [String] = [""]
    var privatePost: Bool = true
    var createdAt: String = ""
    var updatedAt: String = ""
    var nickName: String = ""
}

/*struct APIResponse: Codable {
    let postResults: [postResult]
}*/

public var results = [postResult]()

func postMethod() -> [postResult] {
    //var results = [postResult]()
    let param: [String:Any] = ["nickName" : "test003","nickNameTag" : 6881]
    //var results = [postResult]()
    AF.request("http://3.36.88.174:8000/post/getMyDiary", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
        switch AFdata.result {
        case .success(let obj):
            do {
                //print(obj)
                if let nsDictionary = obj as? NSDictionary {
                    for (key,value) in nsDictionary {
                        //print("key: \(key), value: \(value)")
                    }
                    
                    if let result = nsDictionary["result"] {
                        //print(result)
                        
                        if let array = result as? NSArray {
                            for i in array {
                                //print(i)
                                var r = postResult()
                                if let resultDictionary = i as? NSDictionary {
                                    for (key,value) in resultDictionary {
                                        //print("key: \(key), value: \(value)")
                                    }
                                    //nickNameTag
                                    if let nickNameTag = resultDictionary["nickNameTag"] as? Int{
                                        r.nickNameTag = nickNameTag
                                    } else {
                                        print("error in nickNameTag")
                                    }
                                    //avatar
                                    if let avatar = resultDictionary["avatar"] as? String{
                                        r.avatar = avatar
                                    } else {
                                        print("error in avatar")
                                    }
                                    //id
                                    if let id = resultDictionary["id"] as? String{
                                        r.id = id
                                    } else {
                                        print("error in image")
                                    }
                                    //image
                                    if let image = resultDictionary["image"] as? String{
                                        r.image = image
                                    } else {
                                        print("error in image")
                                    }
                                    //tag
                                    if let tag = resultDictionary["tag"] as? [String]{
                                        r.tag = tag
                                    } else {
                                        print("error in tag")
                                    }
                                    //privatePost
                                    if let privatePost = resultDictionary["privatePost"] as? Bool{
                                        r.privatePost = privatePost
                                    } else {
                                        print("error in privatePost")
                                    }
                                    //createdAt
                                    if let createdAt = resultDictionary["createdAt"] as? String{
                                        r.createdAt = createdAt
                                    } else {
                                        print("error in createdAt")
                                    }
                                    //updatedAt
                                    if let updatedAt = resultDictionary["updatedAt"] as? String{
                                        r.updatedAt = updatedAt
                                    } else {
                                        print("error in updatedAt")
                                    }
                                    //nickName
                                    if let nickName = resultDictionary["nickName"] as? String{
                                        r.nickName = nickName
                                    } else {
                                        print("error in nickName")
                                    }
                                    //print(result)
                                    if results.filter{$0.image == r.image}.count == 0 {
                                        results.append(r)
                                    }
                                } else {
                                    print("error in resultDictionary")
                                }
                                print("***************************************************** ")
                                print(results)
                                //print(type(of: results))
                                //print(results[0])
                                //print(results)
                                //results.append(result)
                            }
                        } else {
                            print("error in array")
                        }
                    } else {
                        print("error result")
                    }
                } else {
                    print("error type casting to nsdictionary")
                }
                
                let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                //print(dataJson)
                let test = try dataJson as? [String:Any]
                //print(test)
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
        print("$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$")
        print(results)
        
    }
    print("----------------------------------------------")
    print(results)
    return results
}


/*func postMethod2() -> String {
    let param: [String:Any] = ["nickName" : "test003","nickNameTag" : 6881]
    var results = [postResult]()
    AF.request("http://3.36.88.174:8000/post/getMyDiary", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
        switch AFdata.result {
        case .success(let obj):
            do {
                let dataJson = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                let getInstanceData = try JSONDecoder().decode(APIResponse.self, from: dataJson)
                
                print(getInstanceData)
            } catch{
            print(error.localizedDescription)
            }
            
        default:
            print("통신 실패")
            return
        }
    }
    return ""
}*/



#if DEBUG
struct MyPostPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPostPageView()
    }
}
#endif
