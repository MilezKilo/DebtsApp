//
//  MyDebtsAddScreen.swift
//  MyDebts
//
//  Created by Майлс on 25.02.2022.
//

import SwiftUI

struct MyDebtsAddScreen: View {
    
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) private var presentationMode
    
    @EnvironmentObject private var myDebt: MyDebtsVM
    
    @State private var name: String = ""
    @State private var value: String = ""
    @State private var overview: String = ""
    @State private var date: Date = Date()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center, spacing: 25) {
                headerTextfields
                TextfieldTemplate(innerText: "Добавьте описание", size: UIScreen.main.bounds.width * 0.825, text: $overview)
                DatePicker("Дата", selection: $date)
                    .padding(.horizontal, 10)
                addButton
                Spacer()
            }
            .navigationTitle("Добавьте долг")
            .padding()
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) { backButton }
            }
        }
    }
}

//MARK: - EXTENSION
extension MyDebtsAddScreen {
    //VIEWS
    private var headerTextfields: some View {
        HStack {
            VStack {
                Text("Введите имя")
                TextfieldTemplate(innerText: "Кому должен...", size: 150, text: $name)
            }
            VStack {
                Text("Введите сумму")
                TextfieldTemplate(innerText: "Сумма...", size: 150, text: $value)
                    .keyboardType(.decimalPad)
            }
        }
    }
    
    //BUTTONS
    private var backButton: some View {
        ButtonTemplate(image: "chevron.down")
            .onTapGesture {
                presentationMode.wrappedValue.dismiss()
            }
    }
    private var addButton: some View {
        Button("Добавить мой долг") {
            myDebt.addDebt(
                name: name,
                value: Double(value) ?? 0.0,
                overview: overview,
                date: date)
            presentationMode.wrappedValue.dismiss()
        }
    }
}

//MARK: - PREVIEW
struct MyDebtsAddScreen_Previews: PreviewProvider {
    static var previews: some View {
            MyDebtsAddScreen()
                .environmentObject(MyDebtsVM())
                .preferredColorScheme(.dark)
    }
}
