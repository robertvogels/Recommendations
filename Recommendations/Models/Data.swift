//
//  Data.swift
//  Recommendations
//
//  Created by Robert on 01/11/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import Foundation
import UIKit
import SwiftUI

let data: [Recommendation] = []

func loadJSON() -> [Recommendation] {
    
    let jsonData: Data
    var unModeledData: [RecommendationReadyForJSON] = []
    let file = getDocumentUrl()
    
    do {
        jsonData = try Data(contentsOf: file)
    } catch {
        print("There is no data file. Couldn't fetch data from .json file")
        return []
    }
    
    do {
        let decoder = JSONDecoder()
        unModeledData = try decoder.decode([RecommendationReadyForJSON].self, from: Data(jsonData))
    } catch {
        print("No decode possible")
        return []
    }
    
    return convertDataFromJSONReady(recItemsJSON: unModeledData)
}

func saveToJSON(recItems: [Recommendation]) -> () {
    
    let jsonReady = convertDataToJSONReady(recItems: recItems)
    
    let encoder = JSONEncoder()
    let jsonData = try! encoder.encode(jsonReady)
    try! jsonData.write(to: getDocumentUrl())
    
}

func convertDataToJSONReady(recItems: [Recommendation]) -> [RecommendationReadyForJSON] {
    
    var output: [RecommendationReadyForJSON] = []
    
    for item in recItems {
        let appendItem = RecommendationReadyForJSON.init(title: item.title, category: item.category, recommendedBy: item.recommendedBy, note: item.note, imgBase64: UIImage.toBase64(item.img)() ?? String())
        output.append(appendItem)
    }
    
    return output
}

func convertDataFromJSONReady(recItemsJSON: [RecommendationReadyForJSON]) -> [Recommendation] {
    
    var output: [Recommendation] = []
    
    for item in recItemsJSON {
        
        let decodedData =  Data(base64Encoded: item.imgBase64, options: .ignoreUnknownCharacters)
        let decodedImage = UIImage(data: decodedData!)
        let appendItem = Recommendation.init(title: item.title, category: item.category, recommendedBy: item.recommendedBy, note: item.note, img: decodedImage ?? UIImage())
        output.append(appendItem)
        
    }
    return output
}

func getDocumentsDirectory() -> URL? {
    let paths = Bundle.main.url(forResource: "data.json", withExtension: nil)
    return paths
}

func getDocumentUrl() -> URL {
    return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask) [0] .appendingPathComponent("data.json")
}

