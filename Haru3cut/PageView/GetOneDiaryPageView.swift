//
//  GetOneDiaryPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/05/04.
//

import Foundation
import SwiftUI
import Alamofire
import SwiftyJSON

struct GetOneDiaryPageView: View {
    
    @Binding var postID: String
    @Binding var nickName: String
    @Binding var nickNameTag: Int
    //@Binding var image: String
    //@Binding var privatePost: Bool
    //@Binding var tag: [String]
    @Environment(\.presentationMode) var presentationMode
    @State private var checkPrivate = true
    @State private var showingAlert = false
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    let postResults = GetOneDiary(postID: self.postID, nickName: self.nickName, nickNameTag: self.nickNameTag)
    
    var body: some View {
        VStack{
             HStack{
                Text("글쓰기")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.leading,25)
                    Spacer()
                    Toggle("공개", isOn: $checkPrivate)
                        .toggleStyle(CheckBox())
                             
                    Button(action: {
                        updateDiary(postID: postResults.id, nickName: postResults.nickName, nickNameTag: postResults.nickNameTag, image: selectedImage!.jpegData(compressionQuality: 0.5)!, tag: [], privatePost: true)
                    }){
                        Image(systemName: "square.and.arrow.up")
                            .resizable()
                            .frame(width: 25, height: 30)
                            .padding(.bottom,10)
                            .padding(.leading,10)
                    }
            }.padding()
                .padding(.top,35)
            
            Divider()
    
            //사진에 postResults.image 들어가야 함
                Button(action: {
                    self.showingAlert.toggle()
                },label: {Text("Add Image")})
                    .alert("사진을 선택하세요", isPresented: $showingAlert){
                        Button("camera", action: {
                            self.sourceType = .camera
                            self.isImagePickerDisplay.toggle()
                        })
                        Button("gallery", action: {
                            self.sourceType = .photoLibrary
                            self.isImagePickerDisplay.toggle()
                        })
                        Button("cancel", action: {})
                    }
                    .frame(width:300,height:300)
                    .border(Color.pp)
                    .foregroundColor(Color.pp)
                    .background(Color.white)
                    .padding()
            }
            
        //tag에 postResults.tag 들어가야 함
            test()
        
        Button(action: {
            deleteDiary(postID: postResults.id, nickName: postResults.nickName, nickNameTag: postResults.nickNameTag)
        }, label: {
            Text("DELETE")
        })
        }//.navigationBarTitleDisplayMode(.inline)
        //.edgesIgnoringSafeArea(.top)
        //.navigationBarHidden(true)
        //.sheet(isPresented: self.$isImagePickerDisplay){
        //    ImagePickerView(selectedImage:self.$selectedImage, sourceType: self.sourceType)
}

public var getOneDiaryResult = postResult()

func GetOneDiary(postID: String, nickName: String, nickNameTag: Int) -> postResult {
    let param: [String:Any] = ["_id" : postID, "nickName" : nickName,"nickNameTag" : nickNameTag]
    AF.request("http://3.36.88.174:8000/diary/getOneDiary", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { AFdata in
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
                                    /*
                                    if results.filter{$0.image == r.image}.count == 0 {
                                        results.append(r)
                                    }*/
                                    getOneDiaryResult = r
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
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
        default:
            return
        }
    }
    print("----------------------------------------------")
    print(getOneDiaryResult)
    return getOneDiaryResult
}


func updateDiary(postID: String, nickName: String, nickNameTag: Int, image: Data, tag: [String], privatePost: Bool) {
    let header: [String: String] = ["Content-Type":"multipart/form-data"]
    // MARK: - tag preprocessing
    let paramsJSON = JSON(tag)
    let paramsString = paramsJSON.rawString(String.Encoding.utf8, options: JSONSerialization.WritingOptions.prettyPrinted)!
    //let tagString = json(from: tag)!
    
    let param: [String: Any] = [
        "postID" : postID,
        "nickName" : nickName,
        "nickNameTag" : nickNameTag,
        "tag": paramsString,
        "privatePost": privatePost
    ]
    AF.upload(multipartFormData: { multipartFormData in
        for (key,value) in param {
            multipartFormData.append("\(value)".data(using: .utf8)!,withName:key, mimeType: "text/plain")
        }
        if image != nil { //image에 파일이 없을 경우
        multipartFormData.append(image, withName:"image", fileName:"\(image).jpg", mimeType: "image/jpg")
        }
    }, to:"http://3.36.88.174:8000/diary/updateDiary", method: .post)
    .responseJSON(){ response in
        switch response.result{
        case .success:
            if let data = try! response.result.get() as? String{
                print("\(data)")
            }
        case .failure(let error):
            print("Error:\(error)")
        }
    }
    return
}

func deleteDiary(postID: String, nickName: String, nickNameTag: Int) {
    let param: [String: Any] = [
        "_id" : postID,
        "nickName" : nickName,
        "nickNameTag" : nickNameTag
    ]
    AF.request("http://3.36.88.174:8000/diary/deleteDiary", method: .post, parameters: param, encoding: JSONEncoding.default, headers: nil).validate(statusCode: 200 ..< 299).responseJSON { response in
        switch response.result {
        case .success:
            print("Success Delete")
        default:
            print("Error in Delete")
        }
    }
    return
}
