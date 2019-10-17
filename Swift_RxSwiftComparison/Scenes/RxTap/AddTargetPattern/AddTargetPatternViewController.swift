//
//  AddTargetPatternViewController.swift
//  Swift_RxSwiftComparison
//
//  Created by 一木 英希 on 2019/10/01.
//  Copyright © 2019 一木 英希. All rights reserved.
//

import UIKit

class AddTargetPatternViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameTextField.addTarget(self, action: #selector(self.nameTextFieldEditingChanged(sender:)), for: .editingChanged)
        self.addressTextField.addTarget(self, action: #selector(self.addressTextFieldEditingChanged(sender:)), for: .editingChanged)
    }
    
    @objc func nameTextFieldEditingChanged(sender: UITextField) {
        guard let changedText = sender.text else { return }
        let limitCount = self.maxNameFieldSize - changedText.count
        self.nameLabel.text = self.limitText(limitCount)
    }
    
    @objc func addressTextFieldEditingChanged(sender: UITextField) {
        guard let changedText = sender.text else { return }
        let limitCount = self.maxAddressFieldSize - changedText.count
        self.addressLabel.text = self.limitText(limitCount)
    }
    
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
