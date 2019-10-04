//
//  RxTapViewController.swift
//  Swift_RxSwiftComparison
//
//  Created by 一木 英希 on 2019/09/03.
//  Copyright © 2019 一木 英希. All rights reserved.
//

import UIKit

class RxTapViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.displayContentViewController(
            contentViewController: AddTargetPatternViewController.instantiateFromStoryboard(), container: self.addTargetPatternContainerView
        )
        
        self.displayContentViewController(
            contentViewController: RxTapPatternViewController.instantiateFromStoryboard(),
            container: self.rxPatternContainerView
        )
    }
    
    @IBOutlet weak var addTargetPatternContainerView: UIView!
    @IBOutlet weak var rxPatternContainerView: UIView!
}
