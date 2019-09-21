//
//  ViewController.swift
//  Swift_RxSwiftComparison
//
//  Created by 一木 英希 on 2019/08/24.
//  Copyright © 2019 一木 英希. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        
        let cildViewController = PageViewController.instantiateFromStoryboard()
        self.displayContentViewController(contentViewController: cildViewController, container: self.containerView)
    }
    
    private func displayContentViewController(contentViewController: UIViewController, container: UIView) {
        self.addChild(contentViewController)
        contentViewController.view.frame = container.bounds
        container.addSubview(contentViewController.view)
        contentViewController.didMove(toParent: self)
    }
    
    private func hideContentViewController(contentViewController: UIViewController) {
        contentViewController.willMove(toParent: self)
        contentViewController.view.removeFromSuperview()
        contentViewController.removeFromParent()
    }
    
    @IBOutlet weak var containerView: UIView!
}

