//
//  SecondViewController.swift
//  SwipeNOOne
//
//  Created by office on 22/05/2019.
//  Copyright © 2019 수리. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var swipE: UISwipeGestureRecognizer!
    @IBAction func swipeM(_ sender: Any) {
        if swipE.direction == .right {
            tabBarController?.selectedIndex = 0
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

