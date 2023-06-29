//
//  OTUSHomeWork02App.swift
//  OTUSHomeWork02
//
//  Created by anduser on 25.06.2023.
//

import SwiftUI

@main
struct OTUSHomeWork02App: App {

    // MARK: - Body

    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(NewsListViewModel())
        }
    }
}
