//
//  HomeWorkerTests.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 27/04/20.
//  Copyright (c) 2020 Bank. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TataSantanderBankTest
import XCTest

class HomeWorkerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: HomeWorker!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupHomeWorker()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupHomeWorker()
  {
    sut = HomeWorker()
  }
  
  // MARK: Test doubles
  
  // MARK: Tests
  
  func testSomething()
  {
    // Given
    
    // When
    
    // Then
  }
}