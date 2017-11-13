//
//  FallingObjectBehaviour.swift
//  CreateAnimator
//
//  Created by Srishti MAC on 26/04/17.
//  Copyright © 2017 SRISTI. All rights reserved.
//

import UIKit

class VDSFallingObjectBehaviour: UIDynamicBehavior {
    
    fileprivate let gravity = UIGravityBehavior()
    fileprivate let itemBehavior: UIDynamicItemBehavior={
        let dib = UIDynamicItemBehavior()
        dib.allowsRotation = false
        dib.elasticity = 0.75
        return dib
    }()
    fileprivate let collider:UICollisionBehavior = {
        let collider = UICollisionBehavior()
        collider.translatesReferenceBoundsIntoBoundary = true
        return collider
    }()
    
    override init() {
        super.init()
        addChildBehavior(gravity)
        addChildBehavior(collider)
        addChildBehavior(itemBehavior)

    }
    func addItem(_ item:UIDynamicItem){
        gravity.addItem(item)
        collider.addItem(item)
        itemBehavior.addItem(item)

    }
    func removeItem(_ item:UIDynamicItem){
        gravity.removeItem(item)
        collider.removeItem(item)
        itemBehavior.removeItem(item)

    }
}
