//
//  PlayListDetailView.swift
//  BOmooder
//
//  Created by warbo on 12/7/25.
//

import SwiftUI

struct PlayListDetailView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var audioPlayer = AudioPlayer()
    @Binding var selectedSong: SongModel?
    
    var playListInfo: PlayListCard
    var body: some View {
        ScrollView(.vertical,showsIndicators: false) {
            VStack {
                HStack{
                    Spacer()
                    Image(systemName: "ellipsis")
                }
                
                    Image(playListInfo.playListImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 110,height: 110)
                        .cornerRadius(8)
                        .padding(.top,25)
                    
                
                VStack(spacing:8) {
                    Text(playListInfo.playListName)
                        .font(.title)
                        .fontWeight(.bold)
                    Text("BOmooder")
                    HStack(alignment:.center) {
                        Text("\(playListInfo.playListSong.count) \(playListInfo.playListSong.count > 1 ? "Songs" : "Song")")
                        Circle().frame(width: 4, height: 4)
                        Text("2 h 29 m")
                    }
                }
                .multilineTextAlignment(.center)
                HStack(alignment: .center,spacing: 30){
                    VStack{
                        Image(systemName: "arrow.down.circle")
                            .font(.system(size: 20))
                        Text("Download")
                            .font(.system(size: 15))
                    }
                    
                    Button(action:{
                        
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
//                        .fullScreenCover(item: $selectedSong){ songPlay in
//                            SongPlayingView(song: songPlay, playList: listSong, index: $indexSelected)
//                        }
                    
                    
                    
                    VStack{
                            Image(systemName: "heart")
                                .font(.system(size: 20))
                        
                        Text("Favorite")
                            .font(.system(size: 15))
                    }
                    
                }//: HSTACK
                
                
                Spacer(minLength: 30)
                
                Text("Right here there're many hit song so chill, listen while feeling")
                    .multilineTextAlignment(.center)
                VStack{
                    ForEach(playListInfo.playListSong){
                        item in
                        SongElementView(imageSong: item.artistImage, songName: item.songName, artistName: item.artist)
                            .onTapGesture {
                                selectedSong = item
                                
                            }
                    }
                        
//                        .fullScreenCover(item:$selectedSong){songPlay in
//                            SongPlayingView(song: songPlay, playList: listSong, index: $indexSelected)
//
//                        }
                            
                        }
               
                        
                        
                        
                        
                        
                        
                    }
            .padding(.horizontal,8)
                }//: VSTACK
        
                Spacer()
            .navigationBarBackButtonHidden(true)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        dismiss()
                    }label: {
                        Image(systemName: "chevron.left")
                    }
                }
            }
            }
        
        }
    //: SCROLL VIEW
    


#Preview {
    PlayListDetailView(selectedSong: .constant(SongModel(songName: "LK Nhẫn Cưới", artistImage: "backdiamondring", artist: "Mạnh Quỳnh, Phi Nhung, Như Quỳnh", genre:"Nhạc Vàng", fileURL: "/Users/warbo/Project/ Warbo's Project/Bomooder/BOmooder/SongFile/PBN 62 ｜ Như Quỳnh, Phi Nhung, Mạnh Quỳnh - LK Nhẫn Cưới.mp3")),playListInfo: PlayListCard(playListImage: "asia-symbols", playListName: "Nhạc Vàng VNCH", playListSong: [SongModel(songName: "LK Nhẫn Cưới", artistImage: "backdiamondring", artist: "Mạnh Quỳnh, Phi Nhung, Như Quỳnh", genre:"Nhạc Vàng", fileURL: "/Users/warbo/Project/ Warbo's Project/Bomooder/BOmooder/SongFile/PBN 62 ｜ Như Quỳnh, Phi Nhung, Mạnh Quỳnh - LK Nhẫn Cưới.mp3")], playListSingers: ""))
}
