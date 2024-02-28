//
//  ContentView.swift
//  WeSplit
//
//  Created by Sarah Haddix on 2/23/24.
//


import SwiftUI

struct ContentView: View {
    //State modifiers reinvoke body property of view when the variable is changed
    
    @State private var checkAmount = 0.0
    @State private var numberOfPeople = 2
    @State private var tipPercentage = 20
    @FocusState private var amountIsFocused: Bool
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalBill: Double {
        let tipSelection = Double(tipPercentage)
        
        return checkAmount * (1.0 + tipSelection/100)
    }
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfPeople + 2)
        
        return totalBill / peopleCount
    }
    
    var body: some View {
        NavigationStack{
            Form {
                Section {
                    TextField("Amount", value: $checkAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                        .focused($amountIsFocused)
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(tipPercentages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Total Amount") {
                    Text(totalBill, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
                
                Section("Amount per Person") {
                    Text(totalPerPerson, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amountIsFocused {
                    Button("Done") {
                        amountIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
