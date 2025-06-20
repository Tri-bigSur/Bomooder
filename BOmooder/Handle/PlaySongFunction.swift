//
//  PlaySongFunction.swift
//  BOmooder
//
//  Created by warbo on 17/6/25.
//
import Foundation
import AVFoundation

class AudioPlayer: ObservableObject{
    @Published var currentTime: TimeInterval = 0
    @Published var duration: TimeInterval = 0
    private var player: AVPlayer?
    @Published var previousTime: TimeInterval = 0
    
    func playSong(at url: URL){
        player = AVPlayer(url: url)
        player?.play()
        
    // Update currentTime
        let interval = CMTime(seconds: 1, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
        player?.addPeriodicTimeObserver(forInterval: interval, queue: .none){ [weak self] time in
            self?.currentTime = time.seconds
            
        }
    // Get duration
        if let duration = player?.currentItem?.asset.duration{
            self.duration = duration.seconds
        }
        
    }
    
    
    func pause(){
        player?.pause()
    }
    func stop(){
        player?.pause()
        player?.seek(to: .zero)
    }
    
    func formatDuration(_ duration: TimeInterval) -> String{
        let minutes = Int(duration / 60)
        let seconds = Int(duration.truncatingRemainder(dividingBy: 60))
        return String(format:"%d:%02d",minutes,seconds)
    }
    
    func seek(to time: TimeInterval){
        player?.seek(to: CMTime(seconds: time, preferredTimescale: CMTimeScale(NSEC_PER_SEC)))
    }
    
    
}
        
    

