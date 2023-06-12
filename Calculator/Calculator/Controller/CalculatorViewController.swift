//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var opratorLabel: UILabel!
    @IBOutlet weak var nextValueLabel: UILabel!
    @IBOutlet weak var nextOperatorLabel: UILabel!
    
    var touchedNumber: String = ""
    var calculatingString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        opratorLabel.text = ""
        nextValueLabel.text = ""
    }

    @IBAction func didTapACButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapCEButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        touchedNumber += number
        nextValueLabel.text = touchedNumber
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        nextValueLabel.text = ""
        guard let `operator` = sender.titleLabel?.text else {
            return
        }

        nextOperatorLabel.text = `operator`
    }
}

