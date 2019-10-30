//
//  ContentView.swift
//  Recommendations
//
//  Created by Robert on 28/10/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import SwiftUI

struct RecommendationList: View {
    
    @State var storedRecommendations: [Recommendation]
    @State var presentingAddSheet = false
    
    @State var filteredCategory: String? = nil
    
//    func populateRows(recommendationItem: Recommendation) -> (NavigationView) {
//        let view = NavigationLink(destination: DetailedView(recommendationItem: recommendationItem, deleteRecommendation: { item in self.storedRecommendations.removeAll(where: {$0.id == item.id})})) {
//                RecommendationRow(recommendation: recommendationItem) }
//        return view
//    }
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(storedRecommendations) { recItem in
                    if self.filteredCategory == nil {
                        NavigationLink(destination: DetailedView(recommendationItem: recItem, deleteRecommendation: { item in self.storedRecommendations.removeAll(where: {$0.id == item.id})})) {
                            RecommendationRow(recommendation: recItem) }
                    } else {
                        if recItem.category == self.filteredCategory {
                            NavigationLink(destination: DetailedView(recommendationItem: recItem, deleteRecommendation: { item in self.storedRecommendations.removeAll(where: {$0.id == item.id})})) {
                                RecommendationRow(recommendation: recItem)
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Recommendations")
            .padding(.all, 10)
            .navigationBarItems(
                leading: NavigationLink(destination: FilterSelection(filteredCategory: $filteredCategory)) {
                    Text("Filter")
                },
                trailing: Button(action: {
                self.presentingAddSheet.toggle()
                }, label: {
                Text("Add")
                    .padding(.all, 9)
                    .font(.system(size:15))
                    .foregroundColor(.white)
                    .background(Color.green)
                    .cornerRadius(4)
            }))
                .sheet(isPresented: $presentingAddSheet, content: {
                    NewItemView(isPresentedNewItem: self.$presentingAddSheet, addRecommendation: {
                        item in
                        
                        self.storedRecommendations.append(item)
                    })
                })
            
        }
        
    }
}
