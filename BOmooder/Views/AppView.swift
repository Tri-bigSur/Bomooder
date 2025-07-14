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
    @State private var globalPlayList: [SongModel]?
    
    
    @StateObject var audioPlayer = AudioPlayer()
    
    func randomSong(){
        let randomIndex = Int.random(in: 0..<songData.count)
        if currentSong == nil{
            self.currentSong = songData[randomIndex]
        }
    }
    
    
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            TabView{
                LibraryView(selectedSong: $currentSong, isPlaying: $isPlaying)
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
            SongPlayingView(currentSong: $currentSong, expand: $expand, isPlaying: $isPlaying)
            
            
            
            
//            .padding(.leading,10)
//            .background(GeometryReader{
//                geometry in
//                Color.red.onAppear {
//                    bottomSafeAreaHeight = geometry.safeAreaInsets.bottom
//                    print("Bottom safe area\(bottomSafeAreaHeight)")
//                }
//            })
//            .safeAreaInset(edge: .bottom){
//                if currentSong != nil && showFullPlayerSheet && sheetDetent == .height(65 + bottomSafeAreaHeight){
//                    Color.blue.frame(height: 65)
//                        .background(Color.green.opacity(0.5))
//                }
//            }
      
            
//            .sheet(isPresented: $showFullPlayerSheet){
//                SongPlayingView(currentSong: $currentSong, currentSheetDetent: $sheetDetent, isPlaying: $isPlaying, bottomSafeAreaHeight: bottomSafeAreaHeight)
//                    .presentationBackgroundInteraction(.enabled)
                    
//
            }
            
            
            
//        }
        
        .onAppear{
            randomSong()
        }
        
//        .onDisappear{
//            sheetDetent = .large
//            
//        }
            
                
            
        
//        .sheet(isPresented: $showFullPlayerSheet){
//            LibraryView(showFullPlayerSheet: <#T##Binding<Bool>#>, selectedSong: <#T##Binding<SongModel?>#>, isPlaying: <#T##Binding<Bool>#>)
//        }
        
    }
        
}

#Preview {
    AppView()
    
}
