//
//  AppView.swift
//  BOmooder
//
//  Created by warbo on 11/6/25.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        TabView{
            LibraryView()
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
        .padding(.leading,10)
        
    }
}

#Preview {
    AppView()
}
