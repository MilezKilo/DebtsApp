//
//  MyDebts.swift
//  MyDebts
//
//  Created by Майлс on 24.02.2022.
//

import SwiftUI

struct MyDebts: View {
    
    @EnvironmentObject private var myDebtsVM: MyDebtsVM
    @State private var showSheet: Bool = false
    
    var body: some View {
        VStack {
            titleColumns
            List {
                ForEach(myDebtsVM.myDebts, id: \.self) { debt in
                    NavigationLink(destination: MyDebtDetails(debt: debt)) {
                        HStack {
                            Text(debt.name ?? "")
                            Spacer()
                            Text("\(debt.value.asValueWith2Decimals())")
                        }
                    }
                }
                .onDelete(perform: myDebtsVM.deleteDebt)
            }
            .listStyle(PlainListStyle())
            .toolbar { ToolbarItem(placement: .navigationBarTrailing) { showSheetButton } }
            .fullScreenCover(isPresented: $showSheet) { MyDebtsAddScreen() }
            
            lowerColumns
        }
    }
}

//MARK: - PREVIEW
extension MyDebts {
    private var showSheetButton: some View {
        ButtonTemplate(image: "plus")
            .onTapGesture {
                showSheet.toggle()
            }
    }
    private var titleColumns: some View {
        HStack {
            Text("Кому должен")
            Spacer()
            Text("Сумма")
                .padding(.trailing, 20)
        }
        .font(.caption)
        .padding(.horizontal, 20)
    }
    private var lowerColumns: some View {
        HStack {
            Text("Всего должен: ")
            Text(myDebtsVM.returnAllDebts())
        }
        .font(.headline)
    }
}

//MARK: - PREVIEW
struct MyDebts_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MyDebts()
                .environmentObject(MyDebtsVM())
        }
    }
}
