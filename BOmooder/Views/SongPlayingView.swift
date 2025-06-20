//
//  SongPlayingView.swift
//  BOmooder
//
//  Created by warbo on 16/6/25.
//

import SwiftUI
import AVFoundation

struct SongPlayingView: View {
    // MARK: - PROPERTY
    @Environment(\.dismiss) var dismiss
    let song: SongModel
    let playList: [SongModel]
    @Binding var index: Int
    @StateObject var audioPlayer = AudioPlayer()
    @State private var sliderValue: Double = 0
    @State private var isDragging = false
    @State private var isPlaying: Bool = false
    @State private var currentTime: TimeInterval = 0
    @State private var seekTask: DispatchWorkItem?
    @State private var isChangeSong: Bool = false
    // MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment:.center){
                Button(action:{
                    dismiss()
                }){
                    Image(systemName: "chevron.down")
                        .font(.system(size: 25))
                        .accentColor(Color.primary)
                }
               
                Spacer()
                VStack {
                    Text("Play From")
                        .font(.system(size: 18,weight: .medium,design: .default))
                        .foregroundColor(Color.gray)
                    Text(song.genre)
                        .fontWeight(.semibold)
                        .font(.title3)
                }
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.system(size: 25))
                
            }//: Header
            Image(playList[index].artistImage)
                .resizable()
                .scaledToFill()
                .frame(width: 200,height: 200)
                .mask(Circle())
                .padding(.top,20)
            VStack {
                HStack(spacing:16){
                    Image(systemName: "arrowshape.turn.up.right")
                        .font(.system(size: 25))
                        .foregroundColor(Color.gray)
                    Spacer()
                    VStack {
                        Text(playList[index].songName)
                            .font(.system(size: 25))
                            .lineLimit(1)
                            .fontWeight(.semibold)
                        Text(playList[index].artist)
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                    Image(systemName: "heart")
                        .font(.system(size: 25))
                        .foregroundColor(Color.gray)
                        
                }//:HSTACK
                Slider(value: Binding(get:{audioPlayer.currentTime},set:{newValue in self.currentTime = newValue
                    self.audioPlayer.seek(to: newValue)
                }),in: 0...audioPlayer.duration)
                
                    //: Slider View
                HStack{
                    Text(audioPlayer.formatDuration(audioPlayer.currentTime))
                        
                    Spacer()
                    Text(audioPlayer.formatDuration(audioPlayer.duration))
                }
                
                HStack(alignment: .center,spacing: 25){
                    Image(systemName: "shuffle")
                        .font(.system(size: 16))
                    Spacer()
                    //: BACK SONG
                    Button(action:{
                        if index > 0 {
                            index -= 1
                            audioPlayer.playSong(at: URL(fileURLWithPath: playList[index].fileURL))
                        }else{
                            index = 0
                        }
                    }) {
                        Image(systemName: "arrowtriangle.backward")
                            .font(.system(size: 24))
                    }
                    Button(action:{
                        // Play song
                        isPlaying.toggle()
                        if isPlaying {
                            audioPlayer.playSong(at: URL(fileURLWithPath: playList[index].fileURL))
                            audioPlayer.seek(to: currentTime)
                        }else{
                            currentTime = audioPlayer.currentTime
                            audioPlayer.pause()
                        }
                        
                           
                       
                            
                        
                    }) {
                        Image(systemName: isPlaying ? "pause.circle" : "play.circle")
                            .font(.system(size: 48))
                    }
                    //: NEXT SONG
                        Button(action:{
                            isChangeSong.toggle()
                            if index + 1 < playList.count  {
                                index += 1
                                audioPlayer.playSong(at: URL(fileURLWithPath: playList[index].fileURL))
                                print("index: \(index)")
                            }else{
                                index = 0
                                audioPlayer.playSong(at: URL(fileURLWithPath: playList[index].fileURL))
                            }
                            
                        }) {
                            Image(systemName: "arrowtriangle.forward")
                                .font(.system(size: 24))
                        }
                    
                    Spacer()
                    Image(systemName: "repeat")
                        .font(.system(size: 16))
                    
                }
                .accentColor(Color.primary)
                
                
                
            }// Card Info Song
            .padding(.top,25)
            .padding(.horizontal,10)
            
            Spacer()
            
            
        }//: VSTACK
        .padding(.horizontal,10)
            
        
        
        
    
    }
       
}

#Preview {
    SongPlayingView(song: SongModel(songName: "Xin Một Lần Đau", artistImage: "SongImage", artist: "Lý Hải", genre: "Trọn Đời Bên Em 6", fileURL: "/Users/warbo/Project/ Warbo's Project/BOmooder/BOmooder/BOmooder/SongFile/Xin Một Lần Đau.mp3"), playList: [SongModel(songName: "Huynh Và Đệ", artistImage: "huynh-de-lyhai", artist: "Lý Hải", genre: "Trọn Đời Bên Em 7", fileURL: "/Users/warbo/Project/ Warbo's Project/BOmooder/BOmooder/BOmooder/SongFile/Nơi nào tình yêu là mãi mãi .mp3"),SongModel(songName: "Nơi Nào Tình Yêu Là Mãi Mãi",artistImage: "SongImage", artist: "Lý Hải", genre: "Trọn Đời Bên Em 6",fileURL: "/Users/warbo/Project/ Warbo's Project/BOmooder/BOmooder/BOmooder/SongFile/Nơi nào tình yêu là mãi mãi.mp3")], index: .constant(1))
        
}
