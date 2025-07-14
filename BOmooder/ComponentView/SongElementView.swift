//
//  SongElementView.swift
//  BOmooder
//
//  Created by warbo on 12/7/25.
//

import SwiftUI

struct SongElementView: View {
    var imageSong: String
    var songName: String
    var artistName: String
    var body: some View {
        HStack(alignment:.center,spacing: 10){
            Image(imageSong)
                .resizable()
                .scaledToFill()
                .frame(width: 88, height: 88)
                .cornerRadius(8)
                
            VStack(alignment:.leading,spacing:10){
                Text(songName)
                    .font(.title3)
                    .lineLimit(1)
                    
                Text(artistName)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
            }
            Spacer()
            Image(systemName:"ellipsis")
        }
        .padding(.horizontal,5)
    }
}

#Preview {
    SongElementView(imageSong: "pham-truong", songName: "Thà Quên Đi", artistName: "Phạm Trưởng")
}
