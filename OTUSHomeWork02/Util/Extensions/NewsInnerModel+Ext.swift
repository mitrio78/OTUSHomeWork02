//
//  NewsInnerModel+Ext.swift
//  OTUSHomeWork02
//
//  Created by anduser on 29.06.2023.
//

import MediaStackAPI
import Foundation

extension NewsListDataInner: Identifiable {
    public var id: String { self.url ?? "" }
}
