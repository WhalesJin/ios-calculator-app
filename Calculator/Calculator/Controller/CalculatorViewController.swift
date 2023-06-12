//
//  Calculator - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var nextValueLabel: UILabel!
    @IBOutlet weak var nextOperatorLabel: UILabel!
    
    @IBOutlet weak var statusStackView: UIStackView!
    @IBOutlet weak var firstOperatorLabel: UILabel!
    @IBOutlet weak var secondOperatorLabel: UILabel!
    @IBOutlet weak var firstNumberLabel: UILabel!
    @IBOutlet weak var secondNumberLabel: UILabel!
    
    var touchedNumber: String = ""
    var calculatingString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextOperatorLabel.text = ""
        nextValueLabel.text = ""
        firstOperatorLabel.text = ""
        firstNumberLabel.text = ""
        secondOperatorLabel.text = ""
        secondNumberLabel.text = ""
    }

    @IBAction func didTapACButton(_ sender: UIButton) {
        nextOperatorLabel.text = ""
        nextValueLabel.text = ""
        firstOperatorLabel.text = ""
        firstNumberLabel.text = ""
        secondOperatorLabel.text = ""
        secondNumberLabel.text = ""
        
        self.statusStackView.delete(sender)
    }
    
    @IBAction func didTapCEButton(_ sender: UIButton) {
        nextOperatorLabel.text = ""
        nextValueLabel.text = ""
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        touchedNumber += number
        nextValueLabel.text = touchedNumber
    }
    
    @IBAction func didTapZeroButton(_ sender: UIButton) {
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        nextValueLabel.text = touchedNumber + number
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        guard let nextOperator = nextOperatorLabel.text, let nextValue = nextValueLabel.text else {
            return
        }
        
        calculatingString += " " + nextOperator + " " + nextValue
        
        let subStackView = SubStackView(operatorText: nextOperator, valueText: nextValue)
        
        self.statusStackView.addArrangedSubview(subStackView)
        
        nextValueLabel.text = ""
        touchedNumber = ""
        
        guard let `operator` = sender.titleLabel?.text else {
            return
        }

        nextOperatorLabel.text = `operator`
    }
    
    @IBAction func didTapEqualButton(_ sender: UIButton) {
        guard let nextOperator = nextOperatorLabel.text, let nextValue = nextValueLabel.text else {
            return
        }
        
        calculatingString += " " + nextOperator + " " + nextValue
        
        let subStackView = SubStackView(operatorText: nextOperator, valueText: nextValue)
        
        self.statusStackView.addArrangedSubview(subStackView)
        
        var formula = ExpressionParser.parse(from: calculatingString)
        
        nextValueLabel.text = String(formula.result())
        nextOperatorLabel.text = ""
    }
}
