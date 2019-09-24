//
//  PageViewController.swift
//  Swift_RxSwiftComparison
//
//  Created by 一木 英希 on 2019/09/18.
//  Copyright © 2019 一木 英希. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.setupFirstMenu()
    }
    
    private func setupFirstMenu() {
        self.setViewControllers([PageMenuDataSource.viewControllers[0]], direction: .forward, animated: true, completion: nil)
    }
}

extension PageViewController: UIPageViewControllerDataSource {
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return PageMenuDataSource.viewControllers.count
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        for (currentIndex, element) in zip(PageMenuDataSource.viewControllers.indices, PageMenuDataSource.viewControllers) {
            if type(of: element) == type(of: viewController),
                currentIndex > 0 {
                return PageMenuDataSource.viewControllers[currentIndex - 1]
            }
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        for (currentIndex, element) in zip(PageMenuDataSource.viewControllers.indices, PageMenuDataSource.viewControllers) {
            if type(of: element) == type(of: viewController),
                currentIndex < PageMenuDataSource.viewControllers.count - 1 {
                return PageMenuDataSource.viewControllers[currentIndex + 1]
            }
        }
        return nil
    }
}
