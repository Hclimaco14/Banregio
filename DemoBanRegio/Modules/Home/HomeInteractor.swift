//
//  HomeInteractor.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//


import Foundation


protocol HomeBusinessLogic {
    func doSomething(request: Home.Something.Request)
}

class HomeInteractor:  HomeBusinessLogic {
    
    var presenter: HomePresentationLogic?
    
    let worker = HomeWorker()
    
    func doSomething(request: Home.Something.Request) {
        let response = Home.Something.Response()
        presenter?.presentSomething(response: response)
    }
    
}
