//
//  DebtToMeDetails.swift
//  MyDebts
//
//  Created by Майлс on 25.02.2022.
//

import SwiftUI

struct DebtToMeDetails: View {
    
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode
    
    let debt: DebtsToMeEntity
    
    var body: some View {
        VStack(alignment: .leading, spacing: 25) {

            TextTemplate(leadingText: "Значение:", trailingText: "\(debt.value.asValueWith2Decimals())")
            
            VStackTextTemplate(title: "Описание:", text: debt.overview ?? "", height: 200)
            
            TextTemplate(leadingText: "Дата:", trailingText: DateFormatter.dateFormatter.string(from: debt.date ?? Date()))
            
            Spacer()
        }
        .padding()
        .navigationTitle("Я должен: \(debt.name ?? "")")
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) { backButton }
        }
    }
}

extension DebtToMeDetails {
    //VIEWS
    private var backButton: some View {
        ButtonTemplate(image: "chevron.left")
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
}

//MARK: - PREVIEW
struct DebtToMeDetails_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DebtToMeDetails(debt: devTwo.createFakeDebt())
        }
    }
}
