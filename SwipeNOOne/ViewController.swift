//
//  ViewController.swift
//  SwipeNOOne
//
//  Created by office on 22/05/2019.
//  Copyright © 2019 수리. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imagee: UIImageView!
    var images = ["ggg1.jpg","ggg2.jpg","ggg3.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    var currentImage = 0
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.left:
                if currentImage == images.count - 1 {
                    currentImage = 0
                } else {
                    currentImage += 1
                }
//                imagee.image = UIImage(named: images[currentImage])
                UIView.transition(with: self.imagee,
                                  duration:0.5,
                                  options: .transitionFlipFromRight,
                                  animations: { self.imagee.image = UIImage(named: self.images[self.currentImage]) },
                                  completion: nil)
                break
            case UISwipeGestureRecognizer.Direction.right:
                if currentImage == 0 {
                    currentImage = images.count - 1
                } else {
                    currentImage -= 1
                }
//                imagee.image = UIImage(named: images[currentImage])
                UIView.transition(with: self.imagee,
                                  duration:0.5,
                                  options: .transitionCrossDissolve,
                                  animations: { self.imagee.image = UIImage(named: self.images[self.currentImage]) },
                                  completion: nil)
                break
            default:
                break
            }
            
        }
    }
}
