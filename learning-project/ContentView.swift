//
//  ContentView.swift
//  learning-project
//
//  Created by Динмуханбет Айжарыков on 03.07.2024.
//

import SwiftUI



struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 0
    
    let tipPercantes = [0, 5, 10, 15, 20]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        let tipSelection = Double(tipPercantes[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPereson = grandTotal / peopleCount
        
        
        return amountPerPereson
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Amount", text: $checkAmount)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                Section(header: Text("Сколько чаевых вы хотите оставить?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0..<tipPercantes.count) {
                            Text("\(self.tipPercantes[$0])%")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("\(totalPerPerson, specifier: "%.2f")")
                }
            
                
            }.navigationBarTitle("Калькулятор чаевых", displayMode: .inline)
        }
    }
}
                                            
#Preview {
    ContentView()
}
