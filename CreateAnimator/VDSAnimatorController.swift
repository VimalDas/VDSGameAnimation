//
//  ViewController.swift
//  CreateAnimator
//
//  Created by Srishti MAC on 26/04/17.
//  Copyright © 2017 SRISTI. All rights reserved.
//

import UIKit

class VDSAnimatorController: UIViewController {

    @IBOutlet var gameView: VDSAnimator!{
        didSet{
            gameView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(addDrop(_:))))
            
        }
    }
    func addDrop(_ recognizer:UITapGestureRecognizer){
        if recognizer.state == .ended{
            gameView.addDrop()
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        gameView.animating = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        gameView.animating = false
    }
   
}

