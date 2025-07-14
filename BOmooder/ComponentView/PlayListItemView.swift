//
//  PlayListItemView.swift
//  BOmooder
//
//  Created by warbo on 10/7/25.
//

import SwiftUI

struct PlayListItemView: View {
    var playListName: String
    var artistsName: String
    var imagePlayList: String
    var body: some View {
        HStack(alignment:.center,spacing: 10){
           Image(imagePlayList)
                .resizable()
                .frame(width: 88, height: 88)
                .cornerRadius(8)
                
            VStack(alignment:.leading,spacing: 10){
                Text(playListName)
                    .font(.title3)
                    .lineLimit(1)
                Text(artistsName)
                    .font(.system(size: 16))
                    .foregroundColor(.secondary)
                    .lineLimit(1)
                    
            }
//            .frame(width: 200)
//            .padding(.leading,-10)
            Spacer(minLength: 50)
            Image(systemName: "heart")
                .foregroundColor(Color.gray)
        }
        .padding(.horizontal,5)
    }
}

#Preview {
    PlayListItemView(playListName: "Thà quên đi còn hơn vương vấn", artistsName: "Phạm Trưởng", imagePlayList: "pham-truong")
}
