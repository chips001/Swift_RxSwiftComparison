//
//  PageMenuKindViewController.swift
//  Swift_RxSwiftComparison
//
//  Created by 一木 英希 on 2019/09/18.
//  Copyright © 2019 一木 英希. All rights reserved.
//

import UIKit

struct PageMenuDataSource {
    
    static var viewControllers: [UIViewController] {
        
        var controllers: [UIViewController] = []
        
        controllers.append(RxTapViewController.instantiateFromStoryboard())
        controllers.append(RxTestViewController.instantiateFromStoryboard())
                
        return controllers
    }
}
