//
//  ViewController.swift
//  shakeToSound
//
//  Created by Kaylan Smith on 7/17/16.
//  Copyright © 2016 Kaylan Smith. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()
    
    // create array for different sounds to select randomly

    var sounds = ["got", "serve", "hodor", "winter-is-coming", "shame"]

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    // for shakes
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
        
        if event?.subtype == UIEventSubtype.MotionShake {
            
            var randomNumber = Int(arc4random_uniform(UInt32(sounds.count)))
            
            
            var fileLocation = NSBundle.mainBundle().pathForResource(sounds[randomNumber], ofType: "mp3")
            
            do { try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: fileLocation!))
                
                player.play()
                
            } catch {}
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

