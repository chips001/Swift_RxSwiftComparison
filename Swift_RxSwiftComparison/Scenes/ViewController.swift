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
    
    @IBOutlet weak var containerView: UIView!
}

