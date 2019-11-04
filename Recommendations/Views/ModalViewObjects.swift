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
