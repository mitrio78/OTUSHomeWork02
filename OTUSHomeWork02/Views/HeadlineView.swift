//
//  HeadingView.swift
//  Africa
//
//  Created by anduser on 21.05.2023.
//

import SwiftUI

struct HeadingView: View {

    // MARK: - Properties
    
    var headingText: String

    // MARK: - Body

    var body: some View {
        HStack {
            Image(systemName: "newspaper")
                .foregroundColor(.accentColor)
                .imageScale(.large)

            Text(headingText)
                .font(.title3)
                .fontWeight(.bold)

        } //: HStack
        .padding(.vertical)
    }
}

// MARK: - Preview

struct HeadingView_Previews: PreviewProvider {

    static var previews: some View {
        HeadingView(headingText: "Some news!")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
