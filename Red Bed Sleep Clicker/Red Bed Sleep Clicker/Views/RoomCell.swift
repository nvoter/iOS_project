//
//  RoomCell.swift
//  Sleep Clicker
//
//  Created by Анастасия on 27.02.2024.
//

import UIKit

class RoomCell: UICollectionViewCell {
    static let roomCellId = "roomCell"
    
    var character: PetModel?
    
    let charactersName: UILabel = {
        return UILabel()
    }()
    
    let charactersImage: UIImageView = {
        return UIImageView()
    }()
    
    let charactersHP: UILabel = {
        return UILabel()
    }()
    
    let charactersCheerfulness: UILabel = {
        return UILabel()
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with model: PetModel) {
        let character = model
        charactersName.text = character.name
        charactersHP.text = "HP: \(character.hp)"
        charactersCheerfulness.text = "Cheerfulness: \(character.cheerfulness)"
        charactersImage.image = character.image
        self.character = character
    }
    
    func changeCharacterStatement() {
        guard let model = character else {
            return
        }
        if (model.awake) {
            model.awake = false
            charactersImage.image = model.sleepingImage
        } else {
            model.awake = true
            charactersImage.image = model.awakeImage
        }
    }
    
    private func configure() {
        configureCharactersName()
//        configureCharactersHP()
//        configureCharactersCheerfulness()
        configureCharactersImage()
    }
    
    private func configureCharactersName() {
        addSubview(charactersName)
        charactersName.pinCenterX(to: self)
    }
    
//    private func configureCharactersHP() {
//        addSubview(charactersHP)
//        charactersHP.pinLeft(to: self)
//        charactersHP.pinBottom(to: self.bottomAnchor, 30)
//    }
//    
//    private func configureCharactersCheerfulness() {
//        addSubview(charactersCheerfulness)
//        charactersCheerfulness.pinCenterX(to: self)
//        charactersCheerfulness.pinBottom(to: self.bottomAnchor, 10)
//    }
    
    private func configureCharactersImage() {
        addSubview(charactersImage)
        charactersImage.pinCenterX(to: self)
        charactersImage.pinTop(to: self.topAnchor, 15)
        charactersImage.setWidth(140)
        charactersImage.setHeight(140)
        charactersName.pinTop(to: charactersImage.bottomAnchor, 10)
    }

}
