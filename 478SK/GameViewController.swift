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

class MFMessageComposeViewController : UINavigationController {
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
    }
    
    func displayMessageInterface() {
        let composeVC = MFMessageComposeViewController()
        composeVC.messageComposeDelegate = self
        
        // Configure the fields of the interface.
        composeVC.recipients = ["471471"]
        composeVC.body = "HOME"
        
        // Present the view controller modally.
        if MFMessageComposeViewController.canSendText() {
            self.present(composeVC, animated: true, completion: nil)
        } else {
            print("Can't send messages.")
        }
    }
}

class GameViewController: UIViewController {
    override open var shouldAutorotate: Bool {
        return false
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override func viewDidLoad() {
        let scene = GameScene(size: view.frame.size)
        let skView = view as! SKView
        skView.isMultipleTouchEnabled = true
        skView.presentScene(scene)
    }
}
