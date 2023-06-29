//
//  NewsListViewModel.swift
//  OTUSHomeWork02
//
//  Created by anduser on 25.06.2023.
//

import MediaStackAPI
import SwiftUI

final class NewsListViewModel: ObservableObject {

    // MARK: - Properties
    
    @Published var articles: [NewsListDataInner] = []
    @Published var loaderIsShowing: Bool = false

    @Published var canLoad: Bool = true
    @Published var isFinished: Bool = false

    var currentCategory: NewsCategoryType = .sports {
        didSet {
            fetchNews()
        }
    }

    // MARK: - Private Properties

    private var currentPage: Int = 1
    private lazy var todayDate: String = {
        format(stringDate: Date().description, fromFormat: "yyyy-MM-dd HH:mm:ssZ", toFormat: "yyyy-MM-dd")
    }()
    private lazy var yesterdayDate: String = {
        let date = Calendar.current.date(byAdding: .day, value: -1, to: Date()) ?? Date()
        return format(stringDate: date.description, fromFormat: "yyyy-MM-dd HH:mm:ssZ", toFormat: "yyyy-MM-dd")
    }()

    // MARK: - Init

    init() {
        fetchNews()
    }

    // MARK: - Methods

    func fetchNews() {
        guard canLoad else {
            return
        }

        canLoad = false
        loaderIsShowing = true

        ArticlesAPI.everythingGet(
            accessKey: Constants.apiKey,
            categories: currentCategory.rawValue,
            offset: currentPage,
            date: "\(todayDate),\(yesterdayDate)",
            apiResponseQueue: .main
        ) { [weak self] data, error in
            guard let data = data else {
                return
            }

            self?.articles = data.data
            self?.loaderIsShowing = false
            self?.currentPage += 1
            self?.canLoad = true
        }
    }

    func nextPage() {
        ArticlesAPI.everythingGet(
            accessKey: Constants.apiKey,
            categories: currentCategory.rawValue,
            offset: currentPage,
            date: "\(todayDate),\(yesterdayDate)",
            apiResponseQueue: .main
        ) { [weak self] data, error in
            guard let data = data else {
                return
            }

            self?.articles.append(contentsOf: data.data)
            self?.loaderIsShowing = false
            self?.currentPage += 1
            self?.canLoad = true
        }
    }

    func formatDate(_ stringDate: String) -> String {
        format(stringDate: stringDate, fromFormat: "yyyy-MM-dd'T'HH:mm:ssZ", toFormat: "MMM d, yyyy")
    }

    func format(stringDate: String, fromFormat: String, toFormat: String) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US")
        formatter.timeZone = .autoupdatingCurrent
        formatter.dateFormat = fromFormat
        guard let date = formatter.date(from: stringDate) else {
            return ""
        }
        formatter.dateFormat = toFormat
        let result = formatter.string(from: date)
        return result
    }
}

// MARK: - Private Methods

fileprivate extension NewsListViewModel {
    enum Constants {
        static let apiKey: String = "afd65b8f8df64732b165791222039541" // "f556071334fe2d67eff332fe872b384f"
    }
}
