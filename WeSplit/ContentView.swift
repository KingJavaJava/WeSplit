//
//  ContentView.swift
//  WeSplit
//
//  Created by Harei Waja on 6/30/20.
//  Copyright © 2020 Rex Orioko. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var bill = ""
    @State private var numberOfFriends = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,30,0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(numberOfFriends) ?? 0
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(bill) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var grandTotal: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(bill) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let total = orderAmount + tipValue
        
        return total
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("What's the Bill: ", text: $bill)
                        .keyboardType(.decimalPad)
                    TextField("Number Of Friends", text: $numberOfFriends)
                        .keyboardType(.decimalPad)
                }
                Section(header: Text("Tip Percentage")) {
                    Picker("Tip Percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count){number in
                            Text("\(self.tipPercentages[number])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Amount Per Person")) {
                    Text("$\(totalPerPerson, specifier: "%.2f")")
                }
                Section(header: Text("Grand Total")) {
                    Text("$\(grandTotal, specifier: "%.2f")")
                }
                
            }
        .navigationBarTitle("WeSplit App")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
