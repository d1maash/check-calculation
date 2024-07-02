//
//  ContentView.swift
//  learning-project
//
//  Created by Динмуханбет Айжарыков on 03.07.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showHello = true
    
    var body: some View {
        VStack {
            Toggle(isOn: $showHello, label: {
                Text("Show Hello")
            }).padding()
            
            if showHello {
                Text("Hello")
            } 
        }
    }
}

#Preview {
    ContentView()
}
