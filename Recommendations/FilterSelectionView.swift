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
    
    let cats: [String] = getCategoryCollection()
    
 //   var setFilterCategory: (String) -> ()
    @Binding var filteredCategory: String?
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        
        Form {
            
            ForEach(0 ..< self.cats.count) { item in
                
                Button(action: {

                    print("select")
                    self.filteredCategory = self.cats[item]
                    
 //                   self.setFilterCategory(self.cats[item])

                }, label: { Text(self.cats[item]).foregroundColor( .white) } )
                
            }

        }
        
    }
    
}
