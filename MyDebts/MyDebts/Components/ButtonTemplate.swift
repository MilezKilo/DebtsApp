//
//  ButtonTemplate.swift
//  MyDebts
//
//  Created by Майлс on 25.02.2022.
//

import SwiftUI

struct ButtonTemplate: View {
    
    let image: String
    
    var body: some View {
        Image(systemName: image)
            .frame(width: 35, height: 35)
            .foregroundColor(Color.colorThemes.adaptiveColor)
            .background(Color.colorThemes.background.cornerRadius(10))
//            .shadow(color: Color.black.opacity(0.2), radius: 2.5)
    }
}

//MARK: - PREVIEW
struct ButtonTemplate_Previews: PreviewProvider {
    static var previews: some View {
        ButtonTemplate(image: "chevron.down")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
