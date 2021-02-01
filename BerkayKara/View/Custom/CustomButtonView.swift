//
//  CustomButtonView.swift
//  BerkayKara
//
//  Created by Berkay KARA on 26.01.2021.
//

import Kingfisher
import SwiftUI

struct CustomButtonView: View {
    
    let collectionURL: String
    let type: String
    
    var body: some View {
        
        Link(destination: URL(string: collectionURL)!, label: {
            Text("Download this \(type)")
                .frame(minWidth: 0, maxWidth: 250, minHeight: 0 ,maxHeight: 20)
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .font(.title3)
            
        })
    }
}
