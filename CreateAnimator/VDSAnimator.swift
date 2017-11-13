//
//  Animator.swift
//  CreateAnimator
//
//  Created by Srishti MAC on 26/04/17.
//  Copyright © 2017 SRISTI. All rights reserved.
//

import UIKit

class VDSAnimator: UIView {
    fileprivate let dropsPerRow = 10
    fileprivate let dropBehaviour = VDSFallingObjectBehaviour()
    fileprivate var dropSize : CGSize{
        let size = bounds.size.width/CGFloat(dropsPerRow)
        return CGSize(width: size, height: size)
    }
    
    fileprivate lazy var animator:UIDynamicAnimator = UIDynamicAnimator(referenceView: self)
    
    var animating:Bool = false{
        didSet{
            if animating{
                animator.addBehavior(dropBehaviour)
                animator.addBehavior(dropBehaviour)
            }else{
                animator.removeBehavior(dropBehaviour)
                animator.removeBehavior(dropBehaviour)
            }
        }
    }
    func addDrop(){
        var frame = CGRect(origin: CGPoint.zero, size: dropSize)
        frame.origin.x = CGFloat(arc4random() % UInt32(max(dropsPerRow, dropsPerRow)))*dropSize.width
        let drop = UIView(frame: frame)
        drop.backgroundColor = UIColor.random
        addSubview(drop)
        dropBehaviour.addItem(drop)
        dropBehaviour.addItem(drop)
    }
    
}
extension UIColor{
    class var random:UIColor{
        switch arc4random()%5{
        case 0: return UIColor.red
        case 1: return UIColor.green
        case 2: return UIColor.blue
        case 3: return UIColor.cyan
        case 4: return UIColor.yellow
        case 5: return UIColor.orange
        default : return black
        }
    }
}
