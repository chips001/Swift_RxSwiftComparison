//
//  UIViewControler+Util.swift
//  Swift_RxSwiftComparison
//
//  Created by 一木 英希 on 2019/08/27.
//  Copyright © 2019 一木 英希. All rights reserved.
//

import UIKit

extension UIViewController {
    
    class func instantiateFromStoryboard() -> Self {
        return self._instantiateFromStoryboard()
    }
    
    class func storyboard() -> UIStoryboard {
        return UIStoryboard(name: String(describing: self), bundle: nil)
    }
    
    private class func _instantiateFromStoryboard<T: UIViewController>() -> T {
        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        let controller = storyboard.instantiateInitialViewController() as? T
        if controller == nil {
            assert(false, "生成したいViewControllerと同じ名前のStorybaordが見つからないか、Initial ViewControllerに設定されていない可能性があります。")
        }
        return controller!
    }
    
    func displayContentViewController(contentViewController: UIViewController, container: UIView) {
        self.addChild(contentViewController)
        contentViewController.view.frame = container.bounds
        container.addSubview(contentViewController.view)
        contentViewController.didMove(toParent: self)
    }
    
    func hideContentViewController(contentViewController: UIViewController) {
        contentViewController.willMove(toParent: self)
        contentViewController.view.removeFromSuperview()
        contentViewController.removeFromParent()
    }
}
