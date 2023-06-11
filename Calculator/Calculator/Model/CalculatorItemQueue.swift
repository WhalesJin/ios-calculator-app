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
    
    @discardableResult
    mutating func dequeue() -> Element? {
        queue.removeFirst()
    }
    
    mutating func clearQueue() {
        queue.removeAll()
    }
}
