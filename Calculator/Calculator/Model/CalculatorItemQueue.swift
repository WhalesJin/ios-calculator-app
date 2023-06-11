//
//  CalculatorItemQueue.swift
//  Calculator
//
//  Created by Whales on 2023/05/31.
//

import UIKit

struct CalculatorItemQueue<Element: CalculateItem>: Queueable {
    private(set) var queue: LinkedList = LinkedList<Element>()
    
    var count: Int {
        return queue.count
    }
    
    var isEmpty: Bool {
        return queue.isEmpty
    }
    
    var firstData: Element? {
        return queue.headData
    }
    
    var lastData: Element? {
        return queue.tailData
    }
    
    mutating func enqueue(_ element: Element) {
        queue.append(data: element)
    }
    
    mutating func dequeue() throws -> Element {
        guard let data = queue.headData else {
            throw CalculatorError.invalidData
        }
        queue.removeFirst()
        return data
    }
    
    mutating func clearQueue() {
        queue.removeAll()
    }
}
