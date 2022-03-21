//
//  Home.swift
//  MyDebts
//
//  Created by Майлс on 24.02.2022.
//

import SwiftUI

struct Home: View {
    
    @State private var selector: Int = 0
    
    var body: some View {
        VStack {
            viewSelector
                .padding(.bottom)
            if selector == 0 {
                DebtsToMe()
            } else {
                MyDebts()
            }
            Spacer()
        }
        .navigationBarTitle("iДолг")
        .navigationBarTitleDisplayMode(.inline)
        .padding()
    }
}

//MARK: - EXTENSION
extension Home {
    private var viewSelector: some View {
        Picker(selection: $selector, label: Text("")) {
            Text("Мне должны").tag(0)
            Text("Мои долги").tag(1)
        }.pickerStyle(SegmentedPickerStyle())
    }
}

//MARK: - PREVIEW
struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Home()
                .environmentObject(MyDebtsVM())
                .environmentObject(DebtsToMeVM())
                .preferredColorScheme(.dark)
        }
    }
}
