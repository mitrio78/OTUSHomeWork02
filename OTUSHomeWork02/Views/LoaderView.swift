//
//  LoaderView.swift
//  OTUSHomeWork02
//
//  Created by anduser on 26.06.2023.
//

import SwiftUI

struct LoaderView: View {

    @State private var animation: Double = 0.0

    var body: some View {
        ZStack {
            Circle()
                .fill(Color(uiColor: .systemBackground))
                .frame(width: 54, height: 54, alignment: .center)

            Circle()
                .stroke(Color.accentColor, lineWidth: 2)
                .frame(width: 52, height: 52, alignment: .center)
                .scaleEffect(1 + CGFloat(animation))
                .opacity(1 - animation)

            Image(systemName: "newspaper")
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32, alignment: .center)
                .foregroundColor(.accentColor)
        } //: ZStack
        .onAppear {
            withAnimation(Animation.easeOut(duration: 2).repeatForever(autoreverses: false)) {
                animation = 1
            }
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
