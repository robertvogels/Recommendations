//
//  NewItemView.swift
//  Recommendations
//
//  Created by Robert on 28/10/2019.
//  Copyright © 2019 Robert Vogels. All rights reserved.
//

import SwiftUI
import Foundation

struct NewItemView: View {
    
    @Binding var isPresentedNewItem: Bool
    
    @State var isPrestenedCamera: Bool = false
    @State var image: UIImage? = nil
    @State var imageView: Image? = nil
    
    @State var newTitle: String = ""
    @State var newNote: String = ""
    @State var newRecommendedBy = ""
    
    var addRecommendation: (Recommendation) -> ()
    
    let categoryCollection: [String] = getCategoryOptions()
    @State private var selectedCategory = 0
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Form {
                    
                    Section {
                        AnnotatedTextField(label: "Title", placeholder: newTitle, text: $newTitle)
                        AnnotatedTextField(label: "Recommendation by", placeholder: newRecommendedBy, text: $newRecommendedBy)
                        AnnotatedTextField(label: "Notes", placeholder: newNote, text: $newNote)
                    }
                    Section {
                        Picker(selection: $selectedCategory, label: Text("Category").font(.headline)) {
                            ForEach(0 ..< self.categoryCollection.count) {
                                Text(self.categoryCollection[$0])
                            }
                        }.padding(.horizontal, 8)
                    }
                    Section {
                        Button(action: {self.isPrestenedCamera = true}, label: {Text("Add photo")})
                    }
                    Section {
                        imageView?
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    }.frame(height: 250, alignment: .center)
                    
                }.padding(.top, 5)

            }
                .navigationBarTitle("Add New Item")
                .navigationBarItems(leading: Button(action: {
                        self.isPresentedNewItem = false
                    }, label: {Text("Cancel")}), trailing: Button(action: {
                        if self.newTitle.isEmpty {
                        } else {
//                            let newimage = Image(uiImage: self.image ?? UIImage(imageLiteralResourceName: "infoSymbol"))
                            self.addRecommendation(Recommendation.init(title: self.newTitle, category: self.categoryCollection[self.selectedCategory], recommendedBy:self.newRecommendedBy, note:self.newNote, img: self.image ?? UIImage()))
                            self.isPresentedNewItem = false
                        }
                    }, label: {Text("Add").fontWeight(.bold)}))
                .sheet(isPresented: self.$isPrestenedCamera, content: { ImageCaptureView(showImagePicker: self.$isPrestenedCamera, image: self.$image, imageView: self.$imageView)
                })
        }
    }
}
