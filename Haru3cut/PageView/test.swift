//
//  test.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/14.
//

import SwiftUI

struct View1: View {
    @State var gotoView2 = false
    
    var body: some View {
        NavigationView {
            Button("Goto View 2") {
                gotoView2 = true
            }
            .navigationTitle("View 1")
            .background(
                NavigationLink(
                    destination: View2View(gotoView1: $gotoView2),
                    isActive: $gotoView2,
                    label: {EmptyView()}
                )
                .isDetailLink(false)
            )
        }
    }
}

struct View2View: View {
    @State var gotoView3 = false
    @Binding var gotoView1: Bool
    
    var body: some View {
        Button("Goto View 3") {
            gotoView3 = true
        }
        .navigationTitle("View 2")
        .background(
            NavigationLink(
                destination: View3View(
                    gotoView1: $gotoView1
                ),
                isActive: $gotoView3,
                label: {EmptyView()}
            )
            .isDetailLink(false)
        )
    }
}

struct View3View: View {
    @State var gotoView4 = false
    @Binding var gotoView1: Bool
    
    var body: some View {
        Button("Goto View 4") {
            gotoView4 = true
        }
        .navigationTitle("View 3")
        .background(
            NavigationLink(
                destination: View4View(
                    gotoView1: $gotoView1
                ),
                isActive: $gotoView4,
                label: {EmptyView()}
            )
            .isDetailLink(false)
        )
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
