//
//  SegmentedControlScreen.swift
//  OTUSHomeWork02
//
//  Created by anduser on 26.06.2023.
//

import SwiftUI

struct SegmentedControlScreen: View {

    @EnvironmentObject var viewModel: NewsListViewModel

    var body: some View {
        VStack {
            Picker("What is your favorite color?", selection: $viewModel.currentCategory) {
                ForEach(NewsCategoryType.allCases, id: \.self) { category in
                    Text(category.rawValue.uppercased()).tag(category.rawValue)
                }
            }
            .pickerStyle(.segmented)

            Text("Category: \(viewModel.currentCategory.rawValue.uppercased())")

            NewsListScreen()
        }
    }
}

struct SegmentedControlScreen_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlScreen()
    }
}
