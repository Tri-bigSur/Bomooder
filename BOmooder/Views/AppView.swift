//
//  AppView.swift
//  BOmooder
//
//  Created by warbo on 11/6/25.
//

import SwiftUI

struct AppView: View {
    // MARK: - PROPERTIES
    @State private var currentSong: SongModel?
    @State private var isPlaying: Bool = false
    @State private var expand: Bool = false
    @State private var globalPlayList: [SongModel] = []
    @State private var selectedSongIndex: Int = 0
    
    @StateObject var audioPlayer = AudioPlayer()
    
    func randomSong(){
        let randomIndex = Int.random(in: 0..<songData.count)
        if currentSong == nil {
            self.currentSong = songData[randomIndex]
            isPlaying = true
            globalPlayList = songData
        }
    }
    
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView{
                LibraryView(selectedSong: $currentSong, isPlaying: $isPlaying, playList: $globalPlayList)
                    .tabItem({
                        Image(systemName:"music.note.list")
                        Text("Music Library")
                    })
                ExploringView()
                    .tabItem({
                        Image(systemName:"smallcircle.circle")
                        Text("Explore")
                    })
                BOGraphView()
                    .tabItem({
                        Image(systemName:"chart.line.uptrend.xyaxis.circle")
                        Text("#bograph")
                    })
                MusicRoomView()
                    .tabItem({
                        Image(systemName:"dot.radiowaves.left.and.right")
                        Text("Music Room")
                    })
                ProfileView()
                    .tabItem({
                        Image(systemName: "person.crop.circle")
                        Text("Profile")
                    })
                
            }
            SongPlayingView(currentSong: $currentSong, expand: $expand, isPlaying: $isPlaying,playList: $globalPlayList, index: $selectedSongIndex)
            
            
            
            

            }
            
            
            

        
        .onAppear{
            randomSong()
        }
        

            
                
            
        

        
    }
        
}

#Preview {
    AppView()
    
}
