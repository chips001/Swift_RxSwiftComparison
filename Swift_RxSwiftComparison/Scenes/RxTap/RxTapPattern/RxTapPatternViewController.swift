//
//  RxTapPatternViewController.swift
//  Swift_RxSwiftComparison
//
//  Created by 一木 英希 on 2019/10/03.
//  Copyright © 2019 一木 英希. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RxTapPatternViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        self.nameTextField.rx.text
            .map { [ weak self ] text -> String? in
                guard let text = text, let maxNameFieldSize = self?.maxNameFieldSize else { return nil }
                let limitCount = maxNameFieldSize - text.count
                return self?.limitText(limitCount)
            }
            .bind(to: self.nameLabel.rx.text)
            .disposed(by: self.disposebag)
        
        self.addressTextField.rx.text
            .map { [ weak self ] text -> String? in
                guard let text = text, let maxAddressFieldSize = self?.maxAddressFieldSize else { return nil }
                let limitCount = maxAddressFieldSize - text.count
                return self?.limitText(limitCount)
            }
            .bind(to: self.addressLabel.rx.text)
            .disposed(by: self.disposebag)
    }
    
    private let disposebag = DisposeBag()
    private let maxNameFieldSize = 10
    private let maxAddressFieldSize = 50
    private let limitText: (Int) -> String = {
        return "あと\($0)文字"
    }
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressTextField: UITextField!
    @IBOutlet weak var addressLabel: UILabel!
    
}
