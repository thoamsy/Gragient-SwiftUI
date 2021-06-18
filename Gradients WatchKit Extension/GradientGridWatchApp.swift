//
//  GradientGridWatchApp.swift
//  Gradients WatchKit Extension
//
//  Created by yk on 2021/6/17.
//

import SwiftUI

@main
struct GradientGridWatchApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
          ContentView()
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
