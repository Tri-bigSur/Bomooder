//
//  MiniPlayerView.swift
//  BOmooder
//
//  Created by warbo on 2/7/25.
//

import SwiftUI

struct MiniPlayerView: View {
    // MARK: - PROPERTIES
    @Binding var currentSong: SongModel?
    @Binding var isPlaying: Bool
    @Binding var showFullPlayerSheet: Bool
    @Binding var currentSheetDetent: PresentationDetent
    @StateObject var audioPlayer = AudioPlayer()
    var body: some View {
        HStack(alignment: .center,spacing: 18){
            if let song = currentSong{
                Image(song.artistImage)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .mask(Circle())
                    .padding(.leading,5)
                VStack(alignment:.leading){
                    Text(song.songName)
                        .font(.system(size: 18))
                        .lineLimit(1)
                        .fontWeight(.semibold)
                    //                        .frame(width: 16)
                    Text(song.artist)
                       
                }
                Image(systemName: "heart")
                    .font(.system(size: 25))
                Button(action:{
                    isPlaying.toggle()
                    if isPlaying {
                        audioPlayer.pause()
                    }
                }){
                    Image(systemName: isPlaying ? "pause.circle" : "arrowtriangle.forward.circle")
                        .font(.system(size: 25))
                }
                
                Image(systemName: "play.fill")
                    .font(.system(size: 25))
                    .padding(.trailing,5)
            }
                
        }//: HSTACK
        .frame(maxWidth: .infinity,maxHeight: 65)
    
        .background(Color.gray.opacity(0.1))
        .onTapGesture {
            
            currentSheetDetent = .large
        }
        }
        
    
    
}

#Preview {
    MiniPlayerView(currentSong: .constant( SongModel(songName: "Một Mình Đi Về",artistImage: "huynh-de-lyhai", artist: "Lý Hải", genre: "Trọn Đời Bên Em 7",fileURL: "/Users/warbo/Project/ Warbo's Project/Bomooder/BOmooder/SongFile/Một Mình Đi Về.mp3")), isPlaying: .constant(false), showFullPlayerSheet: .constant(false), currentSheetDetent: .constant(.height(65)))
}
