//
//  NewsCell.swift
//  OTUSHomeWork02
//
//  Created by anduser on 25.06.2023.
//

import SwiftUI

struct NewsCell: View {

    // MARK: - Properties

    @State var isAnimate: Bool = false
    @State var secondAnimation: Bool = false

    let header: String
    let description: String
    let date: String
    let action: () -> Void

    // MARK: - Body

    var body: some View {
        HStack {
            ZStack {
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
                    .padding(.top, 4)
                }

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
                    .padding(.top, 4)
                }
                .offset(
                    x: isAnimate ? UIScreen.main.bounds.width / 2 : 0,
                    y: isAnimate ? UIScreen.main.bounds.height / 2 : 0
                )
                .offset(y: secondAnimation ? -150 : 0)
                .opacity(isAnimate ? 0 : 1)
                .zIndex(isAnimate ? 20 : 0)
            }

            Image(systemName: isAnimate ? "star.fill" : "star" )
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.leading)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.5)) {
                        secondAnimation = true
                        action()
                    }
                    withAnimation(.easeInOut(duration: 1)) {
                        isAnimate = true
                        action()
                    }
                }
        }
        .zIndex(isAnimate ? 100 : 0)

        .padding()
    }
}

// MARK: - Preview

struct NewsCell_Previews: PreviewProvider {
    static var previews: some View {
        NewsCell(header: "News! Lorem ipsum", description: "Lorem ipsum dolor sit amet... Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum", date: "23.06.2023", action: { })
            .previewLayout(.fixed(width: 320, height: 100))
    }
}
