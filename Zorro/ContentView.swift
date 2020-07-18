//
//  ContentView.swift
//  Zorro
//
//  Created by Alex Jang on 6/18/20.
//  Copyright © 2020 Alex Jang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink(destination: MaskedTextField(.customText, addCustomTextProps)) {
                    Text("Show Custom Text Field")
                }
                NavigationLink(destination: MaskedTextField(.creditCard(.visa))) {
                    Text("Show Credit Card Text Field")
                }
                NavigationLink(destination: MaskedTextField(.phoneNumber)) {
                    Text("Show Phone Number Text Field")
                }
            }
            .navigationBarTitle("Text Field Options")
        }
    }
    
    func addCustomTextProps() -> CustomTextProperties {
        var properties = CustomTextProperties()
        properties.numberAmt = 2
        return properties
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
