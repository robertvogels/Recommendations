//
//  Models.swift
//  Recommendations
//
//  Created by Robert on 28/10/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import UIKit
import Foundation
import SwiftUI

struct Recommendation: Identifiable {

    let id = UUID()
    let title: String
    let category: String
    let recommendedBy: String
    let note: String
    let categoryCollection: [String] = getCategoryCollection()
    let img: UIImage
    
}

struct RecommendationReadyForJSON: Identifiable, Codable {
    
    let id = UUID()
    let title: String
    let category: String
    let recommendedBy: String
    let note: String
    let imgBase64: String
    
}

enum Category: String, CaseIterable, Hashable, Codable {
    case movies = "Movies"
    case books = "Books"
    case music = "Music"
    case events = "Events"
    case games = "Games"
    case places = "Places"
    case restaurants = "Restaurants"
    case other = "Other"
}


func getCategoryOptions() -> [String] {
    var categories = [String]()
    for item in Category.allCases {
        categories.append(item.rawValue)
    }
    return categories
}

func getCategoryCollection() -> [String] {
    return ["Movie/series", "Music", "Book", "Restaurant", "Place", "Event", "Game", "Other"].sorted()
}

func getNoImageSelected() -> UIImage {
    return #imageLiteral(resourceName: "infoSymbol")
}

func fillWithExampleData() -> [Recommendation] {
    let exampleData: [Recommendation] = [.init(title: "Pulp Fiction", category: "Movie/series", recommendedBy: "Bart", note: "my note", img: UIImage(imageLiteralResourceName: "pf"))]
    return exampleData
}
