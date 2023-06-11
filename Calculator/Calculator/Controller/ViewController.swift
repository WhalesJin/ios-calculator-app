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
    @IBOutlet weak var dotButton: UIButton!
    
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var subtractButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var opratorLabel: UILabel!
    @IBOutlet weak var nextValueLabel: UILabel!
    @IBOutlet weak var nextOperatorLabel: UILabel!
    
    var touchedNumber: String = ""
    
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
        let number: String
        
        switch sender {
        case zeroButton:
            number = "0"
        case oneButton:
            number = "1"
        case twoButton:
            number = "2"
        case threeButton:
            number = "3"
        case fourButton:
            number = "4"
        case fiveButton:
            number = "5"
        case sixButton:
            number = "6"
        case sevenButton:
            number = "7"
        case eightButton:
            number = "8"
        case nineButton:
            number = "9"
        case doubleZeroButton:
            number = "00"
        case dotButton:
            number = "."
        default:
            return
        }
        
        touchedNumber += number
        nextValueLabel.text = touchedNumber
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        let `operator`: String
        
        switch sender {
        case addButton:
            `operator` = "+"
        case subtractButton:
            `operator` = "−"
        case divideButton:
            `operator` = "÷"
        case multiplyButton:
            `operator` = "×"
        default:
            return
        }
        
        nextOperatorLabel.text = `operator`
    }
}

