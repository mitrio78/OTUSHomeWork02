//
//  LinkView.swift
//  OTUSHomeWork02
//
//  Created by anduser on 26.06.2023.
//

import SwiftUI

struct LinkView: View {

    // MARK: - Properties

    let url: String
    let source: String

    // MARK: - Body

    var body: some View {
        GroupBox {
            HStack {
                Image(systemName: "globe")
                Text("Source:")
                Spacer()

                Group {
                    Link(source, destination: URL(string: url) ?? URL(string: "https://mediastack.com")!)
                    Image(systemName: "arrow.up.right.square")
                }
                .foregroundColor(.accentColor)

            } //: HStack
        } //: Box
    }
}

// MARK: - Previews

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        LinkView(url: "", source: "New York Times")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
