//
//  GradientGridApp.swift
//  Gradients WatchKit Extension
//
//  Created by yk on 2021/6/17.
//

import SwiftUI

@main
struct GradientGridApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
