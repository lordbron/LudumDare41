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
    private var scoreLabel : SKLabelNode?
    private var ball : SKSpriteNode?
    private var bottomRightBucket : Bucket?
    private var bottomMiddleBucket : Bucket?
    private var bottomLeftBucket : Bucket?
    private var topRightBucket : Bucket?
    private var topMiddleBucket : Bucket?
    private var topLeftBucket : Bucket?
    private var score = 0
    private var lastBucket:Bucket?

    override func sceneDidLoad() {

        self.lastUpdateTime = 0
        ball = self.childNode(withName: "ballNode") as? SKSpriteNode
        bottomRightBucket = self.childNode(withName: "bottomRightBucket") as? Bucket
        bottomMiddleBucket = self.childNode(withName: "bottomMiddleBucket") as? Bucket
        bottomLeftBucket = self.childNode(withName: "bottomLeftBucket") as? Bucket
        topRightBucket = self.childNode(withName: "topRightBucket") as? Bucket
        topMiddleBucket = self.childNode(withName: "topMiddleBucket") as? Bucket
        topLeftBucket = self.childNode(withName: "topLeftBucket") as? Bucket
        scoreLabel = self.childNode(withName: "scoreLabel") as? SKLabelNode
        scoreLabel?.text = "Score: \(score)"
        configureStartingLevel()
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
    
    func configureStartingLevel() {
        topMiddleBucket?.bucketType = .simpleNegative
        bottomMiddleBucket?.bucketType = .simplePositive
        bottomLeftBucket?.bucketType = .simpleNegative
        topLeftBucket?.bucketType = .simplePositive
        bottomRightBucket?.bucketType = .simpleNegative
        topRightBucket?.bucketType = .simplePositive
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
        guard let count = ball?.physicsBody?.allContactedBodies().count else {
            lastBucket = nil
            return
        }
        if count > 0 {
            if let ballBody = ball?.physicsBody, let bottomMidBucketBody = bottomMiddleBucket?.physicsBody, let topMidBucketBody = topMiddleBucket?.physicsBody, let topRightBucketBody = topRightBucket?.physicsBody, let topLeftBucketBody = topLeftBucket?.physicsBody, let bottomLefttBucketBody = bottomLeftBucket?.physicsBody, let bottomRightBucketBody = bottomRightBucket?.physicsBody {
                var collidedBucketNode:Bucket?
                switch true {
                case ballBody.allContactedBodies().contains(topLeftBucketBody):
                    collidedBucketNode = topLeftBucketBody.node as? Bucket
                    break
                case ballBody.allContactedBodies().contains(topMidBucketBody):
                    collidedBucketNode = topMidBucketBody.node as? Bucket
                    break
                case ballBody.allContactedBodies().contains(topRightBucketBody):
                    collidedBucketNode = topRightBucketBody.node as? Bucket
                    break
                case ballBody.allContactedBodies().contains(bottomLefttBucketBody):
                    collidedBucketNode = bottomLefttBucketBody.node as? Bucket
                    break
                case ballBody.allContactedBodies().contains(bottomMidBucketBody):
                    collidedBucketNode = bottomMidBucketBody.node as? Bucket
                    break
                case ballBody.allContactedBodies().contains(bottomRightBucketBody):
                    collidedBucketNode = bottomRightBucketBody.node as? Bucket
                    break
                default:
                    break
                }
                if let foundNode = collidedBucketNode {
                    if foundNode != lastBucket {
                        lastBucket = foundNode
                        score = score + foundNode.scoreValue
                        scoreLabel?.text = "Score: \(score)"
                    }
                }
                let world = self.physicsWorld
                if world.gravity.dy < CGFloat(0.0) {
                    world.gravity = CGVector.init(dx: 0.0, dy: 25) // CGVectorMake(0.0, 9.8)
                } else {
                    world.gravity = CGVector.init(dx: 0.0, dy: -25) // CGVectorMake(0.0, -9.8)
                }
            }
        }
    }
}

