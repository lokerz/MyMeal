//
//  EmptyView.swift
//  MyMeal
//
//  Created by Ridwan Abdurrasyid on 05/10/23.
//

import SwiftUI

struct EmptyView: View {
    var body: some View {
        VStack {
            Image(systemName: "info.circle")
                .font(.largeTitle)
                .foregroundColor(.gray)
                .imageScale(.large)
                .padding()
            
            Text("No items to display")
                .font(.headline)
                .foregroundColor(.gray)
            
        }
        .frame(maxHeight: .infinity)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}
