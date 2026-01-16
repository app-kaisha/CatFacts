//
//  CatFactsApp.swift
//  CatFacts
//
//  Created by app-kaihatsusha on 16/01/2026.
//  Copyright © 2026 app-kaihatsusha. All rights reserved.
//

import SwiftUI

@main
struct CatFactsApp: App {
    var body: some Scene {
        WindowGroup {
            ListView()
                .onAppear {
                    Thread.sleep(forTimeInterval: 3)
                }
        }
    }
}
