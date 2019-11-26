//
//  ModalViewObjects.swift
//  Recommendations
//
//  Created by Robert on 28/10/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import SwiftUI
import Foundation

struct AnnotatedTextField: View {
    
    var label: String
    var placeholder : String
    @Binding var text: String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 7) {
            Text(label).font(.headline)
            TextField(placeholder, text: $text)
            .padding(.all, 5)
        }.padding(.horizontal,8)
        
    }
    
}

struct FilterViewIndicationOn: View {
    
    let selectedFilter: String
    
    var body: some View {
        
        Text(selectedFilter)
            .padding(.all, 9)
            .font(.system(size:15))
            .background(Color.blue)
            .cornerRadius(4.0)
            .foregroundColor(Color.white)

        
    }
}
