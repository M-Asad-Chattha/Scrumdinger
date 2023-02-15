//
//  Test.swift
//  Scrumdinger
//
//  Created by Muhammad Asad Chattha on 27/01/2023.
//
import SwiftUI

struct Test: View {
    let price = 200
    let tipAmount = 15
    var totalPrice: String {
        let tipValue = price / 100 * tipAmount
        return (price + tipValue).formatted(.currency(code: "USD"))
    }
    
    var body: some View {
        VStack {
            
            Form {
                Section("Total: \(totalPrice)") {
                    Button("Confirm Order") {}
                    Text("Tip: \(15, format: .percent)")
                    Text(String(format: "The price is $%.1f", 19.99))
                    
                }
            }
            
        }
    }
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}
