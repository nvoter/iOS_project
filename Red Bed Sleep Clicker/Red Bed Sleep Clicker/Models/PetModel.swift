//
//  Character.swift
//  Red Bed Sleep Clicker
//
//  Created by Анастасия on 14.03.2024.
//

import UIKit

#warning("TODO: make it structure")

final class PetModel {
    var name: String // имя
    var hp: Int // хп
    var cheerfulness: Int // бодрость
    var awake: Bool // бодрствует или спит
    var sleepingImage: UIImage? // картинка спящего
    var awakeImage: UIImage? // картинка неспящего
    
    var image: UIImage? {
        if (awake) {
            return awakeImage
        } else {
            return sleepingImage
        }
    }
    
    init(
        name: String,
        hp: Int = 100,
        cheerfulness: Int = 100,
        awake: Bool = true,
        sleepingImage: UIImage?,
        awakeImage: UIImage?
    ) {
        self.name = name
        self.hp = hp
        self.cheerfulness = cheerfulness
        self.awake = awake
        self.sleepingImage = sleepingImage
        self.awakeImage = awakeImage
    }
}
