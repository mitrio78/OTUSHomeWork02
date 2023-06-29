//
//  ContentView.swift
//  OTUSHomeWork02
//
//  Created by anduser on 25.06.2023.
//

import MediaStackAPI
import SwiftUI

struct ContentView: View {

    // MARK: - Properties

    // MARK: - Body

    var body: some View {
        NavStack(
            transition: .custom(.moveAndFade),
            easing: .easeInOut
        ) {
           DashboardScreen()
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
