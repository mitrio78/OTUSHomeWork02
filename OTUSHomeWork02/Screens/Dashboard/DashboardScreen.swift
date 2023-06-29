//
//  DashboardScreen.swift
//  OTUSHomeWork02
//
//  Created by anduser on 26.06.2023.
//

import SwiftUI

struct DashboardScreen: View {

    // MARK: - Properties

    // MARK: - Body

    var body: some View {
        VStack {
            NavButtonPush(destination: SegmentedControlScreen()) {
                HStack {
                    Image(systemName: "newspaper")
                    Text("READ NEWS")
                        .font(.title)
                }
                .padding(.horizontal, 40)
            }
        }
    }
}

// MARK: - Preview

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
