//
//  ViewController.swift
//  SwipeNOOne
//
//  Created by office on 22/05/2019.
//  Copyright © 2019 수리. All rights reserved.
//
//  1. 스토리보드에 이미지뷰를 배치
//  2. 이미지뷰를 변수로 연결
//  3. 이미지뷰에 넣을 이미지 배열을 생성
//  4. 스와이프 객체(왼쪽, 오른쪽)를 만들고 현재 view에 적용
//  5. 스와이프 방향을 분기하여 한번 스와이프할 때 이미지를 전환시키는 함수를 생성
//  6. 스와이프 객체의 액션에 5번에서 만든 함수를 적용

import UIKit

class ViewController: UIViewController {
    // 1~2.
    @IBOutlet weak var imagee: UIImageView!
    // 3.
    var images = ["ggg1.jpg","ggg2.jpg","ggg3.jpg"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 4. 6.
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    // 5.
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
