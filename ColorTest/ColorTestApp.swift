//
//  ColorTestApp.swift
//  ColorTest
//
//  Created by Doug Holland on 11/12/24.
//

import SwiftUI

import SwiftData

@main
struct ColorTestApp: App {
    init() {
        UIColorValueTransformer.register()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ColorModel.self)
    }
}
