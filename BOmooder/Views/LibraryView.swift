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
                                NavigationLink(destination: AlbumDetailView(albumImage: item.albumImage, title: item.albumTitle, selectedAlbum: item.albumTitle)){
                                    TinyAlbumCardView(imageSinger: item.albumImage, songName: item.albumTitle)
                                }
                                .foregroundColor(Color.white)
                                
                                
                                
                                
                                
                                
                                
                                
                            }
                            
                            
                            
                        }
                        Spacer()
                    }
                    .padding(.leading,16)
                    
                }
                
                
                
                
                
            }
                        
                    }//: SCROLLVIEW
                    
                    
                    
                }
                
                
                
                
                
                
                
                
                
                
                
            }
        }//: VSTACK
    


#Preview {
    LibraryView()
}
