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
                .background(LinearGradient(gradient: Gradient(colors: [Color.init( red: 0, green: 0, blue: 0.5, opacity: 1), Color.init( red: 0.7, green: 0.85, blue: 0.9, opacity: 1)]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(40)
                .font(.title3)
            
        })
    }
}
