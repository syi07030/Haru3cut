//
//  WritingPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/23.
//

import UIKit
import SwiftUI
import TagTextField

struct WritingPageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var checkPrivate = true
    @State private var showingAlert = false
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    @State var tag = ""
    @State var tagClick = false
    
    @State var tags = [String]()
    @State var keyword = ""
    
    var allTags = ["운동", "일상", "취미"]
    
    var theme: TagTheme {
           return TagTheme(font: Font.system(size: 15), foregroundColor: Color.white, backgroundColor: Color.black, borderColor: Color.white, shadowColor: Color.green, deletable: false, deleteButtonSize: 10, deleteButtonColor: Color.yellow, spacing: 5, alignment: .leading, inputFieldTextColor: Color.black)
       }
    
    @ViewBuilder
        var searchView: some View {
            HStack(alignment: .top, spacing: 10) {
                Text("To")
                    .padding(.top, 4)
                TagTextField(tags: $tags, keyword: $keyword, theme: self.theme, placeholder: "Tags") { _ in
                    return allTags.filter{$0.lowercased().contains(keyword.lowercased()) == true}.first
                }
                .padding(6)
                .background(Color(.sRGB, red: 224.0/255.0, green: 224.0/255.0, blue: 225.0/255.0, opacity: 1))
                .clipShape(RoundedRectangle(cornerRadius: 16))
            }
            .padding(16)
        }
        
        @ViewBuilder
        var searchResultView: some View {
            if (allTags.filter{$0.lowercased().contains(keyword.lowercased()) == true}).count > 0 {
                List {
                    ForEach((allTags.filter{$0.lowercased().contains(keyword.lowercased()) == true}), id: \.self) { tag in
                        Button(action: {
                            if tags.contains(tag) == false {
                                tags.append(tag)
                            }
                            keyword = ""
                        }, label: {
                            Text(tag)
                                .padding()
                        })
                        .listRowInsets(EdgeInsets(top: 16, leading: 16, bottom: 16, trailing: 16))
                    }
                }
            }
            else {
                VStack(alignment: .center, spacing: 0) {
                    Spacer()
                    
                    Text("No tags found")
                        .font(Font.system(size: 16))
                        .foregroundColor(Color.secondary)
                        .padding(.top, 20)
                    
                    Spacer()
                }
            }
        }
    
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
                        //self.presentation.wrappedValue.dismiss()
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
            
            searchView
            searchResultView
            
            ScrollView{
                ForEach(0..<20, id:\.self){ num in
                    HStack{
                        Text("\(num)").padding()
                        Spacer()
                    }
                }
            } .background(Color.ww)
                .padding(.leading)
                .padding(.trailing)
            Spacer()
            
        }//.navigationBarTitleDisplayMode(.inline)
        .edgesIgnoringSafeArea(.top)
        //.navigationBarHidden(true)
        .sheet(isPresented: self.$isImagePickerDisplay){
            ImagePickerView(selectedImage:self.$selectedImage, sourceType: self.sourceType)
        }
    }
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
