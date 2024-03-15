//
//  RoomsRouter.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 14.03.2024.
//

import UIKit

final class RoomsRouter: RoomsRoutingLogic {
    
    weak var view: UIViewController?
    
    func routeToSettings() {
        let vc = SettingsViewController()
        view?.navigationController?.pushViewController(vc, animated: false)
    }
}
