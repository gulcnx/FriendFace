//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by gülçin çetin on 22.09.2025.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.modelContainer(for: User.self)
    }
}
