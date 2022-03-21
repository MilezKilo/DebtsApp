//
//  TextTemplate.swift
//  MyDebts
//
//  Created by Майлс on 09.03.2022.
//

import SwiftUI

struct TextTemplate: View {
    
    let leadingText: String
    let trailingText: String
    
    var body: some View {
        HStack {
            Text(leadingText)
            Spacer()
            Text(trailingText)
        }
        .padding(.horizontal)
        .frame(width: UIScreen.main.bounds.width * 0.95, height: 55)
        .foregroundColor(Color.colorThemes.adaptiveColor)
        .background(Color.colorThemes.background.cornerRadius(10))
    }
}


//MARK: - PREVIEW
struct TextTemplate_Previews: PreviewProvider {
    static var previews: some View {
        TextTemplate(leadingText: "Описание", trailingText: "Текст")
    }
}
