//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    var player:AVAudioPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func playSound(input:String) {
        guard let url = Bundle.main.url(forResource: input, withExtension: "wav") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }


    @IBAction func C(_ sender: UIButton) {
        let temp=sender.alpha*0.2
        sender.alpha-=temp
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            sender.alpha+=temp;
        }
        playSound(input: "C")
    }
    

    @IBAction func D(_ sender: UIButton) {
        let temp=sender.alpha*0.2
        sender.alpha-=temp
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            sender.alpha+=temp;
        }
        playSound(input: "D")
    }
    
    @IBAction func E(_ sender: Any) {
       
        playSound(input: "E")
    }
    
    @IBAction func F(_ sender: Any) {
        
        
        playSound(input: "F")
    }
    
    
    @IBAction func G(_ sender: Any) {
       
        playSound(input: "G")
    }
    
    
    @IBAction func A(_ sender: UIButton) {
        playSound(input: "A")
    }
    
    @IBAction func B(_ sender: Any) {
        playSound(input: "B")
    }
}

