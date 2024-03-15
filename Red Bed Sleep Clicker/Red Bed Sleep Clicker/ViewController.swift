//
//  ViewController.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 02.03.2024.
//

import UIKit

class ViewController: UIViewController {
    let menuBar = MenuBar()
    let titleLabel = CustomTitle(titleText: "characters")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(menuBar)
        view.addSubview(titleLabel)
        menuBar.pinBottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        menuBar.pinCenterX(to: view)
        menuBar.setHeight(70)
        menuBar.setWidth(365)
        titleLabel.pinCenterX(to: view)
        titleLabel.pinTop(to: view.safeAreaLayoutGuide.topAnchor)
        
    }
}
