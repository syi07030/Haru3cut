//
//  test.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/14.
//

import SwiftUI

struct View1: View {
    @State var gotoView4 = false
    
    var body: some View {
        NavigationView {
            Button("Goto View 2") {
                gotoView4 = true
            }
            .navigationTitle("View 1")
            .background(
                NavigationLink(
                    destination: View4View(gotoView1: $gotoView4),
                    isActive: $gotoView4,
                    label: {EmptyView()}
                )
                .isDetailLink(false)
            )
        }
    }
}

struct View4View: View {
    @Binding var gotoView1: Bool
    
    var body: some View {
        Button("Go Back to View 1") {
            gotoView1 = false
        }
        .navigationTitle("View 4")
    }
}
