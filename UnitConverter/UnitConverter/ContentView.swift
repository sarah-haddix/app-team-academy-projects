//
//  ContentView.swift
//  UnitConverter
//
//  Created by Sarah Haddix on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    @State var selectedInputUnit = "inch"
    @State var selectedOutputUnit = "inch"
    
    @State var thingToConvertString: String = "1"
    var amount: Double {
        return Double(thingToConvertString) ?? 0.0
    }
    
    var units = [["inch", "foot", "shackle", "spindle"], ["skein", "furlong", "poppyseed", "barleycorn"], ["ell", "fathom", "league", "shaftment"], ["twip", "mile", "nautical mile", "roman mile"]]
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 4)
    
    var body: some View {
        NavigationStack {
            Text("The Best Imperial Distance Unit Conversion App in the World")
                .font(.title3)
                .bold()
                .multilineTextAlignment(.center)
                .padding(.top)
            Form {
                Section {
                    TextField("number", text: $thingToConvertString)
                        .keyboardType(.decimalPad)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(0..<units.count, id: \.self) { rowIndex in
                                ForEach(0..<units[rowIndex].count, id: \.self) { columnIndex in
                                    Button(action: {
                                        selectedInputUnit = units[rowIndex][columnIndex]
                                    }) {
                                        Text(units[rowIndex][columnIndex])
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 50)
                                            .background(selectedInputColor(unit: units[rowIndex][columnIndex]))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        //.padding()
                    }
                }
                Section {
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 10) {
                            ForEach(0..<units.count, id: \.self) { rowIndex in
                                ForEach(0..<units[rowIndex].count, id: \.self) { columnIndex in
                                    Button(action: {
                                        selectedOutputUnit = units[rowIndex][columnIndex]
                                    }) {
                                        Text(units[rowIndex][columnIndex])
                                            .frame(maxWidth: .infinity)
                                            .frame(height: 50)
                                            .background(selectedOutputColor(unit: units[rowIndex][columnIndex]))
                                            .foregroundColor(.white)
                                            .cornerRadius(10)
                                    }
                                }
                            }
                        }
                        //.padding()
                    }
                }
                Section {
                    Text("\(thingToConvertString) \(selectedInputUnit)s is \(convert()) \(selectedOutputUnit)s")
                }
            }
        }
    }
    
    func selectedInputColor(unit: String) -> Color {
        if(unit == selectedInputUnit) {
            return .blue
        }
        return .black
    }
    
    func selectedOutputColor(unit: String) -> Color {
        if(unit == selectedOutputUnit) {
            return .blue
        }
        return .black
    }
    
    func convert() -> Double {
        if(selectedInputUnit == selectedOutputUnit) {
            return amount
        }
        
        let convertToFeet: Double
        
        switch selectedInputUnit {
        case "inch":
            convertToFeet = amount * 12
        case "foot":
            convertToFeet = amount
        case "shackle":
            convertToFeet = amount / (15*3*2)
        case "spindle":
            convertToFeet = amount / (43200)
        case "skein":
            convertToFeet = amount / (360)
        case "furlong":
            convertToFeet = amount / (10*11*2*3)
        case "poppyseed":
            convertToFeet = amount * (4*3*12)
        case "barleycorn":
            convertToFeet = amount * (3*12)
        case "ell":
            convertToFeet = amount * (4/15)
        case "fathom":
            convertToFeet = amount / (2*3)
        case "league":
            convertToFeet = amount / (3*1680)
        case "shaftment":
            convertToFeet = amount * 2
        case "twip":
            convertToFeet = amount * (20*6*12*12)
        case "mile":
            convertToFeet = amount / (1760*3)
        case "nautical mile":
            convertToFeet = amount / 6080
        case "roman mile":
            convertToFeet = amount / (50*5*4*5)
        default:
            convertToFeet = 0.0
        }
        
        //convert to desired unit
        switch selectedOutputUnit {
        case "inch":
            return convertToFeet / 12
        case "foot":
            return convertToFeet
        case "shackle":
            return convertToFeet * 3 * 2 * 15
        case "spindle":
            return convertToFeet * (1/2) * 3 * (1/2) * 5 * 96 * 120
        case "skein":
            return convertToFeet * (1/2) * 3 * (1/2) * 5 * 96
        case "furlong":
            return convertToFeet * 3 * 2 * 11 * 10
        case "poppyseed":
            return convertToFeet / (12*3*4)
        case "barleycorn":
            return convertToFeet / (12*3)
        case "ell":
            return convertToFeet * (1/2) * 3 * (1/2) * 5
        case "fathom":
            return convertToFeet * 3 * 2
        case "league":
            return convertToFeet * 6080 * 3
        case "shaftment":
            return convertToFeet / 2
        case "twip":
            return convertToFeet / (12*12*6*20)
        case "mile":
            return convertToFeet * 3 * 1760
        case "nautical mile":
            return convertToFeet * 6080
        case "roman mile":
            return convertToFeet * 5 * 4 * 5 * 50
        default:
            return 0.0
        }
    }
}

#Preview {
    ContentView()
}

