//
//  LoginInteractor.swift
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

protocol LoginBusinessLogic
{
    func doLogin(request: Login.UserData.Request)
    func fetchLoggedUser() -> String?
}

protocol LoginDataStore
{
    var response: Login.UserData.Response? { get }
}

class LoginInteractor: LoginBusinessLogic, LoginDataStore
{
    var response: Login.UserData.Response?
    var presenter: LoginPresentationLogic?
    var worker: LoginWorker?
    var userWorker: UserWorker = UserWorker(store: UserService())

    // MARK: Do something

    func doLogin(request: Login.UserData.Request)
    {
        worker = LoginWorker()
        if (worker!.validateUser(request.user) && worker!.validatePassword(request.password)) {
            self.userWorker.login(user: request.user, password: request.password) { (response) in
                guard let userId = response.userAccount.userId,
                      let name = response.userAccount.name,
                      let agency = response.userAccount.agency,
                      let account = response.userAccount.bankAccount,
                      let balance = response.userAccount.balance else {
                        let error = Login.UserData.Error(title: "Error", message: response.error.message ?? "There was an error in login, please try again")
                        self.presenter?.presentError(error: error)
                        return
                }
                let response = Login.UserData.Response(id: userId, name: name, agency: agency, account: account, balance: balance)
                self.userWorker.storeUsername(user: request.user)
                self.response = response
                self.presenter?.presentLoginSucess(response: response)
            }
        }else{
            let resposeError = Login.UserData.Error(title: "Error", message: "User or password incorrect.")
            presenter?.presentError(error: resposeError)
        }
    }
    
    func fetchLoggedUser() -> String? {
        return userWorker.getUser()
    }
}
