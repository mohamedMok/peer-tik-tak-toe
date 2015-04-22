//
//  MorpionImageView.swift
//  Morpion
//
//  Created by Mohamed Mokhtari on 27/11/2014.
//  Copyright (c) 2014 Mohamed Mokhtari. All rights reserved.
//

import UIKit

class MorpionImageView: UIImageView {
    
    var player: String?
    var activated: Bool! = false
    
    
    func setPlayer(_player: String){
        self.player = _player
        if activated == false{
            if _player == "x"{
                self.image = UIImage(named: "x")
            }else{
                self.image = UIImage(named: "o")
            }
            activated = true
        }
    }
    
    

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
