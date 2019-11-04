//
//  DetailedItemView.swift
//  Recommendations
//
//  Created by Robert on 28/10/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import SwiftUI
import Foundation

struct DetailedView: View {
    
    @State var deleteButtonText = "Delete"
    var recommendationItem: Recommendation
    var deleteRecommendation: (Recommendation) -> ()
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        VStack {
            
            Form {
                Section {
                    
                    HStack {
                        
                    Spacer()
                        Image(uiImage: recommendationItem.img)
                        .resizable()
                        .frame(width: 225, height: 225)
                        .scaledToFit()
                    Spacer()
                        
                    }
                        .padding(.top, 10)
                        .padding(.bottom, 10)
                }
                Section {
                    Text(recommendationItem.title)
                        .fontWeight(.bold)
                        .font(.system(size: 20))
                        .padding(.top, 12)
                        .padding(.bottom, 12)
                }
                Section {
                    HStack {
                        Text("Recommended by:").fontWeight(.light)
                        Spacer()
                        Text(recommendationItem.recommendedBy)
                    }
                    HStack {
                        Text("Category:").fontWeight(.light)
                        Spacer()
                        Text(recommendationItem.category)
                    }
                }
                Section {
                    Text(recommendationItem.note).padding(.top, 10)
                        .padding(.bottom, 10)
                }
                Section {
                    
                    Button(action: {
                        if (self.deleteButtonText == "Sure?") {
                                self.deleteRecommendation(self.recommendationItem)
                                self.presentation.wrappedValue.dismiss()
                        } else {
                                self.deleteButtonText = "Sure?"
                        }
                        
                    }, label: {Text(deleteButtonText)}).foregroundColor(Color.red)
                    
                }
                
            }
        }
        
    }
}

