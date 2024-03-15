//
//  RoomsPresenter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 12.03.2024.
//

import UIKit

protocol PresentationLogic {
    func presentStart()
}

final class Presenter: PresentationLogic {
     var vc: DisplayLogic?
    
    func presentStart() {
        vc?.displayStart()
    }
}

