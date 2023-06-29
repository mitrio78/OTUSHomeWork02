//
//  NewsDetailsScreen.swift
//  OTUSHomeWork02
//
//  Created by anduser on 26.06.2023.
//

import MediaStackAPI
import SwiftUI

struct NewsDetailsScreen: View {

    // MARK: - Properties

    @EnvironmentObject var viewModel: NewsListViewModel

    let article: NewsListDataInner

    // MARK: - Body

    var body: some View {
        VStack {

            NavButtonPop(destination: .previous) {
                HStack {
                    Image(systemName: "arrow.backward.square")
                    Text("Back")
                }
                .font(.headline)
                .foregroundColor(Color(uiColor: .systemPink))
                .padding()
            }

            // Title
            HeadingView(headingText: article.title ?? "")

            Divider()

            // Date and Country
            HStack {
                Text(viewModel.formatDate(article.publishedAt ?? ""))
                    .font(.caption)

                Spacer()

                Text(article.country?.uppercased() ?? "")
                    .font(.caption)
            }

            Divider()

            // Description
            Text(article.description ?? "")
                .font(.body)
                .padding(.bottom)

            // URL and source
            LinkView(url: article.url ?? "", source: article.source ?? "")

            Spacer()
        }
        .padding()
    }
}

// MARK: - Preview

struct NewsDetailsScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailsScreen(
            article: NewsListDataInner(
                title: "News!",
                description: "Best news from all over the World!",
                url: "https://otus.ru",
                source: "https://otus.ru",
                category: "sports",
                language: "en",
                country: "USA",
                publishedAt: "2023-06-03"
            )
        )
    }
}
