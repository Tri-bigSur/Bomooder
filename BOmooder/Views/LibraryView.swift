//
//  LibraryView.swift
//  BOmooder
//
//  Created by warbo on 11/6/25.
//

import SwiftUI

struct LibraryView: View {
    // MARK: - PROPERTIES
//    @State private var isPresented: Bool = false
//    @State private var selectedAlbum: AlbumCardViewModel?
    @State private var selectedTab: LibraryTab = .playList
    

    enum LibraryTab: String, CaseIterable, Identifiable {
        case playList = "PlayList"
        case album = "Album"
        var id: String {self.rawValue}
    }
    
    @Binding var selectedSong: SongModel?
    @Binding var isPlaying: Bool
    @Binding var playList: [SongModel]
    // MARK: - BODY
    var body: some View {
        NavigationView{
            ScrollView(.vertical,showsIndicators: false){
                VStack{
                HeaderView(title: "Library")
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(alignment:.center, spacing:20){
                        CategoryItemView(iconName: "heart", categoryTitle: "Favorite", amount: "2", iconColor: Color.teal)
                        CategoryItemView(iconName: "arrow.down.circle", categoryTitle: "Downloaded", amount: "3", iconColor: Color.purple)
                        CategoryItemView(iconName: "icloud.and.arrow.up", categoryTitle: "Upload", amount: "2", iconColor: Color.yellow)
                        CategoryItemView(iconName: "play.rectangle", categoryTitle: "MV", amount: "4", iconColor: Color.purple)
                        CategoryItemView(iconName: "person.wave.2", categoryTitle: "Artist", amount:"1", iconColor: Color.orange)
                    }
                    
                    
                }//: SCROLLVIEW CATGORY
                
                    HStack {
                        Text("Recently Listen")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                    }
                        
                
                ScrollView(.horizontal,showsIndicators:false){
                    VStack {
                        HStack(spacing:16){
                            ForEach(albumData,id:\.albumTitle){ item in
                                NavigationLink(destination: AlbumDetailView(playList: $playList, selectedSong: $selectedSong,isPlaying: $isPlaying,albumInfo:item)){
                                    TinyAlbumCardView(imageSinger: item.albumImage, songName: item.albumTitle,playList: item.albumSong,selectedSong: $selectedSong)
                                }
                                .foregroundColor(Color.white)
                                
                                
                                
                                
                                
                                
                                
                                
                            }
                            
                            
                            
                        }
                        Spacer()
                    }
                    .padding(.leading,16)
                    
                }
                
                
                
                    
                         
                
            }//: VSTACK
                // CUSTOM TAB VIEW
                HStack{
                    ForEach(LibraryTab.allCases){
                        tap in
                        Button(action:{
                            self.selectedTab = tap
                        }){
                            VStack(){
                                Text(tap.rawValue)
                                    .font(.title2)
                                    .fontWeight(.medium)
                                    .foregroundColor(selectedTab == tap ? .white : .gray)
                                    .padding(.vertical,8)
                                    .padding(.horizontal,15)
                                Capsule()
                                   .fill(Color.purple)
                                   .frame(width:30, height: 5)
                                   .padding(.top, -16)
                                   .opacity(selectedTab == tap ? 1 : 0)
                            }
                             
                        }
                    }
                    Spacer()
                }
                .padding(.top,20)
                
                // CONTENT OF SELECTED TAB
                Group {
                    if selectedTab == .playList {
                        PlayListView(selectedSong: $selectedSong, playList: $playList)
                    }else{
                        AlbumTab()
                    }
                }
                   
                    }//: SCROLLVIEW
                    
            
                    
                    
                }
                
                
                
                
                
                
                
                
                
                
        
            }
        }

struct PlayListView: View {
    
    @Binding var selectedSong: SongModel?
    @Binding var playList: [SongModel]
    var body: some View {
        VStack(alignment: .leading,spacing: 16){
            HStack{
                Rectangle()
                    .fill(Color.gray.opacity(0.2))
                    .frame(width:80,height: 80)
                    .cornerRadius(8)
                    .overlay(Image(systemName: "plus")
                        .foregroundColor(Color.gray.opacity(0.8))
                        .font(.system(size: 30))
                    )
                Text("Create Playlist")
                    .fontWeight(.medium)
                    .font(.system(size: 18))
                Spacer()
            }
            VStack(alignment:.leading){
                Text("Suggested Playlist")
                    .font(.system(size: 20))
                Text("Listened A Lot")
                    .foregroundColor(Color.gray)
            }
            ForEach(playListData,id:\.playListName){
                item in
                
                NavigationLink(destination: PlayListDetailView(selectedSong: $selectedSong, playlist: $playList, playListInfo: item)){
                    PlayListItemView(playListName: item.playListName, artistsName: item.playListSingers, imagePlayList: item.playListImage)
                }
                .foregroundColor(Color.white)
               
            }
            Spacer()
//            PlayListItemView(playListName: "Thà Quên Đi", artistsName: "Phạm Trưởng", imagePlayList: "pham-truong")
//            PlayListItemView(playListName: "DJ Tuổi Gì", artistsName: "Producer Warbo, Producer Warbi", imagePlayList: "DJtuoigi")
        }
        .padding(.leading,8)
    }
}
    
struct AlbumTab: View{
    var body: some View{
        VStack(alignment: .center,spacing: 10){
            Image(systemName: "music.house")
                .font(.system(size: 35))
                .foregroundColor(Color.gray)
            
            Text("You haven't have any album yet")
                .font(.system(size: 18))
                .fontWeight(.medium)
            
            Text("Find your favorite album to add to library")
                .foregroundColor(Color.gray)
        }
    }
}


#Preview {
    LibraryView(selectedSong: .constant(SongModel(songName: "Một Mình Đi Về",artistImage: "huynh-de-lyhai", artist: "Lý Hải", genre: "Trọn Đời Bên Em 7",fileURL: "/Users/warbo/Project/ Warbo's Project/Bomooder/BOmooder/SongFile/Một Mình Đi Về.mp3")), isPlaying: .constant(false), playList: .constant([]))
}
