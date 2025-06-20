//
//  HeaderView.swift
//  BOmooder
//
//  Created by warbo on 11/6/25.
//

import SwiftUI

struct HeaderView: View {
    // MARK: - PROPERTIES
    var title: String
    
    // MARK: - PREVIEW
    var body: some View {
        HStack(alignment:.center,spacing: 25) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
            Spacer()
//            ZStack(){
//                Capsule()
//                    .fill(Color("ColorCapsule"))
//                    .frame(width: 100,height: 50)
//                HStack(alignment:.center){
//                    Image(systemName: "paintbrush")
//                        .foregroundColor(Color("ColorIcon"))
//                        .fontWeight(.bold)
//                        .font(.system(size:18))
//                    Text("Theme")
//                        .font(.headline)
//                        .fontWeight(.regular)
//                }
//            }//: ZSTACK
            Image(systemName: "microphone")
                .fontWeight(.bold)
                .font(.system(size:18))
            Image(systemName: "magnifyingglass")
                .fontWeight(.bold)
                .font(.system(size:18))
                
            
        }//: HSTACK
        .padding(.horizontal,12)
    }
}

#Preview {
    HeaderView(title: "Explore")
}
