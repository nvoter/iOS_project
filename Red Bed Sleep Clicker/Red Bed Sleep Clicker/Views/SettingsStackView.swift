//
//  SettingsStack.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 13.03.2024.
//

import UIKit

private enum Constants {
}

final class SettingsStackView: UIView {
    let notificationsButton: CustomButton = CustomButton(title: "NOTIFICATIONS", subtitle: "ON")
    private let soundsView: UIImageView = UIImageView(image: UIImage(named: "nameplate"))
    private let soundsLabel: UILabel = UILabel()
    let soundsSlider: UISlider = UISlider()
    let aboutButton: CustomButton = CustomButton(title: "ABOUT")
    private let stack: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stack)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        stack.axis = .vertical
        stack.spacing = 10
        stack.clipsToBounds = true
        
        configureSoundsView()
        
        for view in [notificationsButton, soundsView, aboutButton] {
            stack.addArrangedSubview(view)
            view.setWidth(365)
            view.setHeight(70)
        }
        
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.5
    }
    
    private func configureSoundsView() {
        configureSoundsSlider()
        soundsView.addSubview(soundsSlider)
        soundsSlider.setWidth(250)
        soundsSlider.pinBottom(to: soundsView.bottomAnchor, 10)
        soundsSlider.pinCenterX(to: soundsView)
        configureSoundsLabel()
    }
    
    private func configureSoundsSlider() {
        soundsSlider.minimumValue = 0.0
        soundsSlider.maximumValue = 100.0
        soundsSlider.value = 100.0
        soundsSlider.tintColor = .black
    }
    
    private func configureSoundsLabel() {
        soundsLabel.text = "SOUNDS"
        soundsLabel.font = UIFont.boldSystemFont(ofSize: 20)
        soundsView.addSubview(soundsLabel)
        soundsLabel.pinCenterX(to: soundsView)
        soundsLabel.pinTop(to: soundsView.topAnchor, 10)
    }
}
