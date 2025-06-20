//
//  SongItemView.swift
//  BOmooder
//
//  Created by warbo on 13/6/25.
//

import SwiftUI

struct SongItemView: View {
    // MARK: - PROPERTIES
    
    var songTitle: String
    var artist: String
    
    // MARK: - BODY
    var body: some View {
        
        
            HStack(alignment: .top,spacing: 20){
                
                VStack(alignment:.leading) {
                    Text(songTitle)
                        .fontWeight(.semibold)
                    Text(artist)
                }
                Spacer()
                VStack {
                    Spacer()
                    Image(systemName: "ellipsis")
                    Spacer()
                }
                
            }//: HSTACK
        
        .frame(height: 50)
        
    }
}

#Preview {
    SongItemView(songTitle: "Lạc Loài", artist: "Lý Hải")
}
