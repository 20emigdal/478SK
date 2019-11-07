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
var textline = SKLabelNode(text: "Crisis Text Line:")
var textline2 = SKLabelNode(text: "text HOME to 471471")
var hotline = SKLabelNode(text: "Suicide Prevention Hotline:")
var hotline2 = SKLabelNode(text: "1-800-273-8255")

class GameScene: SKScene {
    
    let blue = UIColor(red: 0, green: 165/255, blue: 200/255, alpha: 1)
    var alreadyRan = false
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        let topWidth = view!.frame.width*7/8
        let topHeight = view!.frame.height*1/8
        let touch: UITouch = touches.first!
        let place: CGPoint = touch.location(in: view)
        let newSpot: CGPoint = CGPoint(x: view!.frame.width*7/8, y: view!.frame.height*7/8)

        if going.position.x - 30 < place.x && place.x < going.position.x + 30  {
            if going.position.y - 30 < place.y && place.y < going.position.y + 30 {
                let begun = SKAction.move(to: newSpot, duration: 1)
                going.text = "stop"
                going.run(begun)
                meditate()
            }
        }
        
        if topWidth - 30 < place.x && place.x < topWidth + 30 {
            if topHeight - 30 < place.y && place.y < topHeight + 30 {
                alreadyRan = !alreadyRan
            }
        }
        
        if hotline2.position.x - 30 < place.x && place.x < hotline.position.x + 30 {
            if hotline2.position.y - 30 < place.y && place.y < hotline.position.y + 30 {
                print("call")
            }
        }
        
        if textline2.position.x - 30 < place.x && place.x < textline2.position.x + 30 {
            if textline2.position.y - 30 < place.y && place.y < textline2.position.y + 30 {
                print("text")
            }
        }
        
        if alreadyRan == false {
            label.isHidden = false
            thanks.isHidden = true
            hotline.isHidden = true
            textline.isHidden = true
            hotline2.isHidden = true
            textline2.isHidden = true
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
        
        hotline.position = CGPoint(x: view.frame.width / 2, y: view.frame.height * 1/3)
        hotline.isHidden = true
        addChild(hotline)
        
        hotline2.position = CGPoint(x: view.frame.width / 2, y: view.frame.height * 1/3 - 30)
        hotline2.isHidden = true
        addChild(hotline2)
        
        textline.position = CGPoint(x: view.frame.width / 2, y: view.frame.height * 1/4)
        textline.isHidden = true
        addChild(textline)
        
        textline2.position = CGPoint(x: view.frame.width / 2, y: view.frame.height * 1/4 - 30)
        textline2.isHidden = true
        addChild(textline2)
    }
    
    func meditate() {
        going.text = "stop"
        label.text = "inhale"
        let scale = SKAction.scale(by: 4, duration: 1.75)
        label.run(scale)
            
        DispatchQueue.main.asyncAfter(deadline : .now() + 2) {
            label.text = "hold"
            going.text = "stop"
            let color = SKAction.colorize(with: self.blue, colorBlendFactor: 1.0, duration: 3.4)
            label.run(color)
        }
            
        DispatchQueue.main.asyncAfter(deadline : .now() + 5.5) {
            label.color = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
            label.text = "exhale"
            going.text = "stop"
            let scale2 = SKAction.scale(by: 0.25, duration: 3.75)
            label.run(scale2)
        }
        
        DispatchQueue.main.asyncAfter(deadline : .now() + 9.5) {
            going.text = "stop"
            if self.alreadyRan == false {
                self.meditate()
            }
        }
    }
    
    func endMeditation() {
        label.isHidden = true
        going.text = "go"
        thanks.isHidden = false
        hotline.isHidden = false
        hotline2.isHidden = false
        textline2.isHidden = false
        textline.isHidden = false
    }
}
