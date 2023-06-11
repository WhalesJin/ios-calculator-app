//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var oneButton: UIButton!
    @IBOutlet weak var twoButton: UIButton!
    @IBOutlet weak var threeButton: UIButton!
    @IBOutlet weak var fourButton: UIButton!
    @IBOutlet weak var fiveButton: UIButton!
    @IBOutlet weak var sixButton: UIButton!
    @IBOutlet weak var sevenButton: UIButton!
    @IBOutlet weak var eightButton: UIButton!
    @IBOutlet weak var nineButton: UIButton!
    @IBOutlet weak var doubleZeroButton: UIButton!
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var opratorLabel: UILabel!
    @IBOutlet weak var nextValueLabel: UILabel!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didTapACButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapCEButton(_ sender: UIButton) {
        
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        let touchedNumber: String
        
        switch sender {
        case zeroButton:
            touchedNumber = "0"
        case oneButton:
            touchedNumber = "1"
        case twoButton:
            touchedNumber = "2"
        case threeButton:
            touchedNumber = "3"
        case fourButton:
            touchedNumber = "4"
        case fiveButton:
            touchedNumber = "5"
        case sixButton:
            touchedNumber = "6"
        case sevenButton:
            touchedNumber = "7"
        case eightButton:
            touchedNumber = "8"
        case nineButton:
            touchedNumber = "9"
        case doubleZeroButton:
            touchedNumber = "00"
        default:
            return
        }
        
        nextValueLabel.text = touchedNumber
    }
}

