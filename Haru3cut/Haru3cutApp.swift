//
//  Haru3cutApp.swift
//  Haru3cut
//
//  Created by HanGeunyoung on 2022/03/02.
//

import SwiftUI

@main
struct Haru3cutApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            LoginPageView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
