//
//  Formula.swift
//  Calculator
//
//  Created by Whales on 2023/06/07.
//

struct Formula {
    var operands: CalculatorItemQueue<Double>
    var operators: CalculatorItemQueue<Operator>
    
    mutating func result() throws -> Double {
        guard var result = operands.dequeue() else { return 0 }
        while let `operator` = operators.dequeue(),
              let operand = operands.dequeue() {
            result = `operator`.calculate(lhs: result, rhs: operand)
        }
        
        return result
    }
}
