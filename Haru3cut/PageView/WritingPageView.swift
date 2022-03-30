//
//  WritingPageView.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/23.
//

import UIKit
import SwiftUI

struct WritingPageView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var checkPrivate = true
    
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var selectedImage: UIImage?
    @State private var isImagePickerDisplay = false
    
    var body: some View {
        VStack{
             HStack{
                Text("글쓰기")
                    .font(.title3)
                    .fontWeight(.semibold)
                    Spacer()
                    Toggle("private", isOn: $checkPrivate)
                        .toggleStyle(CheckBox())
                             
                    Button("UPLOAD",action: {
                        //self.presentation.wrappedValue.dismiss()
                    })
                        .buttonStyle(.bordered)
            }.padding()
            
            Divider()
            
            if selectedImage != nil {
                Image(uiImage: selectedImage!)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:300,height:300)
            } else {
                Image(systemName: "camera")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width:300,height:300)
            }
            
            Button("Camera"){
                self.sourceType = .camera
                self.isImagePickerDisplay.toggle()
            }.padding()
            
            Button("Gallery"){
                self.sourceType = .photoLibrary
                self.isImagePickerDisplay.toggle()
            }.padding()
            /*Button("Image",action: {})
                .frame(width:300,height:300)
                .border(Color.pp)
                .foregroundColor(Color.pp)
                .background(Color.white)
                .padding()*/
            Spacer()
        }//.navigationBarTitleDisplayMode(.inline)
        //.edgesIgnoringSafeArea(.top)
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
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let selectedImage = info[.originalImage] as? UIImage else {return}
        self.picker.selectedImage = selectedImage
        self.picker.isPresented.wrappedValue.dismiss()
    }
}


#if DEBUG
struct WritingPageView_Previews: PreviewProvider {
    static var previews: some View {
        PartyPageView()
    }
}
#endif
