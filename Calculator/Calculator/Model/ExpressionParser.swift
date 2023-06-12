//
//  ExpressionParser.swift
//  Calculator
//
//  Created by Whales on 2023/06/07.
//

import Foundation

enum ExpressionParser {
    static func parse(from input: String) -> Formula {
        var operands: CalculatorItemQueue<Double> = CalculatorItemQueue()
        var operators: CalculatorItemQueue<Operator> = CalculatorItemQueue()
        
        let components = componentsByOperators(from: input)
        let operatorList = Operator.allCases.map { String($0.rawValue) }
        
        components
            .filter { operatorList.contains($0) }
            .compactMap { Operator(rawValue: Character($0)) }
            .forEach { operators.enqueue($0) }
        
        components
            .compactMap { Double($0) }
            .forEach { operands.enqueue($0)}
        
        return Formula(operands: operands, operators: operators)
    }
    
    private static func componentsByOperators(from input: String) -> [String] {
        return input.split(with: " ")
    }
}
