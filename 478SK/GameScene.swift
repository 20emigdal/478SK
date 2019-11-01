//
//  GameScene.swift
//  478SK
//
//  Created by Eliza Migdal on 10/4/19.
//  Copyright © 2019 emigdal. All rights reserved.
//

import SpriteKit
import GameplayKit

var label = SKLabelNode(text: "_____")
var going = SKLabelNode(text: "begin")
var thanks = SKLabelNode(text: "thank you for meditating!")
var textline = SKLabelNode(text: "Crisis Text Line: text HOME to 471471")
var hotline = SKLabelNode(text: "National Suicide Prevention Hotline: 1-800-273-8255")

class GameScene: SKScene {
    
    let blue = UIColor(red: 0, green: 165/255, blue: 200/255, alpha: 1)
    var alreadyRan = false
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch: UITouch = touches.first!
        let place: CGPoint = touch.location(in: view)
        let newSpot: CGPoint = CGPoint(x: view!.frame.width*7/8, y: view!.frame.height*7/8)
        print("x:")
        print(place.x)
        print("y:")
        print(place.y)
        if going.position.x - 20 < place.x && place.x < going.position.x + 20  {
            if going.position.y - 20 < place.y && place.y < going.position.y + 20 {
                let begun = SKAction.move(to: newSpot, duration: 1)
                going.text = "stop"
                going.run(begun)
                meditate()
            }
        }
        if 330.0 < place.x && place.x < 400 {
            if 85.0 < place.y && place.y < 120.0 {
                alreadyRan = !alreadyRan
            }
        }
        if alreadyRan == false {
            label.isHidden = false
            thanks.isHidden = true
        } else {
            endMeditation()
        }
    }
    
    override func didMove(to view: SKView) {
        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        addChild(label)
        
        going.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        addChild(going)
            
        thanks.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        thanks.isHidden = true
        addChild(thanks)
    }
    
    func meditate() {
        going.text = "stop"
        label.text = "inhale"
        let scale = SKAction.scale(by: 4, duration: 1.75)
        label.run(scale)
            
        DispatchQueue.main.asyncAfter(deadline : .now() + 2) {
            label.text = "hold"
            let color = SKAction.colorize(with: self.blue, colorBlendFactor: 1.0, duration: 3.4)
            label.run(color)
        }
            
        DispatchQueue.main.asyncAfter(deadline : .now() + 5.5) {
            label.color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            label.text = "exhale"
            let scale2 = SKAction.scale(by: 0.25, duration: 3.75)
            label.run(scale2)
        }
        
        DispatchQueue.main.asyncAfter(deadline : .now() + 9.5) {
            if self.alreadyRan == false {
                self.meditate()
            }
        }
    }
    
    func endMeditation() {
        label.isHidden = true
        going.text = "go"
        thanks.isHidden = false
    }
}
