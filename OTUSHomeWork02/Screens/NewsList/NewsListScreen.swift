//
//  NewsListScreen.swift
//  OTUSHomeWork02
//
//  Created by anduser on 25.06.2023.
//

import SwiftUI

struct NewsListScreen: View {

    @EnvironmentObject var viewModel: NewsListViewModel

    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                
                NavButtonPop(destination: .root) {
                    HStack {
                        Image(systemName: "arrow.backward.square")
                        Text("Back to MAIN")
                    }
                    .font(.headline)
                    .foregroundColor(Color(uiColor: .systemPink))
                    .padding()
                }

                List {
                    ForEach(viewModel.articles, id: \.self) { article in
                        NavButtonPush(destination: NewsDetailsScreen(article: article)) {
                            NewsCell(
                                header: article.title ?? "",
                                description: article.description ?? "",
                                date: viewModel.formatDate(article.publishedAt ?? "")
                            )
                            .frame(height: 180)
                            .onAppear() {
                                if viewModel.articles.isLastItem(article) {
                                    viewModel.nextPage()
                                }
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }

            if viewModel.loaderIsShowing {
                Color(uiColor: .systemBackground)
                    .ignoresSafeArea()

                LoaderView()
            }
        }
    }
}

struct NewsListScreen_Previews: PreviewProvider {
    static var previews: some View {
        NewsListScreen()
    }
}
