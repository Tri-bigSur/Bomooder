//
//  SongModel.swift
//  BOmooder
//
//  Created by warbo on 13/6/25.
//

import Foundation

struct SongModel: Identifiable {
    var id = UUID()
    var songName: String
    var artistImage: String
    var artist: String
    var genre: String
    var fileURL: String
}
