//
//  SoundManager.swift
//  Match App
//
//  Created by Ryan Lilla on 7/29/19.
//  Copyright © 2019 Ryan Lilla. All rights reserved.
//

import Foundation
import AVFoundation

class SoundManager {
    
    static var audioPlayer: AVAudioPlayer?
    
    enum SoundEffect {
        case flip
        case match
        case nomatch
        case shuffle
    }
    
    static func playSound(_ effect: SoundEffect) {
        var soundFilename = ""
        
        // Determine which sound effect to play
        // and set the appropriate filename
        switch effect {
        case .flip:
            soundFilename = "cardflip"
        case .match:
            soundFilename = "dingcorrect"
        case .nomatch:
            soundFilename = "dingwrong"
        case .shuffle:
            soundFilename = "shuffle"
        }
        
        // Get the path to the sound file inside the bundle
        let bundlePath = Bundle.main.path(forResource: soundFilename, ofType: "wav")
        guard bundlePath != nil else {
            print("Couldn't find sound file \(soundFilename) in the bundle")
            return
        }
        
        // Create a URL object from the string path
        let soundURL = URL(fileURLWithPath: bundlePath!)
        
        do {
            // Create audio player object
            try audioPlayer = AVAudioPlayer(contentsOf: soundURL)
            
            // Play the sound
            audioPlayer?.play()
        } catch {
            // Log the error
            print("Couldn't create the audio player for sound file \(soundFilename)")
        }
    }
}
