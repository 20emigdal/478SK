//
//  GameViewController.swift
//  478SK
//
//  Created by Eliza Migdal on 10/4/19.
//  Copyright © 2019 emigdal. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    
    override open var shouldAutorotate: Bool {
        return false
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = true
        skView.presentScene(scene)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("gone")
        let skView = view as! SKView
        skView.isPaused = true
    }
}
