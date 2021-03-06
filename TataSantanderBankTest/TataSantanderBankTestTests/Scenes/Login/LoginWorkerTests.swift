//
//  LoginWorkerTests.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 26/04/20.
//  Copyright (c) 2020 Bank. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import TataSantanderBankTest
import XCTest

class LoginWorkerTests: XCTestCase
{
  // MARK: Subject under test
  
  var sut: LoginWorker!
  
  // MARK: Test lifecycle
  
  override func setUp()
  {
    super.setUp()
    setupLoginWorker()
  }
  
  override func tearDown()
  {
    super.tearDown()
  }
  
  // MARK: Test setup
  
  func setupLoginWorker()
  {
    sut = LoginWorker()
  }
  
  // MARK: Test doubles
  
  // MARK: Tests
    
//    func validateUser(_ user: String) -> Bool
//    {
//        return user.isCPF || user.isMail
//    }
//
//    func validatePassword(_ password: String) -> Bool {
//        let regex = try! NSRegularExpression(pattern: regexPassword)
//        return regex.firstMatch(in: password, options: [], range: NSRange(location: 0, length: password.count)) != nil
//    }
  
    //CPF correto
    func testValidadeUserRightCPF()
    {
        let cpf = "313.623.730-79"
        XCTAssert(sut.validateUser(cpf) == true)
    }
    
    //E-mail correto
    func testValidadeUserRightMail()
    {
        let mail = "mail@mail.com"
        XCTAssert(sut.validateUser(mail) == true)
    }
    
    //CPF inválido
    func testValidadeUserInvalideCPF()
    {
        let cpf = "313.623.730-78"
        XCTAssert(sut.validateUser(cpf) == false)
    }
    
    //E-mail inválido
    func testValidadeUserInvaliteMail()
    {
        let mail = "mail"
        XCTAssert(sut.validateUser(mail) == false)
    }
    
    //Validar senha
    func testValidadePasswordRight() {
        let password = "Test@1"
        XCTAssert(sut.validatePassword(password) == true)
    }
    
    func testValidadePasswordWrongWithoutUppercase() {
        let password = "test@1"
        XCTAssert(sut.validatePassword(password) == false)
    }
    
    func testValidadePasswordWrongWithoutNumbers() {
        let password = "Test@"
        XCTAssert(sut.validatePassword(password) == false)
    }
    
    func testValidadePasswordWrongWithoutSymbols() {
        let password = "Test1"
        XCTAssert(sut.validatePassword(password) == false)
    }
}
