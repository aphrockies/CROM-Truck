//
//  GameViewController.swift
//  CROM Truck
//
//  Created by Allan Hull on 10/12/17.
//  Copyright © 2017 Allan Hull. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    // SceneKit values
    var scnView: SCNView!
    var scnScene: SCNScene!
    
    // Node values
    var truckNode: SCNNode!
    
    // Truck Unit
    var trucks: [SCNNode] = []
    var numberOfTrucks = 1
    
    // Camera values
    var horizontalCameraNode: SCNNode!
    var verticalCameraNode: SCNNode!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // load setup methods
        setupScene()
        setupNodes()
        setupGestures()
 
    }
    
    func setupScene() {
        
        scnView = self.view as! SCNView
        scnView.delegate = self as? SCNSceneRendererDelegate
        
 //       scnScene = SCNScene(named: "art.scnassets/ship.scn")
        scnScene = SCNScene(named: "art.scnassets/main.scn")
        scnView.scene = scnScene
        
    }
    
    func setupNodes() {
        
        truckNode = scnScene.rootNode.childNode(withName: "Truck", recursively: true)
        
        // move Truck node
        let moveRight = SCNAction.moveBy(x: 1.0, y: 0.0, z: 0.0, duration: 1.0)
        let moveLeft = SCNAction.moveBy(x: -1.0, y: 0.0, z: 0.0, duration: 1.0)
        let moveSequence = SCNAction.sequence([moveRight,moveLeft])
        let repeatSequence = SCNAction.repeatForever(moveSequence)
        truckNode.runAction(repeatSequence)
        
        
    }
    
    func setupGestures() {
        
        print("setupGestures")
        
        let swipeRight:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector(GameViewController.handleGesture(sender:)))
        swipeRight.direction = .right
        scnView.addGestureRecognizer(swipeRight)
        
        let swipeLeft:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector (GameViewController.handleGesture(sender:)))
        swipeLeft.direction = .left
        scnView.addGestureRecognizer(swipeLeft)
        
        let swipeForward:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector (GameViewController.handleGesture(sender:)))
        swipeForward.direction = .up
        scnView.addGestureRecognizer(swipeForward)
        
        let swipeBackward:UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action:#selector (GameViewController.handleGesture(sender:)))
        swipeBackward.direction = .down
        scnView.addGestureRecognizer(swipeBackward)
        
        
    }
    
    @objc func handleGesture(sender:UISwipeGestureRecognizer) {
        
        print("handleGesture")
        
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.up:
            print("UP")
        case UISwipeGestureRecognizerDirection.down:
            print("DOWN")
        case UISwipeGestureRecognizerDirection.left:
            print("LEFT")
//            plateNode.geometry?.firstMaterial?.diffuse.contents = UIImage(named: "Plates.scnassets/States/balldimpled.png")
//            plateNode.geometry?.firstMaterial?.locksAmbientWithDiffuse = true
//            plateNode.geometry?.firstMaterial?.diffuse.wrapS = SCNWrapMode.repeat
        case UISwipeGestureRecognizerDirection.right:
            print("RIGHT")
        default:
            break
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        print("touchesBegan")
    }
    
    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
