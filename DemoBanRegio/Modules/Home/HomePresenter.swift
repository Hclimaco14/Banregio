//
//  HomePresenter.swift
//  DemoBanRegio
//
//  Created by Hector Climaco on 08/09/22.
//  
//

import UIKit

protocol HomePresentationLogic {
    func presentSomething(response: Home.Something.Response)
}

class HomePresenter: HomePresentationLogic {
    
    var view: HomeDisplayLogic?
    
    func presentSomething(response: Home.Something.Response) {
        let viewModel = Home.Something.ViewModel()
        view?.displaySomething(viewModel: viewModel)
    }
}
