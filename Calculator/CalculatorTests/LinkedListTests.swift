//
//  LinkedListTests.swift
//  CalculatorTests
//
//  Created by Whales on 2023/06/03.
//

import XCTest
@testable import Calculator

final class LinkedListTests: XCTestCase {
    var sut: LinkedList<Int>!
    
    override func setUpWithError() throws {
        sut = LinkedList()
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_append함수호출시_list의node개수가_늘어나는지() {
        // given
        let expectation: Int = 3
        // when
        sut.append(data: 1)
        sut.append(data: 2)
        sut.append(data: 3)
        // then
        XCTAssertEqual(sut.count, expectation)
    }
    func test_append함수호출시_list가isEmpty상태이면_data값이_head와tail의data에_들어가는지() {
        // given
        let expectation: Int = 1
        // when
        sut.append(data: 1)
        // then
        XCTAssertEqual(sut.readHeadData(), sut.readTailData(), expectation)
    }
}
