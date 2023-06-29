//
//  SegmentedControlScreen.swift
//  OTUSHomeWork02
//
//  Created by anduser on 26.06.2023.
//

import SwiftUI

struct SegmentedControlScreen: View {

    // MARK: - Properties

    @EnvironmentObject var viewModel: NewsListViewModel

    // MARK: - Body

    var body: some View {
        VStack {
            NavButtonPop(destination: .root) {
                HStack {
                    Image(systemName: "arrow.backward.square")
                    Text("Back to MAIN")
                }
                .font(.headline)
                .foregroundColor(Color(uiColor: .systemPink))
                .padding()
            }

            Text("Choose category:")

            Picker("Choose category", selection: $viewModel.currentCategory) {
                ForEach(NewsCategoryType.allCases, id: \.self) { category in
                    Text(category.rawValue.uppercased()).tag(category.rawValue)
                }
            }
            .pickerStyle(.automatic)
            
            NewsListScreen()
        }
    }
}

// MARK: - Preview

struct SegmentedControlScreen_Previews: PreviewProvider {
    static var previews: some View {
        SegmentedControlScreen()
    }
}
