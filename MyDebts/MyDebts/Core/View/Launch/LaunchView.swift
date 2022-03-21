//
//  LaunchView.swift
//  MyDebts
//
//  Created by Майлс on 26.02.2022.
//

import SwiftUI

struct LaunchView: View {
    
    @Binding var showLaunchView: Bool
    
    var body: some View {
        ZStack {
            Image("LaunchImage")
                .resizable()
                .frame(width: 150, height: 150)
            Text("Добро пожаловать!")
                .font(.title)
                .fontWeight(.bold)
                .offset(y: 125)
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.linear) {
                    showLaunchView = false
                }
            }
        }
    }
}

//MARK: - PREVIEW
struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView(showLaunchView: .constant(true))
    }
}
