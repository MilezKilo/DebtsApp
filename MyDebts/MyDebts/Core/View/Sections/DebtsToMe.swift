//
//  DebtsToMe.swift
//  MyDebts
//
//  Created by Майлс on 24.02.2022.
//

import SwiftUI

struct DebtsToMe: View {
    
    @EnvironmentObject private var debtsToMeVM: DebtsToMeVM
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            titleColumns
            List {
                ForEach(debtsToMeVM.debtsToMe, id: \.self) { debt in
                    NavigationLink(destination: DebtToMeDetails(debt: debt)) {
                        HStack {
                            Text(debt.name ?? "")
                            Spacer()
                            Text("\(debt.value.asValueWith2Decimals())")
                        }
                    }
                }
                .onDelete(perform: debtsToMeVM.deleteDebt)
            }
            .listStyle(PlainListStyle())
            .toolbar { ToolbarItem(placement: .navigationBarTrailing) { showSheetButton } }
            .fullScreenCover(isPresented: $showSheet) { DebtsToMeScreen() }
            
            lowerColumn
        }
    }
}

//MARK: - PREVIEW
extension DebtsToMe {
    private var showSheetButton: some View {
        ButtonTemplate(image: "plus")
            .onTapGesture {
                showSheet.toggle()
            }
    }
    private var titleColumns: some View {
        HStack {
            Text("Кто должен")
            Spacer()
            Text("Сумма")
                .padding(.trailing, 20)
        }
        .font(.caption)
        .padding(.horizontal, 20)
    }
    private var lowerColumn: some View {
        HStack {
            Text("Всего должны: ")
            Text(debtsToMeVM.returnAllDebts())
        }
        .font(.headline)
    }
}

//MARK: - PREVIEW
struct DebtsToMe_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DebtsToMe()
                .environmentObject(DebtsToMeVM())
        }
    }
}
