//
//  tinyAlbumCardView.swift
//  BOmooder
//
//  Created by warbo on 11/6/25.
//

import SwiftUI

struct TinyAlbumCardView: View {
    // MARK: - PROPERTIES
    var imageSinger: String
    var songName: String

    // MARK: - BODY
    var body: some View {
        VStack(alignment:.leading,spacing: 4) {
            Image(imageSinger)
                .resizable()
                .scaledToFit()
                .frame(width: 110,height: 120)
                .cornerRadius(12)
                .overlay(
                    Button(action:{
                        print("Playing Song ")
                    }){
                        Image(systemName: "play.circle.fill")
                            .padding(.bottom,10)
                            .padding(.trailing,8)
                            .foregroundColor(Color.white)
                       
                    }
                    ,alignment: .bottomTrailing
                   
                    
                    
                
                )
                
            Text(songName)
                .fontWeight(.medium)
                .font(.system(size: 18))
                .frame(maxWidth: 100,alignment: .leading)
                .lineLimit(2)
                
                
                
        }//: VSTACK
//        .frame(width: 150,height: 150,alignment: .leading)
        
    }
}

#Preview {
    TinyAlbumCardView(imageSinger: "SongImage", songName: "Trọn Đời Bên Em 6")
}
