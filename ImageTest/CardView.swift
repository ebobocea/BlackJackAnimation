//
//  CardView.swift
//  ImageTest
//
//  Created by Elisei Bobocea on 17/12/2022.
//

import SwiftUI

struct CardView: View {
        @State private var image: Image?
    
    init(image: Image?) {
            self._image = State(initialValue: image)
        }
        var body: some View {
            
            VStack{
                
                if image != nil {
                    image!
                        .resizable()
                        .frame(width: 100, height: 150)
                } else {
                    Text("No image")
                }
            }
        }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(image: Image("ace_clubs"))
            .previewLayout(.sizeThatFits)
    }
}
