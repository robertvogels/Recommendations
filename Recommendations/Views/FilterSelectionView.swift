//
//  FilterSelectionView.swift
//  Recommendations
//
//  Created by Robert on 28/10/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import Foundation
import SwiftUI

struct FilterSelection: View {
    
    let cats: [String] = getCategoryOptions()
    @Binding var filteredCategory: String?
    @Environment(\.presentationMode) var presentation
    
    private func dismissEnvironment() -> () {
        self.presentation.wrappedValue.dismiss()
    }
    
    var body: some View {
        
        Form {
            Section {
                Button(action: {
                    self.filteredCategory = nil
                    self.dismissEnvironment()
                }, label: {Text("No filter").foregroundColor(.red)})
            }
            Section {
//                for item in Category.allCases {
//                    Button(action: {
//                        self.filteredCategory = self.cats[item]
//                        self.dismissEnvironment()
//                    }, label: { Text(self.cats[item]).foregroundColor(.white) } )
//                }
                
                ForEach(0 ..< self.cats.count) { item in
                    Button(action: {
                        self.filteredCategory = self.cats[item]
                        self.dismissEnvironment()
                    }, label: { Text(self.cats[item]).foregroundColor(.white) } )
                }
            }
        }
        
    }
    
}


