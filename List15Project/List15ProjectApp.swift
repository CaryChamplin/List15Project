//==============================================================================
//  List15ProjectApp.swift
//
//  List15Project
//  Created by Champlin Technologies LLC on 2021/10/06.
//  Copyright © 2021 Champlin Technologies LLC. All rights reserved.
//==============================================================================
import SwiftUI

@main
struct List15ProjectApp: App {
    
    @StateObject private var dataModel = DataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(dataModel)
                .onAppear(perform: {
                    // hack to disable iPad autolayout warnings when text fields are being used
                    UserDefaults.standard.setValue(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
                })
        }
    }
}
