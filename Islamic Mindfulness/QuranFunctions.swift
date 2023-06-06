import SwiftUI
import AVKit
import Foundation
import AVFoundation

class QuranPlayer {
    static var player: AVPlayer?
    static var lastPlayedTime: CMTime?
    static var currentReciter: Reciter? // Add the currentReciter property
}


// QuranFunctions.swift

func playRecitation(reciter: Reciter) {
    guard let audioURL = reciter.audioURL else {
        return
    }

    do {
        try AVAudioSession.sharedInstance().setCategory(.playback)
        try AVAudioSession.sharedInstance().setActive(true)
        let playerItem = AVPlayerItem(url: audioURL)

        QuranPlayer.lastPlayedTime = nil // Reset the lastPlayedTime
        QuranPlayer.currentReciter = reciter // Set the currentReciter

        QuranPlayer.player = AVPlayer(playerItem: playerItem)
        QuranPlayer.player?.play()

        UIApplication.shared.beginBackgroundTask(withName: "QuranPlayback") {
            // This block will be called when the background task expires
            // You can perform any necessary cleanup here
            pauseRecitation()
        }
    } catch {
        print("Failed to set audio session category: \(error)")
    }
}

func pauseRecitation() {
    QuranPlayer.player?.pause()
    QuranPlayer.lastPlayedTime = QuranPlayer.player?.currentTime()
}

func resumeRecitation(from time: CMTime) {
    guard let player = QuranPlayer.player else {
        return
    }

    player.seek(to: time) { _ in
        player.play()
    }
}
