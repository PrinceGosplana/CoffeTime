//
//  CoffeTimeApp.swift
//  CoffeTime
//
//  Created by Oleksandr Isaiev on 30.05.2024.
//

import SwiftUI

@main
struct CoffeTimeApp: App {

    init() { ColorTransformer.register() }
    
    var body: some Scene {
        WindowGroup {
            WUISContentView()
//            HeroWrapper {
//                UHEContentView()
//            }
//            ContentView()
//            /// in order to run ColorContentView
//                .modelContainer(for: ColorModel.self)
        }
    }
}
