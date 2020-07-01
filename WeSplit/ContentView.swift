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
    @State private var numberOfFriends = 2
    @State private var tipPercentage = 2
    
    let tipPercentages = [10,15,20,25,30,0]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("What's the Bill: ", text: $bill)
                        .keyboardType(.decimalPad)
                    Picker("Number Of Friends", selection: $numberOfFriends) {
                        ForEach(0 ..< 100){
                            Text("\($0) people")
                        }
                    }
                }
                Section {
                    Text("$\(bill)")
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
