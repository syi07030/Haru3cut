//
//  test.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/04/04.
//

import SwiftUI
import TagTextField

var allTags: [String] = ["운동","일상","취미","일기"]

struct test: View {
 
           @State var tags: [String] = []
           @State var keyword: String = ""
           
           //var allTags: [String] = ["운동","일상","취미","일기"]
           
           var body: some View {
               VStack {
                   searchView
                   //Divider()
                   searchResultView
                       .frame(width: 300, height: 200)
                   Spacer()
               }
           }
           
           var theme: TagTheme {
               return TagTheme(font: Font.system(size: 15), foregroundColor: Color.white, backgroundColor: Color.pp, borderColor: Color.white, shadowColor: Color.white, deletable: true, deleteButtonSize: 10, deleteButtonColor: Color.white, spacing: 5, alignment: .leading, inputFieldTextColor: Color.gray)
           }
           
           @ViewBuilder
           var searchView: some View {
               HStack(spacing: 10) {
                   TagTextField(tags: $tags, keyword: $keyword, theme: self.theme, placeholder: "Enter the Tags...") { _ in
                       return keyword.lowercased()
                       
                       //allTags.filter{$0.lowercased().contains(keyword.lowercased()) == true}.first
                   }
                   .padding(.leading,6)
                   .padding(.trailing,6)
                   .clipShape(RoundedRectangle(cornerRadius: 16))
               }
               .padding(.leading,16)
               .padding(.trailing,16)
           }
           
           @ViewBuilder
           var searchResultView: some View {
               if keyword == "" {
                   List {
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
                   .listStyle(.inset)
                   
               }
               
               else if (allTags.filter{$0.lowercased().contains(keyword.lowercased()) == true}).count > 0 {
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
                           .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                           .listRowBackground(Color(UIColor.systemGray6))
                       }
                   }
                   .listStyle(.inset)
               }
               else { //현재 버튼을 선택했을 때만 alltags에 append
                   List {
                       let tagword = keyword
                       Button(action: {
                           if tags.contains(keyword) == false {
                               tags.append(keyword)
                               allTags.append(keyword)
                           }
                           keyword = ""
                       }, label: {
                           Text("\(tagword)")
                               .padding()
                       })
                       .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                       .listRowBackground(Color(UIColor.systemGray6))
                   }
                   .listStyle(.inset)
               }
    }
}

public struct TagTextField: View {
    @Binding var tags: [String]
    @Binding var keyword: String
    
    var theme: TagTheme = TagTheme()
    var placeholder: String = ""
    var checkKeyword: ((String) -> String?)? = { $0 } //this is a closure is to get a candidate for the currently inputed text
        
    @State private var availableWidth: CGFloat = 0
    @State private var elementsSize: [String: CGSize] = [:]
    
    public var body: some View {
        ZStack(alignment: Alignment(horizontal: theme.alignment, vertical: .center)) {
            Color.white
                //.frame(height: 1)
                //.readSize { size in
                //    availableWidth = size.width
                //}
            tagContainer
        }
    }
    
    var tagContainer: some View {
        let rows = computeRows()
        let rows_length = rows.count
        return VStack(alignment: theme.alignment, spacing: theme.spacing) {
            ForEach(0..<rows_length, id: \.self) { index in
                HStack(spacing: theme.spacing) {
                    ForEach(rows[index], id: \.self) { element in
                        TagView(tag: element, theme: theme, deleteAction: {
                            tags.removeAll(where: {$0 == element})
                        })
                        //.fixedSize()
                        //.readSize { size in
                        //    elementsSize[element] = size
                        //}
                    }
                    if index == rows_length - 1 {
                        textInputView
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var textInputView: some View {
        TextField(placeholder, text: $keyword, onCommit: {
            if keyword.count > 0,
               let result = checkKeyword?(keyword), tags.contains(result) == false {
                tags.append(result)
            }
            keyword = ""
        })
        .textFieldStyle(PlainTextFieldStyle())
        .font(theme.inputFieldFont)
        .foregroundColor(theme.inputFieldTextColor)
        .disableAutocorrection(true)
        .autocapitalization(.none)
    }
    
    func computeRows() -> [[String]] {
        var rows: [[String]] = [[]]
        var currentRow = 0
        var remainingWidth = availableWidth
        
        for element in tags {
            let elementSize = elementsSize[element, default: CGSize(width: availableWidth, height: 1)]
            
            if remainingWidth - (elementSize.width + theme.spacing) >= 0 {
                rows[currentRow].append(element)
            } else {
                //currentRow = currentRow + 1
                rows[currentRow].append(element)
                //rows.append([element])
                remainingWidth = availableWidth
            }
            remainingWidth = remainingWidth - (elementSize.width + theme.spacing)
        }
        return rows
    }
    
    /*
    func returnTags() -> [String] {
        return tags
    }
     */
}

public struct TagView: View {
    let tag: String
    let theme: TagTheme
    var deleteAction: (() -> Void) = {}
        
    public var body: some View {
        HStack (spacing: 4) {
            Text(tag)
                .font(theme.font)
                .foregroundColor(theme.foregroundColor)
            if theme.deletable {
                Button(action: deleteAction, label: {
                    Image(systemName: theme.deleteButtonSystemImageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(theme.deleteButtonColor)
                        .frame(width: theme.deleteButtonSize, height: theme.deleteButtonSize)
                })
            }
        }
        .padding(theme.contentInsets)
        .background(theme.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: theme.cornerRadius))
        .overlay(
            RoundedRectangle(cornerRadius: theme.cornerRadius).stroke(theme.borderColor, lineWidth: 1.0)
                .shadow(color: theme.shadowColor, radius: theme.shadowRadius)
        )
    }
}

public struct TagTextField_Previews: PreviewProvider {
    public static var previews: some View {
        Group {
            TagTextField(tags: .constant(["운동", "일상"]), keyword: .constant(""), placeholder: "Tags")
                .padding(.leading)
                .padding(.trailing)
                .clipShape(RoundedRectangle(cornerRadius: 16))
        }.padding()
    }
}

internal struct SizePreferenceKey: PreferenceKey {
    static var defaultValue: CGSize = .zero
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {}
}

public extension View {
    func readSize(onChange: @escaping (CGSize) -> Void) -> some View {
        background(
            GeometryReader { geometryProxy in
                Color.clear
                    .preference(key: SizePreferenceKey.self, value: geometryProxy.size)
            }
        )
        .onPreferenceChange(SizePreferenceKey.self, perform: onChange)
    }
}

/*
public extension TagTextField {
    public init() {
        
    }
}
*/

public struct TagTheme {
    var font: Font = Font.system(size: 14)
    var foregroundColor: Color = Color(.sRGB, red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, opacity: 1)
    var backgroundColor: Color = Color.white
    var borderColor: Color = Color(.sRGB, red: 224.0/255.0, green: 224.0/255.0, blue: 225.0/255.0, opacity: 1)
    var shadowColor: Color = Color(.sRGB, red: 151.0/255.0, green: 151.0/255.0, blue: 154.0/255.0, opacity: 1).opacity(0.4)
    var shadowRadius: CGFloat = 5
    var cornerRadius: CGFloat = 13
    
    var deletable: Bool = true
    var deleteButtonSize: CGFloat = 12
    var deleteButtonColor: Color = Color(.sRGB, red: 151.0/255.0, green: 151.0/255.0, blue: 154.0/255.0, opacity: 1)
    var deleteButtonSystemImageName: String = "xmark"
    
    var spacing: CGFloat = 5.0
    var alignment: HorizontalAlignment = .leading
    
    var inputFieldFont: Font = Font.system(size: 14)
    var inputFieldTextColor: Color = Color(.sRGB, red: 45.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, opacity: 1)
    
    var contentInsets: EdgeInsets = EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10)
}

#if DEBUG
struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}
#endif
