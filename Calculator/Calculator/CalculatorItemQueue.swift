//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Whales on 2023/05/31.
//

import UIKit

struct CalculatorItemQueue<CalculatorItem> {
    private var calculatorItemQueue: [CalculatorItem] = []
    
    var count: Int {
        return calculatorItemQueue.count
    }
    
    var isEmpty: Bool {
        return calculatorItemQueue.isEmpty
    }
    
    mutating func enqueue(_ element: CalculatorItem) {
        calculatorItemQueue.append(element)
    }
    
    mutating func dequeue() {
        calculatorItemQueue.removeFirst()
    }
    
    mutating func clearQueue() {
        calculatorItemQueue.removeAll()
    }
    
    func readCalculatorItemQueue() -> [CalculatorItem] {
        return calculatorItemQueue
    }
}
