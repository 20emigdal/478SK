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
var label2 = SKLabelNode(text: "begin")
var label3 = SKLabelNode(text: "thank you for meditating!")

class GameScene: SKScene {
    
    let blue = UIColor(red: 0, green: 165/255, blue: 200/255, alpha: 1)
    var go = 0
    var alreadyRan = false
    
    @objc func tap(recognizer: UIGestureRecognizer) {
        let location = recognizer.location(in: view)
        let newSpot = CGPoint(x: view!.frame.width*7/8, y: view!.frame.height*7/8)
        if label2.position.x - 20 < location.x && location.x < label2.position.x + 20  {
            if label2.position.y - 20 < location.y && location.y < label2.position.y + 20 {
                let begun = SKAction.move(to: newSpot, duration: 1)
                label2.text = "end"
                label2.run(begun)
                    go += 1
            }
        }
        if newSpot.x - 20 < location.x && location.x < newSpot.x + 20 {
            if newSpot.y - 20 < location.y && location.y < newSpot.y + 20 {
                print("you got it")
                alreadyRan = true
                endMeditation()
            }
        }
        
        if go == 1 {
            meditate()
            go += 1
        }
    }
    
    override func didMove(to view: SKView) {
        label.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        addChild(label)
            
        label2.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        addChild(label2)
        
        label3.position = CGPoint(x: view.frame.width / 2, y: view.frame.height / 2)
        label3.isHidden = true
        addChild(label3)
            
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(tap))
        view.addGestureRecognizer(recognizer)
    }
    
    func meditate() {
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
        
        print(alreadyRan)
    }
    
    func endMeditation() {
        print("wut")
        label.isHidden = true
        label2.isHidden = true
        label3.isHidden = false
    }
}
