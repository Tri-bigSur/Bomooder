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
    @Binding var currentSong: SongModel?
    @Binding var expand: Bool
    @Binding  var isPlaying: Bool
    
    var safeArea = UIApplication.shared.windows.first?.safeAreaInsets
//    let playList: [SongModel]
    let rotationSpeedDegreesPerSecond: Double = 36.0
//    @Binding var index: Int
    
    @StateObject var audioPlayer = AudioPlayer()
    @State private var sliderValue: Double = 0
    @State private var isDragging = false
    
    @State private var currentTime: TimeInterval = 0
    @State private var rotationAngle: Double = 0
    @State private var timer: Timer?
    
//    func previousSong(){
//        if index > 0 {
//            index -= 1
//            isPlaying = true
//            audioPlayer.playSong(at: URL(fileURLWithPath:  playList[index].fileURL))
//        }else{
//            index = 0
//        }
//    }
//    func nextSong(){
//        if index + 1 < playList.count  {
//            index += 1
//            isPlaying = true
//            audioPlayer.playSong(at: URL(fileURLWithPath: playList[index].fileURL))
//            print("index: \(index)")
//        }else{
//            index = 0
//            audioPlayer.playSong(at: URL(fileURLWithPath: playList[index].fileURL))
//        }
//    }
    // Start Rotation
    private func startRotation(){
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){ _ in
            withAnimation(.linear(duration: 0.1)){
                rotationAngle += 0.36
            }
            
        }
       
        
    }
    // Stop Rotation
    private func stopRotation(){
        timer?.invalidate()
        timer = nil
    }
    // MARK: - BODY
    var body: some View {
        Group {
            if expand{
                if let song = currentSong{
                    VStack {
                        
                        HStack(alignment:.center){
                            Button(action:{
                                withAnimation{
                                   expand = false
                                }
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
                        .padding(.top, expand ? safeArea?.top : 0)
                        
                        Image(song.artistImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200,height: 200)
                            .rotationEffect(.degrees(rotationAngle))
                            .mask(Circle())
                            .padding(.top,20)
                            .onChange(of: isPlaying){ newIsPlaying in
                                if newIsPlaying{
                                    startRotation()
                                }else{
                                    stopRotation()
                                }
                                
                            }
                        VStack {
                            HStack(spacing:16){
                                Image(systemName: "arrowshape.turn.up.right")
                                    .font(.system(size: 25))
                                    .foregroundColor(Color.gray)
                                Spacer()
                                VStack {
                                    Text(song.songName)
                                        .font(.system(size: 25))
                                        .lineLimit(1)
                                        .fontWeight(.semibold)
                                    Text(song.artist)
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
                                    //                            previousSong()
                                }) {
                                    Image(systemName: "arrowtriangle.backward")
                                        .font(.system(size: 24))
                                }
                                Button(action:{
                                    // Play song
                                    isPlaying.toggle()
                                    if isPlaying {
                                        audioPlayer.playSong(at: URL(fileURLWithPath: song.fileURL))
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
                                    //                            nextSong()
                                    
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
                    
                    .onAppear{
                        //            isPlaying = true
                        //            audioPlayer.playSong(at: URL(fileURLWithPath: playList[index].fileURL))
                    }
                    .padding(.horizontal,10)
                }else{
                    ContentUnavailableView("No Song Selected", systemImage: "music.note")
                        .foregroundColor(Color.white)
                        .frame(height: 80)
                        
                }
            }else{
                // MARK: - Minimized Player View (Clear Background)
                HStack(alignment:.center,spacing: 16){
                    
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
                                    
                                    
//                                                        .frame(width: 16)
                                Text(song.artist)
                                    
                            }
//                            .frame(width: 150)
                            
                            Spacer(minLength: 0)
                            
                            Image(systemName: "heart")
                                .font(.system(size: 25))
                            Button(action:{
                                isPlaying.toggle()
                                if isPlaying {
                                    audioPlayer.playSong(at: URL(fileURLWithPath: song.fileURL))
                                    audioPlayer.seek(to: currentTime)
                                    startRotation()
                                }else{
                                    currentTime = audioPlayer.currentTime
                                    audioPlayer.pause()
                                    stopRotation()
                                }
                            }){
                                Image(systemName: isPlaying ? "pause.circle" : "arrowtriangle.forward.circle")
                                    .font(.system(size: 25))
                            }
                            
                            Image(systemName: "play.fill")
                                .font(.system(size: 25))
                                .padding(.trailing,5)
                        }

                }//: Minimized Player
                .accentColor(.primary)
                .padding(.horizontal,8)
                .frame(height: 65)
                .cornerRadius(16)
                
//                .contentShape(Rectangle())
                
            }
            
        }//: GROUP
        
        // MARK: - Sheet Presentation
//        .presentationDetents([.large,.height(65 + bottomSafeAreaHeight)], selection: $currentSheetDetent)
//        .presentationDragIndicator(.hidden)
//        .presentationBackground(.thinMaterial)
//        .interactiveDismissDisabled(currentSheetDetent == .height(65))
////        .ignoresSafeArea()
        .background(BlurView())
        .ignoresSafeArea()
        .offset(y: expand ? 0 : -45)
        .frame(maxHeight: expand ? .infinity : 65)
        .onTapGesture {
            expand.toggle()
        }
        .onChange(of: currentSong){ newValue in
            if let newSong = newValue {
                isPlaying = true
                audioPlayer.playSong(at: URL(fileURLWithPath: newSong.fileURL))
                
            }
            
        }
        
    
    }
        
       
}

#Preview {
    SongPlayingView(currentSong: .constant(SongModel(songName: "Xin Một Lần Đau", artistImage: "SongImage", artist: "Lý Hải", genre: "Trọn Đời Bên Em 6", fileURL: "/Users/warbo/Project/ Warbo's Project/BOmooder/BOmooder/BOmooder/SongFile/Xin Một Lần Đau.mp3")), expand: .constant(true), isPlaying: .constant(false))
        
}
