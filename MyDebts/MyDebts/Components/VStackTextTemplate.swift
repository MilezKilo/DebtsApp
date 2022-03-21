//
//  VStackTextTemplate.swift
//  MyDebts
//
//  Created by Майлс on 09.03.2022.
//

import SwiftUI

struct VStackTextTemplate: View {
    
    let title: String
    let text: String
    let height: CGFloat
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 15) {
            Text(title)
            Text(text)
        }
        .padding([.horizontal, .top])
        .frame(width: UIScreen.main.bounds.width * 0.95, height: height, alignment: .topLeading)
        .foregroundColor(Color.colorThemes.adaptiveColor)
        .background(Color.colorThemes.background.cornerRadius(10))
    }
}

//MARK: - PREVIEW
struct VStackTextTemplate_Previews: PreviewProvider {
    static var previews: some View {
        VStackTextTemplate(title: "Описание", text:  "Очень долгий текст, описывает какой то там долг, для кого то там", height: 150)
    }
}
