//
//  FirstViewController.swift
//  SwipeNOOne
//
//  Created by office on 22/05/2019.
//  Copyright © 2019 수리. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
//스와이프
    @IBOutlet var swipE: UISwipeGestureRecognizer!
    @IBAction func swipeM(_ sender: Any) {
        if swipE.direction == .left {
            tabBarController?.selectedIndex = 1
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        swipE.direction = .left
        
        
        
    }


}

