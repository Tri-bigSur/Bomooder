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
    @State private var isPresentedSongView: Bool = false
    @Binding var playList: [SongModel]
    @Binding var selectedSong: SongModel?
    @Binding var isPlaying: Bool
    var albumInfo: AlbumCardViewModel
   
    func randomSong(){
        let randomIndex = Int.random(in: 0..<albumInfo.albumSong.count)
    selectedSong = albumInfo.albumSong[randomIndex]
   
}
    // MARK: - BODY
    var body: some View {
        
            ScrollView(.vertical,showsIndicators: false) {
                VStack {
                    
                    ZStack{
                        Image(albumInfo.albumImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220,height: 220)
                            .cornerRadius(8)
                        
                    }
                    VStack(spacing:8) {
                        Text(albumInfo.albumTitle)
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
                        
                        Button(action:{
                            randomSong()
                        }) {
                            ZStack {
                                Capsule()
                                    .fill()
                                    .frame(width: 200,height: 40)
                                    .foregroundColor(Color.purple)
                                Text("Play Random".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                
                            }
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
                        ForEach(albumInfo.albumSong.enumerated().map{($0,$1)},id:\.1.songName){index,song in
                            HStack(alignment:.top){
                                    Text("\(index + 1)")
                                
                                    SongItemView( songTitle: song.songName, artist: song.artist)
                            }
                            .padding(.horizontal,6)
                            .onTapGesture{
                                self.indexSelected = index
                                selectedSong = song
                                playList = albumInfo.albumSong
                                isPlaying = true
                                
                                

                                
                                
                            }
                                }
//                        .fullScreenCover(item:$selectedSong){songPlay in
//                            SongPlayingView(song: songPlay, playList: listSong, index: $indexSelected)
//                            
//                        }
                                
                            }
                   
                            
                            
                            
                            
                            
                            
                        }
                    }
                    Spacer()
                }//: VSTACK
            }
        //: SCROLL VIEW
    


#Preview {
    AlbumDetailView(playList: .constant([]), selectedSong: .constant(SongModel(songName: "Một Mình Đi Về",artistImage: "huynh-de-lyhai", artist: "Lý Hải", genre: "Trọn Đời Bên Em 7",fileURL: "/Users/warbo/Project/ Warbo's Project/Bomooder/BOmooder/SongFile/Một Mình Đi Về.mp3")), isPlaying: .constant(false), albumInfo:AlbumCardViewModel(albumImage: "SongImage", albumTitle: "Trọn Đời Bên Em 6", albumSong: [SongModel(songName: "Hãy Một Lần Yêu",artistImage: "SongImage" ,artist:"Lý Hải ", genre: "Trọn Đời Bên Em 6",fileURL: "/Users/warbo/Project/ Warbo's Project/Bomooder/BOmooder/SongFile/Hãy Một Lần Yêu - Lý Hải.mp3"),
                                                                                                                                                                                                                                                                                                                                                                                                    SongModel(songName: "Nơi Nào Tình Yêu Là Mãi Mãi",artistImage: "SongImage", artist: "Lý Hải", genre: "Trọn Đời Bên Em 6",fileURL: "/Users/warbo/Project/ Warbo's Project/Bomooder/BOmooder/SongFile/Nơi nào tình yêu là mãi mãi .mp3"),
                                                                                                                                                                                                                                                                                                                                                                                                    SongModel(songName: "Xin Một Lần Đau",artistImage: "SongImage",artist: "Lý Hải", genre: "Trọn Đời Bên Em 6",fileURL: "/Users/warbo/Project/ Warbo's Project/Bomooder/BOmooder/SongFile/Xin Một Lần Đau.mp3")]) )
}
