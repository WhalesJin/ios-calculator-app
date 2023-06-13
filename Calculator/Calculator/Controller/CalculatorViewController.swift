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
    @IBOutlet weak var statusScrollView: UIScrollView!
    
    var touchedNumber: String = ""
    var calculatingString: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextOperatorLabel.text = ""
        nextValueLabel.text = ""
    }

    @IBAction func didTapACButton(_ sender: UIButton) {
        nextOperatorLabel.text = ""
        nextValueLabel.text = ""
        touchedNumber = ""
        statusStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
        calculatingString = ""
            
        }
    
    @IBAction func didTapCEButton(_ sender: UIButton) {
        nextOperatorLabel.text = ""
        nextValueLabel.text = ""
        touchedNumber = ""
    }
    
    @IBAction func didTapNumberButton(_ sender: UIButton) { // 0으로 시작하면 다른 숫자로 바로
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        if touchedNumber == "0" {
            touchedNumber = number
        } else {
            touchedNumber += number
        }
        
        nextValueLabel.text = touchedNumber
    }
    
    @IBAction func didTapDoubleZeroButton(_ sender: UIButton) { // 00부터 누르면 0으로 표시되게
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        if touchedNumber == "" || touchedNumber == "0" {
            touchedNumber = "0"
        } else {
            touchedNumber += number
        }
        
        nextValueLabel.text = touchedNumber
    }
    
    @IBAction func didTapDotButton(_ sender: UIButton) { // .부터 누르면 0.으로 표시되게
        guard let number = sender.titleLabel?.text else {
            return
        }
        
        if touchedNumber == "" {
            touchedNumber = "0" + number
        } else {
            touchedNumber += number
        }
        
        nextValueLabel.text = touchedNumber
    }
    
    @IBAction func didTapOperatorButton(_ sender: UIButton) {
        guard let nextOperator = nextOperatorLabel.text, let nextValue = nextValueLabel.text else {
            return
        }
        
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
        statusScrollView.layoutIfNeeded() // 위치를 생각해보자
        goToBottomOfScrollView()
        
        var formula = ExpressionParser.parse(from: calculatingString)
        
        nextOperatorLabel.text = ""
        calculatingString = "" // 하나씩 밀리는 오류 해결
    }
    
    private func goToBottomOfScrollView() {
//        statusScrollView.layoutIfNeeded() // 뷰의 레이아웃을 업데이트
        
        statusScrollView
            .scrollRectToVisible(CGRect(x: 0,
                                        y: statusScrollView.contentSize.height - statusScrollView.bounds.height,
                                        width: statusScrollView.bounds.size.width,
                                        height: statusScrollView.bounds.size.height),
                                 animated: true)
    }
}
