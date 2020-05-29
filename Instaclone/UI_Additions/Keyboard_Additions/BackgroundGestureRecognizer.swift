//
//  BackgroundGestureRecognizer.swift
//  Instaclone
//
//  Created by Karsten Krause on 29.05.20.
//  Copyright © 2020 Karsten Krause. All rights reserved.
//

import Foundation
import UIKit


// Klasse, welche jeden Tap-Typ aufnehmen kann, damit ein Tap auf einen Background erkannt wird.
// Wird in der SceneDelegate verwendet, um die Tastertur bei einem Tap auf den Hintergrund verschwinden lässt.
class BackGroundGestureRecognizer: UIGestureRecognizer {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        // Verhindert, dass die Tastertur verschwindet, wenn zwischen Textfeldern gesprungen wird
        if
            let textField = touches.first?.view,
            textField is UITextField || textField is UITextView
        {
            state = .cancelled
        } else {
            state = .began
        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
       state = .ended
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent) {
        state = .cancelled
    }
}
