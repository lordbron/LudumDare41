//
//  GameScene.swift
//  LudumDare41
//
//  Created by Thomas Ortega II on 4/21/18.
//  Copyright © 2018 OO. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var ball : SKSpriteNode?
    private var bottomRightBucket : SKSpriteNode?
    private var bottomMiddleBucket : SKSpriteNode?
    private var bottomLeftBucket : SKSpriteNode?
    private var bottomRightBouncer : SKNode?
    private var bottomMiddleBouncer : SKNode?
    private var bottomLeftBouncer : SKNode?

    override func sceneDidLoad() {

        self.lastUpdateTime = 0
        ball = self.childNode(withName: "ballNode") as? SKSpriteNode
        bottomRightBucket = self.childNode(withName: "bottomRightBucket") as? SKSpriteNode
        bottomMiddleBucket = self.childNode(withName: "bottomMiddleBucket") as? SKSpriteNode
        bottomLeftBucket = self.childNode(withName: "bottomLeftBucket") as? SKSpriteNode
        bottomRightBouncer = self.childNode(withName: "bottomRightBucket") as? SKSpriteNode
        bottomMiddleBouncer = self.childNode(withName: "bottomMiddleBucket") as? SKSpriteNode
        bottomLeftBouncer = self.childNode(withName: "bottomLeftBucket") as? SKSpriteNode
        // Get label node from scene and store it for use later
//        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
//        if let label = self.label {
//            label.alpha = 0.0
//            label.run(SKAction.fadeIn(withDuration: 2.0))
//        }
        
        // Create shape node to use during mouse interaction
//        let w = (self.size.width + self.size.height) * 0.05
//        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
//
//        if let spinnyNode = self.spinnyNode {
//            spinnyNode.lineWidth = 2.5
//
//            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
//            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
//                                              SKAction.fadeOut(withDuration: 0.5),
//                                              SKAction.removeFromParent()]))
//        }
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
    }
    
    func touchMoved(toPoint pos : CGPoint) {
    }
    
    func touchUp(atPoint pos : CGPoint) {
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities {
            entity.update(deltaTime: dt)
        }
        
        self.lastUpdateTime = currentTime
        
        
    }
}
