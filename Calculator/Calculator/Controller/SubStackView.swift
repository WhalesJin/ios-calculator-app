//
//  SubStackView.swift
//  Calculator
//
//  Created by Whales on 2023/06/13.
//

import UIKit

class SubStackView: UIStackView { // 새로운 커스텀 타입
    let latestOperatorLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white // 기본색상 블랙
//        label.translatesAutoresizingMaskIntoConstraints = false // 스택뷰가 알아서 레이아웃 잡아줘서 안해도 된다.
        
        return label
    }()
    
    let latestValueLabel: UILabel = {
        let label = UILabel()
        
        label.textColor = .white // 기본색상 블랙
        
        return label
    }()
    
    init(operatorText: String, valueText: String) {
        super.init(frame: .zero) // frame CGRect의 기본값이 다 0인 애를 .zero
        
        configureSubStackView()
        configureProperty()
        insertTextInToLabel(operatorText: operatorText, valueText: valueText)
    }
    
    // 얘가 문제.... 많이 걸린다... 공부할 게 많아졌다.... (민트랑 상의하기)
    required init(coder: NSCoder) { // 프로톨을 채택하고 있어서 꼭 구현해야하는 init. 이대로 두면 된다. Veiw 커스텀타입
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubStackView() { // 들어갈 애를 미리 그린다. 레이블 두개가 stackView에 들어가도록.
        self.addArrangedSubview(latestOperatorLabel)
        self.addArrangedSubview(latestValueLabel)
    }
    
    func configureProperty() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.axis = .horizontal
        self.alignment = .fill
        self.distribution = .equalSpacing
        self.spacing = 8
    }
    
    func insertTextInToLabel(operatorText: String, valueText: String) {
        self.latestOperatorLabel.text = operatorText
        self.latestValueLabel.text = valueText
    }
}
