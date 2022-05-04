//
//  WritingPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/23.
//

import UIKit
import SwiftUI
import TagTextField
import Alamofire
import SwiftyJSON

struct WritingPageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var checkPrivate = true
    @State private var showingAlert = false
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    //@State var tag = ""
    @State var tagClick = false
    
    //@State var tags = [String]()
    @State var keyword = ""
    
    var allTags = ["운동", "일상", "취미"]
    //var resultTag = TagTextField.returnTags(self.tags)
    
    let queue = DispatchQueue.global()
    var textTag = test()
    
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
                 
                 NavigationLink(destination: MyPostPageView(), label:{
                     Button(action: {
                         if test().tags != [] {
                             writingPostMethod(nickName: "test003", nickNameTag: 6881, image: selectedImage!.jpegData(compressionQuality: 0.5)!, tag: textTag.tags, privatePost: true)
                             print("tags:       \(textTag.tags)")
                         } else {
                             print("tags nil")
                             print("textfield tags: \(textTag.returnTag())")
                         }
                     }){
                         Image(systemName: "square.and.arrow.up")
                             .resizable()
                             .frame(width: 25, height: 30)
                             .padding(.bottom,10)
                             .padding(.leading,10)
                     }
                 })}.padding()
                .padding(.top,35)
            
            Divider()
            
            if selectedImage != nil {
                Button(action: {
                    self.showingAlert.toggle()
                },label: {Image(uiImage: selectedImage!)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 300, height: 300)
                })
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
                    .padding()
            } else {
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
            
            textTag
            
        }//.navigationBarTitleDisplayMode(.inline)
        //.edgesIgnoringSafeArea(.top)
        //.navigationBarHidden(true)
        .sheet(isPresented: self.$isImagePickerDisplay){
            ImagePickerView(selectedImage:self.$selectedImage, sourceType: self.sourceType)
        }
    }
}

public struct writingForm: Codable {
    var nickNameTag: Int = 0
    var image: String = ""
    var tag: [String] = [""]
    var privatePost: Bool = true
    var createdAt: String = ""
    var nickName: String = ""
}

func json(from object: Any) -> String? {
    guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
        return nil
    }
    return String(data: data, encoding: String.Encoding.utf8)
}

func writingPostMethod(nickName: String, nickNameTag: Int, image: Data, tag: [String], privatePost: Bool) {
    let header: [String: String] = ["Content-Type":"multipart/form-data"]
    // MARK: - tag preprocessing
    let paramsJSON = JSON(tag)
    let paramsString = paramsJSON.rawString(String.Encoding.utf8, options: JSONSerialization.WritingOptions.prettyPrinted)!
    //let tagString = json(from: tag)!
    
    let param: [String: Any] = [
        "nickName" : nickName,
        "nickNameTag" : nickNameTag,
        "tag": paramsString,
        "privatePost": privatePost
    ]
    AF.upload(multipartFormData: { multipartFormData in
        for (key,value) in param {
            multipartFormData.append("\(value)".data(using: .utf8)!,withName:key, mimeType: "text/plain")
        }
        multipartFormData.append(image, withName:"image", fileName:"\(image).jpg", mimeType: "image/jpg")
    }, to:"http://3.36.88.174:8000/post/newDiary", method: .post)
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

struct CheckBox: ToggleStyle {
    func makeBody(configuration: Configuration) -> some View {
        return HStack{
            configuration.label
            Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                .resizable()
                .frame(width: 22, height: 22)
                .onTapGesture {
                    configuration.isOn.toggle()
                }
        }
    }
}

struct ImagePickerView: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?
    @Environment(\.presentationMode) var isPresented
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = self.sourceType
        imagePicker.delegate = context.coordinator
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(picker: self)
    }
}

class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var picker: ImagePickerView
    
    init(picker: ImagePickerView){
        self.picker = picker
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else { return }
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}

#if DEBUG
struct WritingPageView_Previews: PreviewProvider {
    static var previews: some View {
        WritingPageView()
    }
}
#endif
