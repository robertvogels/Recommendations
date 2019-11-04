//
//  RecommendationRowView.swift
//  Recommendations
//
//  Created by Robert on 28/10/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import SwiftUI
import Foundation

struct RecommendationRow: View {
    
    var recommendation: Recommendation
    
    var body: some View {
        
        HStack {
            
            Image(uiImage: recommendation.img)
            .resizable()
                .frame(width: 60, height: 60)
                .scaledToFit()
                .padding(.all, 0.5)

            VStack (alignment: .leading){
                Text(recommendation.title)
                    .fontWeight(.bold)
                Text(recommendation.category)
                    .fontWeight(.light).padding(.top, 5)
            }
            
        }
        
    }
}
