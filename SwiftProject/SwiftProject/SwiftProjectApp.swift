//
//  SwiftProjectApp.swift
//  SwiftProject
//
//  Created by Enas El Mershati on 20/11/2023.
//

import SwiftUI

@main
struct SwiftProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(myCloset: Closet(clothes: []))
        }
    }
}
