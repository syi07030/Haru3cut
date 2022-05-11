//
//  MyPostPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/03.
//

import SwiftUI
import Alamofire
import Combine

struct MyDiaryRow: View{
    @State var diary: postResult
    //@State var postID = diary.id
    //@State var nickName = diary.nickName
    //@State var nickNameTag = diary.nickNameTag
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
                NavigationLink(destination: GetOneDiaryPageView(diary: $diary), label:{
                    Image(systemName: "pencil")
                })
                .padding()
            }
            
            HStack{
                ForEach(diary.tag, id: \.self ){ tag in
                    Text("\(tag)")
                }
                Spacer()
            }
            AsyncImage(url:URL(string:diary.image)!){ image in
                image.resizable()
            } placeholder: {
                Color.ww
            }
            .frame(width: 300, height: 300)
            .clipShape(RoundedRectangle(cornerRadius: 25))
        }
    }
}

struct MyPostPageView: View {
    @State var searchText = ""
    @State var diary: postResult
    let postResults = postMethod()
    
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
                        //MyDiaryRow(diary: result)
                        $diary = result
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
                                NavigationLink(destination: GetOneDiaryPageView(diary: $diary), label:{
                                    Image(systemName: "pencil")
                                })
                                .padding()
                            }
                            
                            HStack{
                                ForEach(diary.tag, id: \.self ){ tag in
                                    Text("\(tag)")
                                }
                                Spacer()
                            }
                            AsyncImage(url:URL(string:diary.image)!){ image in
                                image.resizable()
                            } placeholder: {
                                Color.ww
                            }
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 25))
                        }
                    }
                    .listStyle(.inset)
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
    let url = "http://3.36.88.174:8000/diary/getMyDiary"
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

public var results = [postResult]()

func postMethod() -> [postResult] {
    let param: [String:Any] = ["nickName" : "test003","nickNameTag" : 6881]
    AF.request("http://3.36.88.174:8000/diary/getMyDiary", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
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
