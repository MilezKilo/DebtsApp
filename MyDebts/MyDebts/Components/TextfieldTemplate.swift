//
//  TextfieldTemplate.swift
//  MyDebts
//
//  Created by Майлс on 25.02.2022.
//

import SwiftUI

struct TextfieldTemplate: View {
    
    let innerText: String
    let size: CGFloat
    @Binding var text: String
    
    var body: some View {
        TextField(innerText, text: $text)
            .frame(width: size, height: 55)
            .padding(.leading)
            .background(Color.colorThemes.background)
            .cornerRadius(10)
    }
}

struct TextfieldTemplate_Previews: PreviewProvider {
    static var previews: some View {
        TextfieldTemplate(innerText: "...", size: 150, text: .constant(""))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
