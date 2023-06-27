//
//  NewsCell.swift
//  OTUSHomeWork02
//
//  Created by anduser on 25.06.2023.
//

import SwiftUI

struct NewsCell: View {

    let header: String
    let description: String
    let date: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.system(size: 21, weight: .semibold))
                .padding(.bottom, 4)

            Text(description)
                .font(.system(size: 17, weight: .light))

            HStack {
                Spacer()

                Text(date)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.secondary)
            }
            .padding(.trailing, 8)
            .padding(.top, 4)
        }
        .padding(4)
    }
}

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(header: "News!", description: "Lorem ipsum dolor sit amet...", date: "23.06.2023")
            .previewLayout(.fixed(width: 320, height: 100))
    }
}
