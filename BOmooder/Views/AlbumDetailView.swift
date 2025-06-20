//
//  ContentView.swift
//  BOmooder
//
//  Created by warbo on 11/6/25.
//

import SwiftUI

struct AlbumDetailView: View {
    // MARK: - PROPERTIES
    @State private var indexSelected: Int = 0
    @State private var selectedSong: SongModel?
    @State private var isPresentedSongView: Bool = false
    var listSong: [SongModel]{
        return songData.filter{$0.genre == selectedAlbum}
    }
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
                            .frame(width: 220,height: 220)
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
                    HStack(alignment: .center,spacing: 30){
                        VStack{
                            Image(systemName: "arrow.down.circle")
                                .font(.system(size: 20))
                            Text("Download")
                                .font(.system(size: 15))
                        }
                        ZStack {
                            Capsule()
                                .fill()
                                .frame(width: 200,height: 38)
                                .foregroundColor(Color.purple)
                            Text("Play Random".uppercased())
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                        }
                        
                        VStack{
                                Image(systemName: "heart")
                                    .font(.system(size: 20))
                            
                            Text("Favorite")
                                .font(.system(size: 15))
                        }
                        
                    }//: HSTACK
                    
                    
                    Spacer(minLength: 30)
                    VStack{
                        ForEach(listSong.enumerated().map{($0,$1)},id:\.1.songName){index,song in
                            HStack(alignment:.top){
                                    Text("\(index + 1)")
                                
                                    SongItemView( songTitle: song.songName, artist: song.artist)
                            }
                            .padding(.horizontal,6)
                            .onTapGesture{
                                self.indexSelected = index
                                selectedSong = song
                                isPresentedSongView = true
                                
                                
                            }
                                }
                        .fullScreenCover(item:$selectedSong){songPlay in
                            SongPlayingView(song: songPlay, playList: listSong, index: $indexSelected)
                            
                        }
                                
                            }
                   
                            
                            
                            
                            
                            
                            
                        }
                    }
                    Spacer()
                }//: VSTACK
            }
        //: SCROLL VIEW
    


#Preview {
    AlbumDetailView(albumImage: "huynh-de-lyhai", title: "Trọn Đời Bên Em 7", selectedAlbum: "Trọn Đời Bên Em 7")
}
