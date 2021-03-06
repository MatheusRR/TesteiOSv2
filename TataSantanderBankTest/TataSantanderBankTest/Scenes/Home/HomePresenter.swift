//
//  HomePresenter.swift
//  Bank
//
//  Created by Matheus Rodrigues Ribeiro on 25/04/20.
//  Copyright (c) 2020 Bank. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol HomePresentationLogic
{
    func presentStatements(response: Home.StatementList.ViewModel)
    func presentErrorToLoadStatements(error: Home.StatementList.Error)
}

class HomePresenter: HomePresentationLogic
{
  weak var viewController: HomeDisplayLogic?
  
  // MARK: Do something
  
  func presentStatements(response: Home.StatementList.ViewModel)
  {
    viewController?.displayStatements(viewModel: response)
  }
    
    func presentErrorToLoadStatements(error: Home.StatementList.Error) {
        
    }
}
