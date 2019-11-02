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

func getCategoryCollection() -> [String] {
    return ["Movie/series", "Music", "Book", "Restaurant", "Place", "Event", "Game", "Other"].sorted()
}

func getNoImageSelected() -> UIImage {
    return #imageLiteral(resourceName: "infoSymbol")
}

func fillWithExampleData() -> [Recommendation] {
    
//    let exampleData: [Recommendation] = [
//        .init(title:"Pulp Fiction", category:"Movie/series", recommendedBy:"Tim", note:"veel geweld, schijnbaar een modern meesterwerk volgens dat ene boek", img: Image(uiImage: #imageLiteral(resourceName: "pf"))),
//        .init(title: "Savarijn", category: "Restaurant", recommendedBy: "Marla", note: "franse keuken, niet al te duur", img: Image(uiImage: getNoImageSelected())),
//        .init(title:"The Matrix", category:"Movie/series", recommendedBy:"Gil", note:"science-fiction met filosofische inslag uit de jaren 90", img: Image(uiImage: #imageLiteral(resourceName: "matrix"))),
//        .init(title:"Once Upon a Time in the West", category:"Movie/series", recommendedBy:"Gil", note:"epische westernfilm van Italiaanse bodem, klassieker", img: Image(uiImage: #imageLiteral(resourceName: "onceupon"))),
//        .init(title: "The Picture of Dorian Gray", category: "Book", recommendedBy: "Robert", note: "coming of age verhaal van iemand in de Britse sociale elite", img: Image(uiImage: getNoImageSelected()))]
    
    let exampleData: [Recommendation] = [.init(title: "Pulp Fiction", category: "Movie/series", recommendedBy: "Bart", note: "my note", img: UIImage(imageLiteralResourceName: "pf"))]
    
    return exampleData
    
}
