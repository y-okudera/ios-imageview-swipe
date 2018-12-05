//
//  ViewController.swift
//  ios-imageview-swipe
//
//  Created by YukiOkudera on 2018/12/03.
//  Copyright © 2018 Yuki Okudera. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - Properties
    
    @IBOutlet weak var imageView: UIImageView!
    
    // MARK: - Life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    /// ImageViewがスワイプされた時の処理
    @objc func didSwipeImageView(sender: UISwipeGestureRecognizer) {
        
        var animationOptions: UIView.AnimationOptions
        
        switch sender.direction {
        case .right:
            animationOptions = .transitionFlipFromLeft
        case .left:
            animationOptions = .transitionFlipFromRight
        default:
            return
        }
        
        UIView.transition(with: imageView, duration: 1.0, options: animationOptions, animations: {
            // isHighlightedを反転
            self.imageView.isHighlighted.toggle()
        })
    }
}

extension ViewController {
    
    /// 初期処理
    private func setup() {
        
        // 左右のSwipeGestureを登録する
        let rightSwipe = UISwipeGestureRecognizer(target: self, action: .didSwipeImageView)
        rightSwipe.direction = .right
        imageView.addGestureRecognizer(rightSwipe)
        
        let leftSwipe = UISwipeGestureRecognizer(target: self, action: .didSwipeImageView)
        leftSwipe.direction = .left
        imageView.addGestureRecognizer(leftSwipe)
    }
}

private extension Selector {
    static let didSwipeImageView = #selector(ViewController.didSwipeImageView(sender:))
}
