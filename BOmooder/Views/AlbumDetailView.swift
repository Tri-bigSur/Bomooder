//
//  ContentView.swift
//  BOmooder
//
//  Created by warbo on 11/6/25.
//

import SwiftUI

struct ContentView: View {
    // MARK: - PROPERTIES
    var albumImage: String
    var title: String
    let selectedAlbum: String
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack {
                
                ZStack{
                    Image(albumImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 258,height: 258)
                        .cornerRadius(8)
                    
                }
                VStack(spacing:8) {
                    Text(title)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("Lý Hải")
                    HStack(alignment:.center) {
                        Text("Album")
                        Circle().frame(width: 4, height: 4)
                        Text("2006")
                    }
                }
                HStack(alignment: .center,spacing: 25){
                    VStack{
                        Image(systemName: "arrow.down.circle")
                            .font(.system(size: 35))
                        Text("Download")
                    }
                    ZStack {
                        Capsule()
                            .fill()
                            .frame(width: 200,height: 55)
                            .foregroundColor(Color.purple)
                        Text("Play Random".uppercased())
                            .fontWeight(.bold)
                    }
                    VStack{
                        Image(systemName: "heart")
                            .font(.system(size: 35))
                        Text("Favorite")
                    }
                }//: HSTACK
                
                Spacer(minLength: 30)
                VStack{
                    ForEach(songData.filter{$0.genre == selectedAlbum}.enumerated().map{($0,$1)},id:\.1.songName){idex,song  in
                            HStack(alignment:.top){
                                Text("\(idex + 1)")
                                SongItemView( songTitle: song.songName, artist: song.artist)
                            }
                            
                    
                       
                    
                        
                       
                    }
                }
                Spacer()
            }//: VSTACK
        }//: SCROLL VIEW
    }
}

#Preview {
    ContentView(albumImage: "huynh-de-lyhai", title: "Trọn Đời Bên Em 7", selectedAlbum: "Trọn Đời Bên Em 7")
}
