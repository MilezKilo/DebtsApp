//
//  MyDebtsApp.swift
//  MyDebts
//
//  Created by Майлс on 23.02.2022.
//

import SwiftUI

@main
struct MyDebtsApp: App {
    
    @StateObject private var myDebtsVM = MyDebtsVM()
    @StateObject private var debtsToMeVM = DebtsToMeVM()
    @State private var showLaunchView: Bool = true
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                if showLaunchView {
                    LaunchView(showLaunchView: $showLaunchView)
                        .transition(AnyTransition.opacity.animation(.linear))
                } else {
                    NavigationView {
                        Home()
                    }
                    .environmentObject(myDebtsVM)
                    .environmentObject(debtsToMeVM)
                }
            }
        }
    }
}
