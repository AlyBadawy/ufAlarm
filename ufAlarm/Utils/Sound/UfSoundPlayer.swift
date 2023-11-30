//
//  UfSoundPlayer.swift
//  ufAlarm
//
//  Created by Aly Badawy on 11/29/23.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?


// Play sound with a default value set to 1.0
func playSound(sound: String, type: String = "", volume: Float = 1.0) {
  if let path = Bundle
    .main
    .path(forResource: sound, ofType: type) {
    
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
      
      // set the volume
      audioPlayer?.setVolume(volume, fadeDuration: 0.1)
      
      // play the sound
      audioPlayer?.play()
    } catch {
      print("Audio player error")
    }
  }
}

func stopSound() {
  audioPlayer?.stop()
}
