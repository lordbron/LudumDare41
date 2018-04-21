//
//  Bucket.swift
//  LudumDare41
//
//  Created by Thomas Ortega II on 4/21/18.
//  Copyright © 2018 OO. All rights reserved.
//

import UIKit
import SpriteKit

enum BucketType {
    case simplePositive
    case simpleNegative
}

class Bucket:SKSpriteNode {
    private var _bucketType = BucketType.simplePositive
    private var _scoreValue = 0
    var bucketType:BucketType {
        set {
            _bucketType = newValue
            updateBucketParams()
        }
        get {
            return _bucketType
        }
    }
    
    var scoreValue:Int {
        get {
            return _scoreValue
        }
    }
    
    func updateBucketParams() {
        switch _bucketType {
        case .simplePositive:
            color = UIColor.green
            _scoreValue = 10
        case .simpleNegative:
            color = UIColor.red
            _scoreValue = -10
        }
    }
}
