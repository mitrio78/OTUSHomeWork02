//
//  DashboardScreen.swift
//  OTUSHomeWork02
//
//  Created by anduser on 26.06.2023.
//

import SwiftUI

struct DashboardScreen: View {

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

struct DashboardScreen_Previews: PreviewProvider {
    static var previews: some View {
        DashboardScreen()
    }
}
